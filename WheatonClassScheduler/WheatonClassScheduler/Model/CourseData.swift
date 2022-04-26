//
//  CourseManagerModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/25/22.
//

import Foundation

protocol CourseDataDelegate {
    func courseDataDidUpdate (_ courseData: CourseData)
    func courseDataDidFailWithError (error: Error)
}

class CourseData {
    
    var coursesDataModel = CoursesDataModel.coursesDataModel
    
    var delegate: CourseDataDelegate?
    
    let url = "https://raw.githubusercontent.com/pricejoshua/course-catalog-api/master/data/classes.cache.json"
    
    func performRequest() {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handleCompletion(data:response:error:))
           
            task.resume()
        }
    }
    
    
    func handleCompletion(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            delegate?.courseDataDidFailWithError(error: error!)
            return
        }

        guard let data = data else {
            //print(error.debugDescription)
            delegate?.courseDataDidFailWithError(error: error!)
            return
        }
//        if let dataString = String(data: data, encoding: .utf8) {
//            print(dataString)
//        }
        if let courses = parseData(courseData: data) {
            self.delegate?.courseDataDidUpdate(self)
        }
        
    }
    
    func parseData(courseData: Data) -> CoursesDataModel? {
        print(courseData)
        do {
            let parsedCourses = try JSONDecoder().decode(Courses.self, from: courseData)
            var courses = [CourseModel]()
            for c in parsedCourses.wheaton.classes {
                courses.append(CourseModel(termID: c.termID, subject: c.subject, classID: c.classID, name: c.name, attributes: c.classAttributes, sections: []))
//                if let foo = array.first(where: {$0.name == "foo"}) {
//                   // do something with foo
//                } else {
//                   // item could not be found
//                }
            }
            
            coursesDataModel.setCourses(courses: courses)
            
            var sections = [SectionModel]()
            var location: String
            for s in parsedCourses.wheaton.sections {
                if s.meetings.count == 1{
                    location = s.meetings[0].meetingWhere
                } else {
                    location = "None"
                }
                var meetings = [MeetingTime]()
                for m in s.meetings {
                    print(type(of: m.times))
                    for (day, ts) in m.times {
                        meetings.append(MeetingTime(dayOfWeek: Int(day)!, startTime: getTime(time: ts[0].start), endTime: getTime(time: ts[0].end)))
                        print(meetings)
                    }
                }
                sections.append(SectionModel(meetingTimes: meetings, seatsCapacity: s.seatsCapacity, seatsRemaining: s.seatsRemaining, waitCapacity: s.waitCapacity, waitRemaining: s.waitRemaining, profs: s.profs, location: location, crn: s.crn, course: coursesDataModel.getCourseById(subject: s.subject, classID: s.classID)!))
                print()
            }
            
            coursesDataModel.sections = sections
            print()
//            print(parsedCourses.wheaton.sections.first?.meetings[0].times)
//            
//            
//            print(parsedCourses.wheaton.sections.first?.meetings)
            
        } catch {
            self.delegate?.courseDataDidFailWithError(error: error)
        }
        return nil
    }
    
    func getTime(time: End) -> Int?{
        var timeToReturn: Int?
        switch time {
        case .integer(let t):
            timeToReturn = t
        case .string(_):
            timeToReturn = nil
        }
        return timeToReturn
    }
}

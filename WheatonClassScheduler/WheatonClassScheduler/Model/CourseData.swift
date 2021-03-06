//
//  CourseManagerModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/25/22.
//

import Foundation
import Disk

protocol CourseDataDelegate {
    func courseDataDidUpdate (_ courseData: CourseData)
    func courseDataDidFailWithError (error: Error)
}

class CourseData {
    
    var coursesDataModel = CoursesDataModel.coursesDataModel
    
    var delegate: CourseDataDelegate?
    
    let url = "https://raw.githubusercontent.com/pricejoshua/course-catalog-api/master/data/classes.cache.json"
    
    func loadData() {
        var courses: CoursesDataModel!
        do {
            // get courses from cache
            courses = try Disk.retrieve("courses", from: .caches, as: CoursesDataModel.self)
            if (courses.date - Date()).day! > 2 {
                print("requesting data")
                performRequest()
            } else {
                print("loaded data")
                CoursesDataModel.coursesDataModel.setCoursesDataModel(coursesDataModel: courses)
            }
        } catch {
            print(error)
            performRequest()
        }
    }
    
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
        if parseData(courseData: data) {
            coursesDataModel.date = Date()
            print("here")
            do {
                try Disk.save(coursesDataModel, to: .caches, as: "courses")
                print("saved")
            } catch {
                print(error)
            }
            self.delegate?.courseDataDidUpdate(self)
        }
        
    }
    
    func parseData(courseData: Data) -> Bool {
        print(courseData)
        do {
            let parsedCourses = try JSONDecoder().decode(Courses.self, from: courseData)
            var courses = [String: [CourseModel]]()
            var terms = Set<String>()
            for c in parsedCourses.wheaton.classes {
                terms.insert(c.termID)
                if (courses[c.termID] == nil) {
                    courses[c.termID] = [CourseModel]()
                }
                
           
            
                
                courses[c.termID]?.append(CourseModel(termID: c.termID, subject: c.subject, classID: c.classID, name: c.name, attributes: c.classAttributes, sections: []))
//                if let foo = array.first(where: {$0.name == "foo"}) {
//                   // do something with foo
//                } else {
//                   // item could not be found
//                }
            }
            
            coursesDataModel.setCourses(courses: courses)
            print(terms)
            let latestTerm = terms.sorted().last!
            print(latestTerm)
            coursesDataModel.initTerms()
            coursesDataModel.setCurrentTerm(term: latestTerm)
            print(coursesDataModel.currentTerm)
            
            
            var sections = [String: [SectionModel]]()
            var location: String
            for s in parsedCourses.wheaton.sections {
                if s.meetings.count == 1{
                    location = s.meetings[0].meetingWhere
                } else {
                    location = "None"
                }
                var meetings = [MeetingTime]()
                for m in s.meetings {
                    for (day, ts) in m.times {
                        meetings.append(MeetingTime(dayOfWeek: Int(day)!, startTime: getTime(time: ts[0].start), endTime: getTime(time: ts[0].end)))
                    }
                }
                if (sections[s.termID] == nil) {
                    sections[s.termID] = [SectionModel]()
                }
                

                if let course = coursesDataModel.getCourseById(term: s.termID, subject: s.subject, classID: s.classID){
                    sections[s.termID]?.append(SectionModel(meetingTimes: meetings, seatsCapacity: s.seatsCapacity, seatsRemaining: s.seatsRemaining, waitCapacity: s.waitCapacity, waitRemaining: s.waitRemaining, profs: s.profs, location: location, crn: s.crn, course: course))
                }
            }
            
            coursesDataModel.sections = sections
            print(coursesDataModel.getTerms(), coursesDataModel.getTermName(term: "202208"))
            print("Done")
//            print(parsedCourses.wheaton.sections.first?.meetings[0].times)
//            
//            
//            print(parsedCourses.wheaton.sections.first?.meetings)

        } catch {
            self.delegate?.courseDataDidFailWithError(error: error)
        }
        return true
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

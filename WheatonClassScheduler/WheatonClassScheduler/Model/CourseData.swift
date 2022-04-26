//
//  CourseManagerModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/25/22.
//

import Foundation

protocol CourseDataDelegate {
    func courseDataDidUpdate (_ courseData: CourseData, courses: CoursesDataModel)
    func courseDataDidFailWithError (error: Error)
}

class CourseData {
    var courseList: [CourseModel]!
    var sections: [SectionModel]!
    
    var delegate: CourseDataDelegate?
    
    let url = "https://raw.githubusercontent.com/pricejoshua/course-catalog-api/master/data/classes.cache.json"
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
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
            self.delegate?.courseDataDidUpdate(self, courses: courses)
        }
        
    }
    
    func parseData(courseData: Data) -> CoursesDataModel? {
        let parsedCourses = try? JSONDecoder().decode(Courses.self, from: courseData)
        
    }
}

//
//  AllCoursesModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/25/22.
//

import Foundation

class CoursesDataModel {
    var courses: [CourseModel]!
    var sections: [SectionModel]!
    
    init () {
        self.courses = [CourseModel]()
        self.sections = [SectionModel]()
    }
    
    func setCourses(courses: [CourseModel]) {
        self.courses = courses
    }
    
    func getCourses() -> [CourseModel] {
        return courses
    }
    
    func getSections() -> [SectionModel] {
        return sections
    }
    
    func getCourseById(subject: String, classID: String) -> CourseModel? {
        return courses.first(where: {c in c.subject == subject && c.classID == classID})
    }
}

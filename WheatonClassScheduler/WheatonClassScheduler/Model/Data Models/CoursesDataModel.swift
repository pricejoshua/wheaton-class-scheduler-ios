//
//  AllCoursesModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/25/22.
//

import Foundation


class CoursesDataModel {
    var courses: [String: [CourseModel]]!
    var sections: [String: [SectionModel]]!
    
    static let coursesDataModel = CoursesDataModel()
    
    init () {
        self.courses = [String: [CourseModel]]()
        self.sections = [String: [SectionModel]]()
    }
    
    func setCourses(courses: [String: [CourseModel]]) {
        self.courses = courses
    }
    
    func getCourses(term: String) -> [CourseModel] {
        return courses[term]!
    }
    
    func getSectionsByTerm(term: String) -> [SectionModel] {
        return sections[term]!
    }
    
    func getCourseById(term: String, subject: String, classID: String) -> CourseModel? {
        return courses[term]!.first(where: {c in c.subject == subject && c.classID == classID})
    }
}

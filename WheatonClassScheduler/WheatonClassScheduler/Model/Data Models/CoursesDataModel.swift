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
    
    var terms: [String: String]
    
    static let coursesDataModel = CoursesDataModel()
    
    init () {
        self.courses = [String: [CourseModel]]()
        self.sections = [String: [SectionModel]]()
        self.terms = [String: String]()
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
    
    func initTerms() {
        for (k, _) in courses {
            terms[k] = getTermName(term: k)
        }
    }
    
    func getTerms() -> [String]{
        return [String](terms.keys)
    }
    
    func getAllTerms() -> [String: String]{
        return terms
    }
    
    func getTermName(term: String) -> String {
        let year = term.prefix(4)
        print(year)
        let sem = term.suffix(2)
        print(sem)
        
        var semester = ""
        switch sem {
        case "08":
            semester = "Fall"
        case "01":
            semester = "Spring"
        case "05":
            semester = "Summer"
        default:
            semester = "Unknown"
        }
        
        return semester + String(year)
    }
}

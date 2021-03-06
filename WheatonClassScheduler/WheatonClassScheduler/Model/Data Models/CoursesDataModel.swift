//
//  AllCoursesModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/25/22.
//

import Foundation


class CoursesDataModel: Codable {
    var date: Date!
    
    var courses: [String: [CourseModel]]!
    var sections: [String: [SectionModel]]!
    
    var selectedSections: [Int]
    
    var terms: [String: String]
    var currentTerm: String
    
    static let coursesDataModel = CoursesDataModel()
    
    init () {
        self.courses = [String: [CourseModel]]()
        self.sections = [String: [SectionModel]]()
        self.terms = [String: String]()
        self.selectedSections = [Int]()
        self.currentTerm = ""
    }
    
    func setCoursesDataModel(coursesDataModel: CoursesDataModel) {
        CoursesDataModel.coursesDataModel.setCourses(courses: coursesDataModel.courses)
        CoursesDataModel.coursesDataModel.setSections(sections: coursesDataModel.sections)
        CoursesDataModel.coursesDataModel.setTerms(terms: coursesDataModel.terms)
        CoursesDataModel.coursesDataModel.setSelectedSections(selectedSections: coursesDataModel.selectedSections)
        CoursesDataModel.coursesDataModel.setCurrentTerm(term: coursesDataModel.currentTerm)
    }
    
    func setCourses(courses: [String: [CourseModel]]) {
        self.courses = courses
    }
    
    func setSections(sections: [String: [SectionModel]]){
        self.sections = sections
    }
    
    func setTerms(terms: [String: String]) {
        self.terms = terms
    }
    
    func getCourses(term: String) -> [CourseModel] {
        return courses[term]!
    }
    
    func getCourses() -> [CourseModel] {
        return courses[self.currentTerm]!
    }
    
    func getSections() -> [SectionModel] {
        return sections[self.currentTerm]!
    }
    
    func setCurrentTerm(term: String) {
        self.selectedSections = []
        self.currentTerm = term
    }
    
    func getSectionsByTerm(term: String) -> [SectionModel] {
        return sections[term]!
    }
    
    func getCourseById(term: String, subject: String, classID: String) -> CourseModel? {
        return courses[term]!.first(where: {c in c.subject == subject && c.classID == classID})
    }
    
    func setSelectedSections(selectedSections: [Int]){
        self.selectedSections = selectedSections
    }
    
    func initTerms() {
        print(courses)
        for (k, _) in courses {
            terms[k] = getTermName(term: k)
        }
    }
    
    func getTerms() -> [String]{
        var ts = [String]()
        for (k, _) in terms {
            ts.append(k)
        }
        return ts
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
            semester = "Fall "
        case "01":
            semester = "Spring "
        case "05":
            semester = "Summer "
        default:
            semester = "Unknown "
        }
        
        return semester + String(year)
    }
}

//
//  CourseModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/9/22.
//

import Foundation
class CourseModel {
    
    let termID, subject, classID, searchTerms, name: String
    let attributes: [String]
    let coreqs, prereqs: [String]
    let sections: [SectionModel]
    
    init(termID: String, subject: String, classID: String, searchTerms: String, name: String, attributes: [String], coreqs: [String], prereqs: [String], sections: [SectionModel]) {
        self.termID = termID
        self.subject = subject
        self.classID = classID
        self.searchTerms = searchTerms
        self.name = name
        self.attributes = attributes
        self.coreqs = coreqs
        self.prereqs = prereqs
        self.sections = sections
    }
}

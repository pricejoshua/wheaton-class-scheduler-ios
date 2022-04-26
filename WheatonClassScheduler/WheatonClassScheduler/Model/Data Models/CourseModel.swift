//
//  CourseModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/9/22.
//

import Foundation

protocol CourseModelDelegate {
    func courseModelDidUpdate()
}

class CourseModel {
    
    let termID, subject, classID, searchTerms, name: String
    let attributes: [String]
//    let coreqs, prereqs: [String]
    var sections: [SectionModel]
    var uid: String
    
    init(termID: String, subject: String, classID: String, name: String, attributes: [String], /* coreqs: [String], prereqs: [String], */sections: [SectionModel]) {
        self.termID = termID
        self.subject = subject
        self.classID = classID
        self.name = name
        self.attributes = attributes
//        self.coreqs = coreqs
//        self.prereqs = prereqs
        self.sections = sections
        self.searchTerms = subject+" "+classID
        let str = termID+subject+classID
        self.uid = str+String(str.hashValue)
    }
    
    func addSection(meetingTimes: [MeetingTime], seatsCapacity: Int, seatsRemaining: Int, waitCapacity: Int, waitRemaining: Int, profs: [String], location: String) -> CourseModel{
        sections.append(SectionModel(meetingTimes: meetingTimes, seatsCapacity: seatsCapacity, seatsRemaining: seatsRemaining, waitCapacity: waitCapacity, waitRemaining: waitRemaining, profs: profs, location: location, course: self))
        return self
    }
    
    func addSections(secs: [SectionModel]) -> CourseModel {
        for s in secs {
            sections.append(s)
        }
        return self
    }
    
    func getSections() -> [SectionModel] {
        return sections
    }
}

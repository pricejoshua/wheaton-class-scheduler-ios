//
//  CourseModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/9/22.
//

import Foundation

//var tags = ["AIS", "AAQR", "CAP", "CT", "DUS", "EVSB", "EVSG", "EVSS", "FYS", "GNED", "GPB", "GPA", "GP", "HP", "HAMR", "LANG", "DVRS", "LE", "NT", "OT", "PI", "SIP", "SLAB", "SUPR", "SP", "SHAR", "SI", "THEM", "VPAM", "VPAT", "VPAV", "VPA", "WELL", "WRT"]

var tags = ClassAttribute.allCases.map({ a -> String in
        if a != .noAttributeInformationAvailable {
            var str = a.rawValue.split(separator: " ").last
            return String(str!)
        }
        return ""
    })


class CourseModel: Codable {
    
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
    
    func addSection(meetingTimes: [MeetingTime], seatsCapacity: Int, seatsRemaining: Int, waitCapacity: Int, waitRemaining: Int, profs: [String], location: String, crn: String) -> CourseModel{
        sections.append(SectionModel(meetingTimes: meetingTimes, seatsCapacity: seatsCapacity, seatsRemaining: seatsRemaining, waitCapacity: waitCapacity, waitRemaining: waitRemaining, profs: profs, location: location, crn: crn, course: self))
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

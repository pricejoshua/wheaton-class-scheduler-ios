//
//  SectionModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/9/22.
//

import Foundation

struct SectionModel {
    
    let termID, crn, classID, subject, name: String
    let startTime: Date
    let endTime: Date
    let seatsCapacity, seatsRemaining, waitCapacity, waitRemaining: Int
    let profs: [String]
    
    let searchTerms: String
    
    init(termID: String, crn: String, classID: String, subject: String, name: String, startTime: Date, endTime: Date, seatsCapacity: Int, seatsRemaining: Int, waitCapacity: Int, waitRemaining: Int, profs: [String]) {
        self.termID = termID
        self.crn = crn
        self.classID = classID
        self.subject = subject
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
        self.seatsCapacity = seatsCapacity
        self.seatsRemaining = seatsRemaining
        self.waitCapacity = waitCapacity
        self.waitRemaining = waitRemaining
        self.profs = profs
        var temp = subject+" "+classID+name
        for p in profs {
            temp += temp + p
        }
        self.searchTerms = temp
    }
    
}

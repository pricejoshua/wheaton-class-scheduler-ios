//
//  SectionModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/9/22.
//

import Foundation

struct SectionStructure: Codable {
    let term: String
    let subject: String
    let classId: Int
    let crn: Int
    let seatsCapacity: Int
    let seatsRemaining: Int
    let waitCapacity: Int
    let waitRemaining: Int
    let profs: [String]
    let meetings: [Meetings]
}

struct Meetings: Codable {
    let startDate: Int
    let endDate: Int
    let `where`: String
    let times: [Days]
}

struct Days: Codable {
    let sun, mon, tue, wed, thu, fri, sat: Times?
    
    private enum CodingKeys : String, CodingKey { case sun = "0", mon = "1",  tue = "2", wed = "3", thu = "4", fri = "5", sat = "6"}
    
}

struct Times: Codable {
    let start: Int
    let end: Int
}

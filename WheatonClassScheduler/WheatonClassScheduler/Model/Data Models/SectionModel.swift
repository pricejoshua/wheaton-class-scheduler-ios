//
//  SectionModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/9/22.
//

import Foundation

struct SectionModel {
    
    let startTime: Date
    let endTime: Date
    let seatsCapacity, seatsRemaining, waitCapacity, waitRemaining: Int
    let profs: [String]
    let course: CourseModel
    var name: String{
        get {
            course.name
        }
    }
    var termID: String{
        get {
            course.termID
        }
    }
    var subject: String{
        get {
            course.subject
        }
    }
    var classID: String{
        get {
            course.classID
        }
    }

    
    init(startTime: Date, endTime: Date, seatsCapacity: Int, seatsRemaining: Int, waitCapacity: Int, waitRemaining: Int, profs: [String], course: CourseModel) {
        self.startTime = startTime
        self.endTime = endTime
        self.seatsCapacity = seatsCapacity
        self.seatsRemaining = seatsRemaining
        self.waitCapacity = waitCapacity
        self.waitRemaining = waitRemaining
        self.profs = profs
        self.course = course
    }
    
}

//
//  SectionModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/9/22.
//

import Foundation

class SectionModel: CourseModel {
    
    let startTime: Date
    let endTime: Date
    let seatsCapacity, seatsRemaining, waitCapacity, waitRemaining: Int
    let profs: [String]
    
    init(startTime: Date, endTime: Date, seatsCapacity: Int, seatsRemaining: Int, waitCapacity: Int, waitRemaining: Int, profs: [String]) {
        self.startTime = startTime
        self.endTime = endTime
        self.seatsCapacity = seatsCapacity
        self.seatsRemaining = seatsRemaining
        self.waitCapacity = waitCapacity
        self.waitRemaining = waitRemaining
        self.profs = profs
    }
    
}

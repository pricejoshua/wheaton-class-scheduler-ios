//
//  SectionModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/9/22.
//

import Foundation

struct SectionModel {
    
    let termID, crn, classID, subject: String
    let startTime: Date
    let endTime: Date
    
    let seatsCapacity, seatsRemaining, waitCapacity, waitRemaining: Int
    let profs: [String]

    
    
    
}

//
//  JSONStructure.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/9/22.
//

import Foundation
struct JSONStructure: Codable {
    let wheaton: Wheaton
}

struct Wheaton: Codable {
    let classes: [ClassStructure]
    let sections: [SectionStructure]
    let subjects: [String:String]
}

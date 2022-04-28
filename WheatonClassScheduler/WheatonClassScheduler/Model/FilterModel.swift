//
//  FilterViewModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/27/22.
//

import Foundation

protocol FilterOptionsDelegate {
    func filterOptionsDidUpdate(selectedOptions: FiltersSelectedOptions)
}

class SearchOptions {
    init(subject: Bool, classID: Bool, course: Bool, profs: Bool, name: Bool) {
        self.subject = subject
        self.classID = classID
        self.course = course
        self.profs = profs
        self.name = name
    }
    
    var subject: Bool
    var classID: Bool
    var course: Bool
    var profs: Bool
    var name: Bool
}


struct FiltersSelectedOptions {
    
    var searchBy: SearchOptions
    var tags = [String]()
    var term: String

}

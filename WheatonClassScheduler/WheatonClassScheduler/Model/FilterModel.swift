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

enum SearchOptions: Int, CaseIterable {
    case subject
    case classID
    case name
    case profs
    case course
}

class FiltersSelectedOptions {
    
    init(searchBy: [SearchOptions: Bool], tags: [String] = [String](), term: String = "") {
        self.searchBy = searchBy
        self.tags = tags
        self.term = term
    }
    
    
    var searchBy: [SearchOptions: Bool]
    var tags = [String]()
    var term: String = ""

}

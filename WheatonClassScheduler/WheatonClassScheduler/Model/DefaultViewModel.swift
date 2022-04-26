//
//  DefaultViewModel.swift
//  JZCalendarViewExample
//
//  Created by Jeff Zhang on 3/4/18.
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import UIKit
import JZCalendarWeekView

class DefaultViewModel: NSObject {

    private let firstDate = Date().add(component: .hour, value: 1)
    private let secondDate = Date().add(component: .day, value: 1)
    private let thirdDate = Date().add(component: .day, value: 2)
    
    
    lazy var events = [SectionEvent(id: "0", title: "T", startDate: Date().getDayOfWeekByIndex(1).add(component: .second, value: 51300), endDate: Date().getDayOfWeekByIndex(1).add(component: .second, value: 55500), location: "BGC")]

    lazy var eventsByDate = JZWeekViewHelper.getIntraEventsByDate(originalEvents: events)

//    var currentSelectedData: OptionsSelectedData!
}

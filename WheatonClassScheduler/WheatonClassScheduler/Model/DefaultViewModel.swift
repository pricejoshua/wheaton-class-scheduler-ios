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

    
    var courses = [CourseModel]()
    var sections = [SectionModel]()
    var events = [SectionEvent]()
    
    private let firstDate = Date().add(component: .hour, value: 1)
    private let secondDate = Date().add(component: .day, value: 1)
    private let thirdDate = Date().add(component: .day, value: 2)
    
    
//    lazy var events = [SectionEvent(id: "0", title: "T", startDate: Date().getDayOfWeekByIndex(1).add(component: .second, value: 51300), endDate: Date().getDayOfWeekByIndex(1).add(component: .second, value: 55500), location: "BGC")]
    
//    lazy var events

    lazy var eventsByDate = JZWeekViewHelper.getIntraEventsByDate(originalEvents: events)

//    var currentSelectedData: OptionsSelectedData!

    func getEventsByDate() /*-> [Date: [SectionEvent]]*/ {
        var sectionEvents = [SectionEvent]()
        for s in sections {
            sectionEvents.append(contentsOf: s.getSectionEvents())
        }
        events = sectionEvents
        print(sectionEvents)
//        return JZWeekViewHelper.getIntraEventsByDate(originalEvents: sectionEvents)
    }
    
    
    func testSections() {
        var s = [SectionModel]()

        var c = (CourseModel(termID: "202201", subject: "CSCI", classID: "373", name: "iOS Dev", attributes: [], /* coreqs: [], prereqs: [], */ sections: []))
        
        s.append(SectionModel(meetingTimes: [MeetingTime(dayOfWeek: 1, startTime: 55200, endTime: 59300)], seatsCapacity: 10, seatsRemaining: 10, waitCapacity: 10, waitRemaining: 10, profs: ["Hyunju Kim", "Stack Overflow"], location: "MeySci", crn: "80001", course: c))

        courses.append(c.addSections(secs: s))
    
        courses.append(CourseModel(termID: "202208", subject: "BITH", classID: "315", name: "Xtian Thought", attributes: ["Core"], /*coreqs: [], prereqs: [], */ sections: []).addSection(meetingTimes: [MeetingTime(dayOfWeek: 2, startTime: 20000, endTime: 24000), MeetingTime(dayOfWeek: 4, startTime: 20000, endTime: 24000)], seatsCapacity: 10, seatsRemaining: 10, waitCapacity: 10, waitRemaining: 10, profs: ["Emily McGowin"], location: "BGC", crn: "82211"))
        
        for course in courses {
            for section in course.getSections() {
                sections.append(section)
            }
        }
        getEventsByDate()
    }
}



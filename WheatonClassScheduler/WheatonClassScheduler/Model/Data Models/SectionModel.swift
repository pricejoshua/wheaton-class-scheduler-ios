//
//  SectionModel.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/9/22.
//

import Foundation

struct MeetingTime: Codable {
    internal init(dayOfWeek: Int, startTime: Int?, endTime: Int?) {
        self.dayOfWeek = dayOfWeek
        if (startTime != nil) {
            self.startTime = startTime!
        } else {
            self.startTime = 0
        }
        if (endTime != nil) {
            self.endTime = endTime!
        } else {
            self.endTime = 0
        }
    }
    
    var dayOfWeek: Int
    var startTime: Int
    var endTime: Int
    
    
}

struct SectionModel: Codable {
    
    let meetingTimes: [MeetingTime]
    let seatsCapacity, seatsRemaining, waitCapacity, waitRemaining: Int
    let profs: [String]
    let location, crn: String
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

    
    init(meetingTimes: [MeetingTime], seatsCapacity: Int, seatsRemaining: Int, waitCapacity: Int, waitRemaining: Int, profs: [String], location: String, crn: String, course: CourseModel) {
        self.meetingTimes = meetingTimes
        self.seatsCapacity = seatsCapacity
        self.seatsRemaining = seatsRemaining
        self.waitCapacity = waitCapacity
        self.waitRemaining = waitRemaining
        self.profs = profs
        self.location = location
        self.crn = crn
        self.course = course
    }
    
    func getSectionEvents() -> [SectionEvent]{
        var sectionEvents = [SectionEvent]()
        for m in meetingTimes{
            sectionEvents.append(SectionEvent(id: self.crn, title: course.name, startDate: Date().getDayOfWeekByIndex(m.dayOfWeek).add(component: .second, value: m.startTime), endDate: Date().getDayOfWeekByIndex(m.dayOfWeek).add(component: .second, value: m.endTime), location: location))
        }
        
        return sectionEvents
    }
    
    func getSearchTerms() -> String {
        return course.subject + " " + course.classID + course.attributes + profs + course.name
    }
    
}

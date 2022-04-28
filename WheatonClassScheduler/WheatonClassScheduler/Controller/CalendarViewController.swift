//
//  CalendarViewController.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/9/22.
//

import UIKit
import JZCalendarWeekView

class CalendarViewController: UIViewController {

    @IBOutlet weak var calendarWeekView: SectionWeekView!

    let viewModel = DefaultViewModel()
    
    let coursesDataModel = CoursesDataModel.coursesDataModel


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCalendarView()

    }
    

    
    // Support device orientation change
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        JZWeekViewHelper.viewTransitionHandler(to: size, weekView: calendarWeekView)
    }

    private func setupCalendarView() {
        calendarWeekView.baseDelegate = self

//        viewModel.testSections()
        
        var events = [SectionEvent]()
        for s in coursesDataModel.getSections().filter({ sec in
            return sec.selected
        }) {
            events.append(contentsOf: s.getSectionEvents())
        }
        
        let eventsByDate = JZWeekViewHelper.getIntraEventsByDate(originalEvents: events)
        // Basic setup
        calendarWeekView.setupCalendar(numOfDays: 5,
                                       setDate: Date().firstDayOfSchoolWeek,
                                       allEvents: eventsByDate,
                                       scrollType: .pageScroll, scrollableRange: (Date().firstDayOfSchoolWeek, Date().lastDayOfSchoolWeek))
        // Optional
        calendarWeekView.updateFlowLayout(JZWeekViewFlowLayout(hourGridDivision: JZHourGridDivision.minutes_15))
    }
}

extension CalendarViewController: JZBaseViewDelegate {
    func initDateDidChange(_ weekView: JZBaseWeekView, initDate: Date) {
        // updateNaviBarTitle()
    }
}

extension CalendarViewController: CourseDataDelegate {
    func courseDataDidUpdate(_ courseData: CourseData) {
        print("fin")
    }
    
    func courseDataDidFailWithError(error: Error) {
        print(error)
    }
    
    
}

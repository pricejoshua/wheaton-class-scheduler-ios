//
//  WeekViewController.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/9/22.
//

import UIKit
import JZCalendarWeekView

class CalendarViewController: UIViewController {

    @IBOutlet weak var calendarWeekView: DefaultWeekView!

    let viewModel = DefaultViewModel()

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

        // Basic setup
        calendarWeekView.setupCalendar(numOfDays: 5,
                                       setDate: Date(),
                                       allEvents: viewModel.eventsByDate,
                                       scrollType: .pageScroll, scrollableRange: (Date().firstDayOfWeek.addDays(1), Date().firstDayOfWeek.addDays(5)))
        // Optional
        calendarWeekView.updateFlowLayout(JZWeekViewFlowLayout(hourGridDivision: JZHourGridDivision.noneDiv))
    }
}

extension CalendarViewController: JZBaseViewDelegate {
    func initDateDidChange(_ weekView: JZBaseWeekView, initDate: Date) {
        // updateNaviBarTitle()
    }
}

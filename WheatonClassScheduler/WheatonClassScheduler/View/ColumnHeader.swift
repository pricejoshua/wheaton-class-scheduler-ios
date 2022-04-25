//
//  ColumnHeader.swift
//  Taken from JZColumnHeader.swift
//  JZCalendarWeekView
//
//  Created by Jeff Zhang on 28/3/18.
//  Modified 4/25/22 By Joshua Price
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import UIKit

open class ColumnHeader: UICollectionReusableView {

    public var lblWeekday = UILabel()
    let calendarCurrent = Calendar.current
    public var dateFormatter = DateFormatter()

    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        backgroundColor = .clear
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        // Hide all content when colum header height equals 0
        self.clipsToBounds = true
        let stackView = UIStackView(arrangedSubviews: [lblWeekday])
        stackView.axis = .vertical
        stackView.spacing = 2
        addSubview(stackView)
        stackView.setAnchorConstraintsEqualTo(centerXAnchor: centerXAnchor, centerYAnchor: centerYAnchor)
        lblWeekday.textAlignment = .center
        lblWeekday.font = UIFont.systemFont(ofSize: 12)
    }

    public func updateView(date: Date) {
        let weekday = calendarCurrent.component(.weekday, from: date) - 1

        lblWeekday.text = dateFormatter.shortWeekdaySymbols[weekday].uppercased()
    }

}

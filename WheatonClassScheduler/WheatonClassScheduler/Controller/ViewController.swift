//
//  ViewController.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 3/14/22.
//

import UIKit
import JTAppleCalendar

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension ViewController: JTACMonthViewDataSource {
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let startDate = formatter.date(from: "2018 01 01")!
        let endDate = Date()
        return ConfigurationParameters(startDate: startDate, endDate: endDate)
    }
}

func configureCell(view: JTACDayCell?, cellState: CellState) {
   guard let cell = view as? DateCell  else { return }
   cell.dateLabel.text = cellState.text
   handleCellTextColor(cell: cell, cellState: cellState)
//    if cellState.dateBelongsTo == .thisMonth {
//       cell.isHidden = false
//    } else {
//       cell.isHidden = true
//    }
}
    
func handleCellTextColor(cell: DateCell, cellState: CellState) {
   if cellState.dateBelongsTo == .thisMonth {
      cell.dateLabel.textColor = UIColor.black
   } else {
      cell.dateLabel.textColor = UIColor.gray
       cell.dayLabel.textColor = UIColor.gray
   }
}

extension ViewController: JTACMonthViewDelegate {
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! DateCell
        cell.dateLabel.text = cellState.text + "!"
        configureCell(view: cell, cellState: cellState)

        let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
        
        cell.dayLabel.text = days[cellState.date.zeroBasedDayOfWeek!]

    }
    
    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCell
        self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        cell.dateLabel.text = cellState.text + "!"
        
        let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
        
        cell.dayLabel.text = days[cellState.date.zeroBasedDayOfWeek!]
        
        
        return cell
    }
    
    
}

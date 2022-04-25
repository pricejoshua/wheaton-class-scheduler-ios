//
//  SectionWeekView.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/25/22.
//

import Foundation
import JZCalendarWeekView

class SectionWeekView: JZBaseWeekView {
    override func registerViewClasses() {
        super.registerViewClasses()

        self.collectionView.register(UINib(nibName: "ClassCell", bundle: nil), forCellWithReuseIdentifier: ClassCell.className)
        
        self.flowLayout
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.row)
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClassCell.className, for: indexPath) as? ClassCell{
            if let event = getCurrentEvent(with: indexPath) as? SectionEvent {
                cell.configureCell(event: event)
                return cell
            } else {
                print("event")
            }
        } else {
            print("cell")
        }
        preconditionFailure()
    }
}

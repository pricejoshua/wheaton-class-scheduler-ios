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

        self.collectionView.register(UINib(nibName: ClassEventCell.className, bundle: nil), forCellWithReuseIdentifier: ClassEventCell.className)
        
//        collectionView.register(ColumnHeader.self, forSupplementaryViewOfKind: JZSupplementaryViewKinds.columnHeader, withReuseIdentifier: JZSupplementaryViewKinds.columnHeader)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClassEventCell.className, for: indexPath) as? ClassEventCell{
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

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var view = UICollectionReusableView()

        switch kind {
//        case JZSupplementaryViewKinds.columnHeader:
//            if let columnHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kind, for: indexPath) as? ColumnHeader {
//                columnHeader.updateView(date: flowLayout.dateForColumnHeader(at: indexPath))
//                view = columnHeader
//            }
        default:
            view = super.collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
        }
        
        return view
    }
}

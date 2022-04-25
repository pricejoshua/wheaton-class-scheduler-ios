//
//  DefaultWeekView.swift
//  JZCalendarViewExample
//
//  Created by Jeff Zhang on 4/4/18.
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import UIKit
import JZCalendarWeekView

class DefaultWeekView: JZBaseWeekView {

    override func registerViewClasses() {
        super.registerViewClasses()

        self.collectionView.register(UINib(nibName: "ClassCell", bundle: nil), forCellWithReuseIdentifier: ClassCell.className)
        
        collectionView.register(ColumnHeader.self, forSupplementaryViewOfKind: JZSupplementaryViewKinds.columnHeader, withReuseIdentifier: "ColumnHeader")
        print(collectionView.registeredSupplementaryClasses)

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

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var view = UICollectionReusableView()

        switch kind {
        case JZSupplementaryViewKinds.columnHeader:
            if let columnHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kind, for: indexPath) as? ColumnHeader {
                columnHeader.updateView(date: flowLayout.dateForColumnHeader(at: indexPath))
                view = columnHeader
            }
        default:
            view = super.collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
        }
        
        return view
    }
            
}

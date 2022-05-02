//
//  TagCollectionViewCell.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 5/2/22.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        cellView.backgroundColor = .blue
//        cellView.layer.cornerRadius = cellView.layer.bounds.width / 2
//        cellView.clipsToBounds = true
    }

}

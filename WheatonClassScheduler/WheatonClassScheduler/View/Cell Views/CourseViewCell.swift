//
//  CourseViewCell.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/25/22.
//

import UIKit

class CourseViewCell: UICollectionViewCell {

    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var courseIDLabel: UILabel!
    @IBOutlet weak var profLabel: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var checkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundView?.backgroundColor = .white
        // Initialization code
        
        cellBackgroundView.backgroundColor = .purple
        cellBackgroundView.layer.cornerRadius = 20.0

    }

}

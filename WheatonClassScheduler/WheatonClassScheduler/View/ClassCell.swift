//
//  ClassCell.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/25/22.
//

import UIKit

class ClassCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    var event: SectionEvent!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupBasic()
    }

    func setupBasic() {
        self.clipsToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0
        locationLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        self.backgroundColor = UIColor(hex: 0xEEF7FF)
        borderView.backgroundColor = UIColor(hex: 0x0899FF)
    }

    func configureCell(event: SectionEvent) {
        self.event = event
        locationLabel.text = event.location
        titleLabel.text = event.title
    }
}

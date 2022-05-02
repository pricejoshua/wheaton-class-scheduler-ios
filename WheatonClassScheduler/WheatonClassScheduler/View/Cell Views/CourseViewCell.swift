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
    @IBOutlet weak var tagCollectionView: UICollectionView!
    var tags: [String]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundView?.backgroundColor = .white
        // Initialization code
        
        cellBackgroundView.backgroundColor = .systemOrange
        cellBackgroundView.layer.cornerRadius = 20.0
        
        tagCollectionView.register(UINib(nibName: TagCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: TagCollectionViewCell.className)
        tagCollectionView.backgroundColor = .clear

    }

}

extension CourseViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.className, for: indexPath)
        if let tcVC = cell as? TagCollectionViewCell {
            tcVC.tagLabel.text = tags[indexPath.row]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    

    
    
}

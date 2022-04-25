//
//  ClassesViewController.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/25/22.
//

import UIKit

class ClassesViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource {
    
    var sections = [SectionModel]()
    var filteredSections: [SectionModel]!
    
    @IBOutlet weak var classCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testSections()
        classCollectionView.dataSource = self
        
        classCollectionView.register(UINib(nibName: CourseViewCell.className, bundle: .none), forCellWithReuseIdentifier: CourseViewCell.className)
        
        var config = UICollectionLayoutListConfiguration(appearance:
          .insetGrouped)
        config.backgroundColor = .systemGray
        classCollectionView.collectionViewLayout =
          UICollectionViewCompositionalLayout.list(using: config)
    }
    
    func testSections() {
        sections.append(SectionModel(termID: "202208", crn: "85583", classID: "315", subject: "BITH", name: "Christian Thought", startTime: Date(), endTime: Date(), seatsCapacity: 10, seatsRemaining: 10, waitCapacity: 10, waitRemaining: 10, profs: ["Emily McGowin"]))
        sections.append(SectionModel(termID: "202208", crn: "88818", classID: "373", subject: "CSCI", name: "Platform-Specific Development", startTime: Date(), endTime: Date(), seatsCapacity: 10, seatsRemaining: 10, waitCapacity: 10, waitRemaining: 10, profs: ["Hyunju Kim", "Stack Overflow"]))
        
        for _ in 0...10 {
            sections.append(SectionModel(termID: "202208", crn: "88818", classID: "373", subject: "CSCI", name: "Platform-Specific Development", startTime: Date(), endTime: Date(), seatsCapacity: 10, seatsRemaining: 10, waitCapacity: 10, waitRemaining: 10, profs: ["Hyunju Kim", "Stack Overflow"]))
        }
        print("hh")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseViewCell.className, for: indexPath) as? CourseViewCell {
            cell.classNameLabel.text = sections[indexPath.row].name
            cell.courseIDLabel.text = sections[indexPath.row].subject + sections[indexPath.row].classID
            cell.profLabel.text = sections[indexPath.row].profs.first
            return cell
        }
        preconditionFailure()
    }

}

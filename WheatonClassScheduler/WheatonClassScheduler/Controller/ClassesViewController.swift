//
//  ClassesViewController.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/25/22.
//

import UIKit

class ClassesViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource {
    
    var courses = [CourseModel]()
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
        var s = [SectionModel]()

        var c = (CourseModel(termID: "202201", subject: "CSCI", classID: "373", name: "iOS Dev", attributes: [], /* coreqs: [], prereqs: [], */ sections: []))
        for i in 0...10 {
            s.append(SectionModel(meetingTimes: [MeetingTime(dayOfWeek: 1, startTime: 55200, endTime: 55300)], seatsCapacity: 10, seatsRemaining: 10, waitCapacity: 10, waitRemaining: 10, profs: ["Hyunju Kim", "Stack Overflow"], location: "MeySci", crn: String(81181+i), course: c))
        }

        courses.append(c.addSections(secs: s))
    
        courses.append(CourseModel(termID: "202208", subject: "BITH", classID: "315", name: "Xtian Thought", attributes: ["Core"], /*coreqs: [], prereqs: [], */ sections: []).addSection(meetingTimes: [MeetingTime(dayOfWeek: 2, startTime: 23000, endTime: 24000), MeetingTime(dayOfWeek: 4, startTime: 23000, endTime: 24000)], seatsCapacity: 10, seatsRemaining: 10, waitCapacity: 10, waitRemaining: 10, profs: ["Emily McGowin"], location: "BGC", crn: "82211"))
        
        for course in courses {
            for section in course.getSections() {
                sections.append(section)
            }
        }
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

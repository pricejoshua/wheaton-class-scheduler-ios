//
//  ClassesViewController.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/25/22.
//

import UIKit



class ClassesViewController: UIViewController {
    
//    var courses = [CourseModel]()
//    var sections = [SectionModel]()
    var courseDataModel = CoursesDataModel.coursesDataModel
    var term = "202208"
    var filteredSections = [SectionModel]()
    
    var filterOptions: FiltersSelectedOptions!
    
    @IBOutlet weak var classCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // testSections()
        classCollectionView.dataSource = self
        
        classCollectionView.register(UINib(nibName: CourseViewCell.className, bundle: .none), forCellWithReuseIdentifier: CourseViewCell.className)
        
        var config = UICollectionLayoutListConfiguration(appearance:
          .insetGrouped)
        config.backgroundColor = .systemGray
        classCollectionView.collectionViewLayout =
          UICollectionViewCompositionalLayout.list(using: config)
        
        searchBar.delegate = self
        filteredSections = courseDataModel.getSectionsByTerm(term: term)
        filterOptions = FiltersSelectedOptions(searchBy: SearchOptions(subject: false, classID: false, course: false, profs: false, name: true), tags: [], term: "202208")
    }
    
    func changeTerms(term: String) {
        self.term = term
    }
    
    func filter() {
        if let searchText = searchBar.text {
            filteredSections = []
            for s in courseDataModel.getSectionsByTerm(term: term) {
                if s.getSearchTerms(searchOptions: filterOptions.searchBy).lowercased().contains(searchText.lowercased()) {
                    filteredSections.append(s)
                }
            }
        } else {
            filteredSections = courseDataModel.getSectionsByTerm(term: term)
        }
        if filterOptions.tags.count != 0 {
            let temp = filteredSections
            filteredSections = []
            for s in temp {
                var add = false
                for tag in filterOptions.tags{
                    if s.getAttributes().contains(tag) {
                        add = true
                    }
                }
                if add {
                    filteredSections.append(s)
                }
            }
        }
}
    
//    func testSections() {
//        var s = [SectionModel]()
//
//        var c = (CourseModel(termID: "202201", subject: "CSCI", classID: "373", name: "iOS Dev", attributes: [], /* coreqs: [], prereqs: [], */ sections: []))
//        for i in 0...10 {
//            s.append(SectionModel(meetingTimes: [MeetingTime(dayOfWeek: 1, startTime: 55200, endTime: 55300)], seatsCapacity: 10, seatsRemaining: 10, waitCapacity: 10, waitRemaining: 10, profs: ["Hyunju Kim", "Stack Overflow"], location: "MeySci", crn: String(81181+i), course: c))
//        }
//
//        courses.append(c.addSections(secs: s))
//
//        courses.append(CourseModel(termID: "202208", subject: "BITH", classID: "315", name: "Xtian Thought", attributes: ["Core"], /*coreqs: [], prereqs: [], */ sections: []).addSection(meetingTimes: [MeetingTime(dayOfWeek: 2, startTime: 23000, endTime: 24000), MeetingTime(dayOfWeek: 4, startTime: 23000, endTime: 24000)], seatsCapacity: 10, seatsRemaining: 10, waitCapacity: 10, waitRemaining: 10, profs: ["Emily McGowin"], location: "BGC", crn: "82211"))
//
//        for course in courses {
//            for section in course.getSections() {
//                sections.append(section)
//            }
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}


// MARK: - UICollectionView

extension ClassesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseViewCell.className, for: indexPath) as? CourseViewCell {
            let section = filteredSections[indexPath.row]
            cell.classNameLabel.text = section.name
            cell.courseIDLabel.text = section.subject + " " + section.classID
            cell.profLabel.text = section.profs.first
            return cell
        }
        preconditionFailure()
    }
}

// MARK: - UISearchBarDelegate

extension ClassesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filter()
        self.classCollectionView.reloadData()
    }
}


// MARK: - CourseDataDelegate

extension ClassesViewController: CourseDataDelegate {
    func courseDataDidUpdate(_ courseData: CourseData) {
        filteredSections = courseDataModel.getSectionsByTerm(term: term)
        classCollectionView.reloadData()
    }
    
    func courseDataDidFailWithError(error: Error) {
        print(error)
    }
}

extension ClassesViewController: FilterOptionsDelegate {
    func finishUpdate(selectedOptions: FiltersSelectedOptions) {
        filterOptions = selectedOptions
        filter()
        classCollectionView.reloadData()
    }
}



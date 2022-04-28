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
    var term: String!
    var filteredSections = [SectionModel]()
    
    var filterOptions: FiltersSelectedOptions!
    
    @IBOutlet weak var classTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // testSections()-
        
        term = courseDataModel.currentTerm
        
        classTableView.dataSource = self
                
        classTableView.register(UINib(nibName: CourseViewCell.className, bundle: .none), forCellReuseIdentifier: CourseViewCell.className)

        
        searchBar.delegate = self
        filteredSections = courseDataModel.getSections()
        filterOptions = FiltersSelectedOptions(searchBy: SearchOptions(subject: false, classID: false, course: false, profs: false, name: true), tags: [], term: courseDataModel.currentTerm)
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
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toFiltersViewController" {
            print()
        }
    }
    
    
    
}


// MARK: - UICollectionView

extension ClassesViewController: UITableViewDataSource {

    
    func tableView(_ collectionView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSections.count
    }
    
    func tableView(_ collectionView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = collectionView.dequeueReusableCell(withIdentifier: CourseViewCell.className, for: indexPath) as? CourseViewCell {
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
        self.classTableView.reloadData()
    }
}


// MARK: - CourseDataDelegate

extension ClassesViewController: CourseDataDelegate {
    func courseDataDidUpdate(_ courseData: CourseData) {
        filteredSections = courseDataModel.getSectionsByTerm(term: term)
        classTableView.reloadData()
    }
    
    func courseDataDidFailWithError(error: Error) {
        print(error)
    }
}

// MARK: - FilterOptionsDelegate

extension ClassesViewController: FilterOptionsDelegate {
    
    func filterOptionsDidUpdate(selectedOptions: FiltersSelectedOptions) {
        filterOptions = selectedOptions
        filter()
        classTableView.reloadData()
    }
}



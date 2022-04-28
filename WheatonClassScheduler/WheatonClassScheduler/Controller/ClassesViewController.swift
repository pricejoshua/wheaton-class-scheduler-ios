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
          .grouped)
        classCollectionView.collectionViewLayout =
        UICollectionViewCompositionalLayout.list(using: config)
        
        searchBar.delegate = self
        filteredSections = courseDataModel.getSections()
        filterOptions = FiltersSelectedOptions(searchBy: SearchOptions(subject: false, classID: false, course: false, profs: false, name: true), tags: [], term: CoursesDataModel.coursesDataModel.currentTerm)
    }
    
    func changeTerms(term: String) {
        self.term = term
    }
    
    func filter() {
        if let searchText = searchBar.text {
            if searchText != "" {
                filteredSections = []
                for s in courseDataModel.getSectionsByTerm(term: term) {
                    if s.getSearchTerms(searchOptions: filterOptions.searchBy).lowercased().contains(searchText.lowercased()) {
                        filteredSections.append(s)
                    }
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

// MARK: - FilterOptionsDelegate

extension ClassesViewController: FilterOptionsDelegate {
    func filterOptionsDidUpdate(selectedOptions: FiltersSelectedOptions) {
        filterOptions = selectedOptions
        filter()
        classCollectionView.reloadData()
    }
}


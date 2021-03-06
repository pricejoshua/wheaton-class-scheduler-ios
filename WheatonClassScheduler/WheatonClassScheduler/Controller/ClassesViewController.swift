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


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        classCollectionView.dataSource = self
        classCollectionView.delegate = self
        
        classCollectionView.register(UINib(nibName: CourseViewCell.className, bundle: .none), forCellWithReuseIdentifier: CourseViewCell.className)
        
        var config = UICollectionLayoutListConfiguration(appearance:
          .grouped)
        classCollectionView.collectionViewLayout =
        UICollectionViewCompositionalLayout.list(using: config)
        
        searchBar.delegate = self
        filteredSections = courseDataModel.getSections()
        
        if filterOptions == nil {
            filterOptions = FiltersSelectedOptions(searchBy: [.subject: false, .course: false, .profs: false, .classID: false, .name: true], tags: [], term: CoursesDataModel.coursesDataModel.currentTerm)
        }
    }
    
    func changeTerms(term: String) {
        self.term = term
    }
    
    func filter() {
        if let searchText = searchBar.text {
            if searchText != "" {
                filteredSections = []
                for s in courseDataModel.getSections() {
                    print(filterOptions!)
                    if s.getSearchTerms(searchOptions: filterOptions.searchBy).lowercased().contains(searchText.lowercased()) {
                        filteredSections.append(s)
                    }
                }
            } else {
                filteredSections = courseDataModel.getSections()
            }
        } else {
            filteredSections = courseDataModel.getSections()
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
            if let dest = segue.destination as? FiltersViewController {
                dest.delegate = self
                dest.filters = filterOptions
                print(dest.filters)
                
            }
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
            cell.checkLabel.isHidden = !section.selected
            cell.tags = section.getTags()
            return cell
        }
        preconditionFailure()
    }
}

extension ClassesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CourseViewCell {
            filteredSections[indexPath.item].toggleSelected()
            print(filteredSections[indexPath.item].selected)
            cell.checkLabel.isHidden = !filteredSections[indexPath.item].selected
            
        }
        print("hello", indexPath.item, filteredSections[indexPath.item])
        
        collectionView.deselectItem(at: indexPath, animated: true)
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
        self.filterOptions = selectedOptions
        filter()	
        classCollectionView.reloadData()
    }
}


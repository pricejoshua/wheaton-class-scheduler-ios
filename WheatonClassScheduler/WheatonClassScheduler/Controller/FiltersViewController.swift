//
//  FiltersViewController.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/27/22.
//

import UIKit

class FiltersViewController: UIViewController {
    
    var filters: FiltersSelectedOptions!
    var delegate: FilterOptionsDelegate!
    
    var searchOptions: [so: SearchOptions: isSelected: Bool] = [.subject: false, .course: false, .profs: false, .classID: false, .name: true]
    
    @IBOutlet weak var searchOptionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filters = FiltersSelectedOptions(searchBy: [.subject: false, .course: false, .profs: false, .classID: false, .name: true], tags: [], term: CoursesDataModel.coursesDataModel.currentTerm)
        
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toTagsViewController" {
            if let destVC = segue.destination as? TagsViewController {
                destVC.delegate = self
            }
        }
    }
    

}

extension FiltersViewController: TagDataDelegate {
    func tagsDidChange(tagItems: [TagItem]) {
        filters.tags = []
        for tagItem in tagItems {
            filters.tags.append(tagItem.tag)
        }
    }
}

class SearchOptionCell: UITableViewCell {
    @IBOutlet weak var searchOptionLabel: UILabel!
    
}

extension FiltersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchOptionsCell", for: indexPath)
        if let soCell = cell as? SearchOptionCell {
            soCell.searchOptionLabel.text = getNameByOption(so: searchOptions[indexPath.row].so)
            soCell.searchOptionLabel.text = "subject"
            
            return soCell
        }
            
        
        return cell
        
        
            
    }
    
    func getNameByOption(so: SearchOptions) -> String {
        switch so {
        case .subject:
            return "Subject"
        case .classID:
            return "Class ID"
        case .name:
            return "Class Name"
        case .profs:
            return "Professors"
        case .course:
            return "Course Name"
        }
    }
    
}

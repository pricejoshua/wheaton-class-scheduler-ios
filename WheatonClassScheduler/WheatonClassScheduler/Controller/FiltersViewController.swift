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
    
    var searchOptions: [SearchOptions: Bool] = [.subject: false, .course: false, .profs: false, .classID: false, .name: true]
    
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
    @IBOutlet weak var checkLabel: UILabel!
}

// MARK: UITableView

extension FiltersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(SearchOptions.allCases.count)
        return SearchOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchOptionCell", for: indexPath)
        print(cell)
        if let soCell = cell as? SearchOptionCell {
            let so  = SearchOptions(rawValue: indexPath.row)!
            print(so)
            soCell.searchOptionLabel.text = so.getNameByOption()
            print(so.getNameByOption())
            return soCell
        }
            
        
        return cell
        
            
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? SearchOptionCell {
            searchOptions[SearchOptions(rawValue: indexPath.item)] = !searchOptions[SearchOptions(rawValue: indexPath.item)]
            print(filteredSections[indexPath.item].selected)
            cell.checkLabel.isHidden = !filteredSections[indexPath.item].selected
            
        }
    }

    
}

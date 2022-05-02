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
    
    var searchOptions: [SearchOptions: Bool]!
    
    @IBOutlet weak var searchOptionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if filters == nil {
            filters = FiltersSelectedOptions(searchBy: [.subject: false, .course: false, .profs: false, .classID: false, .name: true], tags: [], term: CoursesDataModel.coursesDataModel.currentTerm)
        } else if filters.searchBy == nil {
            filters.searchBy = [.subject: false, .course: false, .profs: false, .classID: false, .name: true]
        }
        
        searchOptions = filters.searchBy
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
    
    
    @IBAction func applyButton(_ sender: Any) {
        delegate?.filterOptionsDidUpdate(selectedOptions: filters)
        navigationController?.popViewController(animated: true)
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
        return SearchOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchOptionCell", for: indexPath)
        if let soCell = cell as? SearchOptionCell {
            let so  = SearchOptions(rawValue: indexPath.row)!
            soCell.searchOptionLabel.text = so.getNameByOption()
            soCell.checkLabel.isHidden = !searchOptions[so]!
            return soCell
        }
        tableView.deselectRow(at: indexPath, animated: true)
            
        
        return cell
        
            
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? SearchOptionCell {
            print(SearchOptions(rawValue: indexPath.item)!, searchOptions[SearchOptions(rawValue: indexPath.item)!])
            searchOptions[SearchOptions(rawValue: indexPath.item)!] = !searchOptions[SearchOptions(rawValue: indexPath.item)!]!
            print(SearchOptions(rawValue: indexPath.item)!, searchOptions[SearchOptions(rawValue: indexPath.item)!])
            cell.checkLabel.isHidden = !searchOptions[SearchOptions(rawValue: indexPath.item)!]!
            filters.searchBy = searchOptions
        }
    }

    
}

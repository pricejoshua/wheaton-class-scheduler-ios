//
//  FiltersViewController.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/27/22.
//

import UIKit


class FiltersViewController: UIViewController {
    
    var filters: FiltersSelectedOptions!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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


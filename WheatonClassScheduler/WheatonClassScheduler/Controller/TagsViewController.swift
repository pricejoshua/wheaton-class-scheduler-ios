//
//  TagsTableViewController.swift
//  WheatonClassScheduler
//
//  Created by Joshua Price on 4/27/22.
//

import UIKit

class TagItem{
    
    init(tag: String, checked: Bool) {
        self.tag = tag
        self.checked = checked
    }
    
    var tag: String
    var checked: Bool!
    
    func toggleChecked(){
        checked = !checked
    }
    
    public var description: String { return "tag: \(String(describing: tag)) + \(String(checked))"}
  
}

protocol TagDataDelegate {
    func tagsDidChange(tagItems: [TagItem])
}

class TagsViewController: UIViewController {
    
    var tagItems: [TagItem]!
    var delegate: TagDataDelegate!
    @IBOutlet weak var tagTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tagItems = [TagItem]()
        for t in tags {
            if t != "" {
                let ti = TagItem(tag: t, checked: false)
                tagItems.append(ti)
//                print(ti.description)
            }
        }
        
        tagTableView.delegate = self
        tagTableView.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    
    
    func setCheckmark(cell: UITableViewCell, item: TagItem){

        if let tvCell = cell as? TagTableViewCell {
            if item.checked {
                tvCell.checkLabel.isHidden = false
            } else {
                tvCell.checkLabel.isHidden = true
            }
        }
    }
    
    func setLabel(cell: UITableViewCell, item: TagItem) {
        if let tvCell = cell as? TagTableViewCell {
            tvCell.tagLabel.text = item.tag
        }
    }

    @IBAction func applyTags(_ sender: UIButton) {
        delegate?.tagsDidChange(tagItems: tagItems)
        self.dismiss(animated: true)
    }
    
    
    @IBAction func clearTags(_ sender: UIButton) {
        for tag in tagItems {
            tag.checked = false
        }
        tagTableView.reloadData()
    }
    

//
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: TableView stuff

extension TagsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagItems.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("tv")
        let cell = tableView.dequeueReusableCell(withIdentifier: "tagItem", for: indexPath)
        setLabel(cell: cell, item: tagItems[indexPath.row])
        setCheckmark(cell: cell, item: tagItems[indexPath.row])
//        print(tagItems[indexPath.row].description)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = tagItems[indexPath.row]

            item.toggleChecked()

            setCheckmark(cell: cell, item: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

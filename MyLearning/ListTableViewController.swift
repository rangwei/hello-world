//
//  ListTableTableViewController.swift
//  MyLearning
//
//  Created by Rang, Winters on 23/07/2017.
//  Copyright © 2017 Rang, Winters. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    //MARK: Properties
    var learnings = [Learning]()
    
    var progresses = [LearningProgress]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleLearnings()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    private func loadSampleLearnings() {
        
        let learn1 = Learning(id: "1", type: "openSAP", name: "Developing Mobile Apps with HCP Mobile Service", number: 6, unit: "Weeks", status: "In progress")
        let learn2 = Learning(id: "2",type: "Standford", name: "iOS 9 Development", number: 18, unit: "Lectures", status: "In progress")
        let learn3 = Learning(id: "3",type: "Kindle", name: "From 0 to 1", number: 550, unit: "Pages", status: "In progress")
        let learn4 = Learning(id: "4",type: "eBook", name: "Camel In Action", number: 450, unit: "Pages", status: "Completed")
        learnings += [learn1, learn2, learn3, learn4]
        
   
        
        let p1 = LearningProgress(learning_id: "1", id: "1", date: "20170702", lecture: "lecture1")
        let p2 = LearningProgress(learning_id: "1", id: "2", date: "20170703", lecture: "lecture2")
        let p3 = LearningProgress(learning_id: "1", id: "3", date: "20170704", lecture: "lecture3")
        let p4 = LearningProgress(learning_id: "1", id: "4", date: "20170705", lecture: "lecture4")
        let p5 = LearningProgress(learning_id: "1", id: "5", date: "20170706", lecture: "lecture5")
        progresses += [p1, p2, p3, p4, p5]
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return learnings.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "LearningCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ListTableViewCell else {
            fatalError("The dequeued cell is not an instance of LearningTableViewCell.")
        }
        
        
        let learning = learnings[indexPath.row]
        
        
        cell.type.text = learning.type
        cell.name.text = learning.name
        cell.number.text = String(learning.number)
        cell.unit.text = learning.unit
        cell.progress.text = learning.status
        
        
        
        // Configure the cell...
        
        return cell
    }
    
    //MARK: Actions
    
    @IBAction func unwindToLearningList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? CreateViewController, let learning = sourceViewController.learning {
            let newIndexPath = IndexPath(row: learnings.count, section: 0)
            learnings.append(learning)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            switch identifier {
            case "ShowProgress":
                if let vc = segue.destination as? UINavigationController {
                    if let c = vc.topViewController as? DetailTableViewController {
                        c.progresses = progresses
                    }
                    
                }

            default: break
            }
        }
        
    }
    

}

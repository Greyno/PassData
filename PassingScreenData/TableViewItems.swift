//
//  TableViewItems.swift
//  PassingScreenData
//
//  Created by Gillian Reynolds-Titko on 7/30/17.
//  Copyright © 2017 GRey-T Programs. All rights reserved.
//

import UIKit

class TableViewItems: UITableViewController {
    
    
    //Create references that can be used to pass the values from the first VC
    //These arrays will be optionals in the real app since the tableview starts out empty
    
//    var firstName = [String?]()
//    var lastName = [String?]()
//    var sizeValue = [String?]()
    var firstName = ["Julia", "Vincent"]
    var lastName = ["Brown", "Wilson"]
    var sizeValue = ["10 lb", "3.0 lb"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstName.count
    }

  
    //Everytime numberOfRowsInSection is called, the cellForRowAt indexPath gets called
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell //configure cell as type UITableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
       
        if let cell = cell as? TableViewCell {
            cell.firstNameCell.text = firstName[indexPath.row]
            cell.lastNameCell.text = lastName[indexPath.row]
            cell.sizeCell.text = sizeValue[indexPath.row]
        }
        
        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

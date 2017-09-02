//
//  FirstViewController.swift
//  PassingScreenData
//
//  Created by Gillian Reynolds-Titko on 7/30/17.
//  Copyright © 2017 GRey-T Programs. All rights reserved.
//

// Use this program to learn how to pass data of interest from one screen to either cells in a TableView on another screen or a detail view on another screen. The "Populate Data" button will just populate the data but not segue to the tableView (like a Save button). This data can then be viewed in the table using the "Show Table" button
//See: https://www.youtube.com/watch?v=pR6dR-vVZeY for a starting project

//Next step is to expand this project so that we use delegation to return information from the SecondVC back to the FirstVC

import UIKit

//Delegate Step 4: Make FirstVC conform to the SecondVC delegate protocol.
class FirstViewController: UIViewController, SecondViewControllerDelegate {
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var sizeText: UITextField!
    
    //Create references to the TableView items; these will be used in the 'Populate Data' action
    var tableFirstName = TableViewItems()
    var tableLastName = TableViewItems()
    var tableSize = TableViewItems()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - SecondVC Delegate methods
    //Delegate Step 4: Make FirstVC conform to the SecondVC delegate protocol.
    func secondViewControllerDidPassBack(_ controller: SecondViewController, firstName: String, lastName: String) {
        //Put the parameters (saved from the SecondVC) into variables in the FirstVC
        firstNameText.text! = firstName
        lastNameText.text! = lastName
        print("I used the Pass Back button in the SecondVC with \(firstNameText!)")
        
        //Dismiss the second VC
        dismiss(animated: true, completion: nil)
    }

    
    //When the 'populate data' button is pressed, set up the data that will be viewed in the tableview
    //This will simulate a Save button with no segue
    @IBAction func populateProposedTableViewCellData(_ sender: UIButton) {
        tableFirstName.firstName.append(firstNameText.text!)
        tableLastName.lastName.append(lastNameText.text!)
        tableSize.sizeValue.append(sizeText.text!)
        print("Data populated: \(tableFirstName.firstName[2]), \(tableLastName.lastName[2]), \(tableSize.sizeValue[2])")
    }
    
    //When the 'See Detail' button is pressed, segue to the detail view screen
    @IBAction func sendToDetailView(_ sender: UIButton) {
        performSegue(withIdentifier: "SecondViewSegue", sender: nil)
    }
    
    //When the 'See Table' button is pressed, segue to the tableview screen
    @IBAction func sendtoTableView(_ sender: UIButton) {
        performSegue(withIdentifier: "TableViewSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Once cast properly, the destination VC will have references to all the variables contained in its corresponding destination VC (SecondVC in this instance)
    
        if segue.identifier == "SecondViewSegue" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.firstName = firstNameText.text!
            destinationVC.lastName = lastNameText.text!
        }
        
        //The tableview starts out empty, then we add rows as we add new data from the parent. Append the new values to the arrays during the segue
        //If doing optionals for the arrays, remove the !s here
        if segue.identifier == "TableViewSegue" {
            //Get the navigation controller that holds the TableViewItems
            let navigationController = segue.destination as! UINavigationController
            let destinationVC = navigationController.topViewController as! TableViewItems
            //let destinationVC = segue.destination as! TableViewItems
        
            destinationVC.firstName.append(firstNameText.text!)
            destinationVC.lastName.append(lastNameText.text!)
            destinationVC.sizeValue.append(sizeText.text!)
        }
        
        //Delegate Step 5: Let the SecondVC know that the FirstVC is now its delegate
        if segue.identifier == "SecondViewSegue" {
            let controller = segue.destination as! SecondViewController
            controller.delegate = self
        }
        
    }
    
    //The close button on the second VC can be used to 'exit' and get back to the first VC
    @IBAction func unwindToFirstVC(segue: UIStoryboardSegue) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  SecondViewController.swift
//  PassingScreenData
//
//  Created by Gillian Reynolds-Titko on 7/30/17.
//  Copyright © 2017 GRey-T Programs. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var lastNameSent: UILabel!
    @IBOutlet weak var firstNameSent: UILabel!
    @IBOutlet weak var returnString1: UITextField!
    @IBOutlet weak var returnString2: UITextField!
    
    //Delegate Step 2: Give SecondVC a delegate optional variable. This variable should be weak.
    weak var delegate: SecondViewControllerDelegate?
    
    //Create references that can be used to pass the values from the first VC
    var firstName = String()
    var lastName = String()
    var passBackString1 = String()
    var passBackString2 = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        //Place the values from the first VC into the labels on view did load
        firstNameSent.text = firstName
        lastNameSent.text = lastName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Delegate Step 3: Make SecondVC send messages to its delegate when something interesting happens, such as the user pressing the Pass Back button; use delegate?.methodName(self, . . .)
    @IBAction func passDatabackToFirst(_ sender: UIButton) {
        //Assign the values we want to pass back to the FirstVC to the parameters in the function call
        passBackString1 = returnString1.text!
        passBackString2 = returnString2.text!
        
        //Then send them back to the delegate
        delegate?.secondViewControllerDidPassBack(self, firstName: passBackString1, lastName: passBackString2)
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

//Delegate Step 1: Define a delegate protocol for the SecondVC
//MARK: - Protocols
protocol SecondViewControllerDelegate: class {
    
    func secondViewControllerDidPassBack(_ controller: SecondViewController, firstName: String, lastName: String)
  
}

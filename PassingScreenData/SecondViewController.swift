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
    
    //Create references that can be used to pass the values from the first VC
    var firstName = String()
    var lastName = String()

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

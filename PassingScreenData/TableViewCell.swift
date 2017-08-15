//
//  TableViewCell.swift
//  PassingScreenData
//
//  Created by Gillian Reynolds-Titko on 7/30/17.
//  Copyright © 2017 GRey-T Programs. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameCell: UILabel!
    @IBOutlet weak var lastNameCell: UILabel!
    @IBOutlet weak var sizeCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

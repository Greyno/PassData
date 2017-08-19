//
//  PlantingModel.swift
//  PassingScreenData
//
//  Created by Gillian Reynolds-Titko on 8/19/17.
//  Copyright © 2017 GRey-T Programs. All rights reserved.
//
//Use this file to creat a planting object that will represent information to pass from the first view controller to the table view controller

import Foundation

class Plant: NSObject {
    var vegetableName: String
    var vegetableType: String
    var plantingLocation: String
    
    init(vegetableName: String, vegetableType: String, plantingLocation: String) {
        self.vegetableName = vegetableName
        self.vegetableType = vegetableType
        self.plantingLocation = plantingLocation
    }
}

//
//  HuntItem.swift
//  ScavengerHuntApp
//
//  Created by Syed Fahad Rasheed on 2026-06-04.
//

import Foundation

struct HuntItem : Identifiable, Codable{
    
    //using for providing unique id
    var id = UUID()
    var businessName: String
    var hiddenItemName: String
    //using clue for searching item reference
    
    var clue: String
    var imageName: String
    
    //is found or not
    var isFound: Bool = false

    }

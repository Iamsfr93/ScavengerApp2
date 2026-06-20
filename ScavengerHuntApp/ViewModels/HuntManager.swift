//
//  HuntManager.swift
//  ScavengerHuntApp
//
//  Created by Syed Fahad Rasheed on 2026-06-04.
//

import Foundation
import Combine

class HuntManager : ObservableObject{
    //app data load notifies views on change
    @Published var items: [HuntItem] = SampleData.sampleItems()
    
    //load saved items on starting
    init() {
        loadItems()
    }
    // calculate the item counts
    var foundCount: Int {
        items.filter { $0.isFound }.count
        
    }
    // Finds matching target 
    func markFound(item: HuntItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isFound = true
            saveItems()
        }
    }
    
    
    // arranging  the items array to JSON  in a equence and saves it to local persistence
    func saveItems(){
        
        if let encoded = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encoded, forKey: "SavedHuntItems")
            
        }
    }
    //retrive the data when if available
    func loadItems(){
        if let  data = UserDefaults.standard.data(forKey: "SavedHuntItems"),
           let decoded = try? JSONDecoder().decode([HuntItem].self, from: data) {
            items = decoded
        }
    }
    
    
}

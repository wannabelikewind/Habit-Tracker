//
//  AllTasks.swift
//  Habit Tracker
//
//  Created by Devansh Agrawal on 23/08/23.
//

import Foundation

class Tasks : ObservableObject{
    @Published var items = [Task](){
        didSet{
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([Task].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        items = []
    }
}


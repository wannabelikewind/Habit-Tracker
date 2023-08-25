//
//  Task.swift
//  Habit Tracker
//
//  Created by Devansh Agrawal on 23/08/23.
//

import Foundation

struct Task : Identifiable , Codable, Equatable{
    var id = UUID()
    let name : String
    let description : String
    var count : Int
}

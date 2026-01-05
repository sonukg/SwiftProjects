//
//  Item.swift
//  Grocery List
//
//  Created by sonukg on 09/12/25.
//
import Foundation
import SwiftData

@Model
class Item{
    var title: String
    var isChecked: Bool
    
    init(title: String, isChecked: Bool) {
        self.title = title
        self.isChecked = isChecked
    }
}

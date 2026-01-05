//
//  WishListModel.swift
//  WishList-App
//
//  Created by sonukg on 01/01/26.
//

import Foundation
import SwiftData

@Model
class WishListModel{
    var title: String = ""
    
    init(title: String) {
        self.title = title
    }
}
    


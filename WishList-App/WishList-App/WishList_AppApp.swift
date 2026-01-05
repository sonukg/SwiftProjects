//
//  WishList_AppApp.swift
//  WishList-App
//
//  Created by sonukg on 01/01/26.
//

import SwiftUI
import SwiftData

@main
struct WishList_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: WishListModel.self)
        }
    }
}

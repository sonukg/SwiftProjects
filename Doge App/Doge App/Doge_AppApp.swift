//
//  Doge_AppApp.swift
//  Doge App
//
//  Created by sonukg on 01/01/26.
//

import SwiftUI
import SwiftData

@main
struct Doge_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pet.self)
        }
    }
}

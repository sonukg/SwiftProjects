//
//  WatchListApp.swift
//  WatchList
//
//  Created by sonukg on 02/01/26.
//

import SwiftUI
import SwiftData

@main
struct WatchListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                    .modelContainer(for: Movie.self)
                }
        }
    }


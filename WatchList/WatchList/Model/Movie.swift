//
//  Movie.swift
//  WatchList
//
//  Created by sonukg on 02/01/26.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var genre:Genre
    
    init(title: String, genre: Genre) {
        self.title = title
        self.genre = genre
    }
}

extension Movie {
    
    @MainActor
    static var preview: ModelContainer{
        let container = try! ModelContainer(for: Movie.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        container.mainContext.insert(Movie(title: "Inception", genre: Genre(rawValue: 9)!))
        container.mainContext.insert(Movie(title: "John Wick", genre: Genre(rawValue: 1)!))
        container.mainContext.insert(Movie(title: "Toy Story", genre: Genre(rawValue: 11)!))
        container.mainContext.insert(Movie(title: "Lord of the Rings", genre: Genre(rawValue: 9)!))
        return container
    }
        
}

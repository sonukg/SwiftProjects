//
//  Pet.swift
//  Doge App
//
//  Created by sonukg on 03/01/26.
//

import Foundation
import SwiftData

@Model
class Pet{
    
    var name: String
    
    @Attribute(.externalStorage) var photo: Data?
    
    init(name: String, photo: Data? = nil) {
        self.name = name
        self.photo = photo
    }
}

extension Pet{
    @MainActor
    static var preview: ModelContainer{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Pet.self, configurations: config)
        
        container.mainContext.insert(Pet(name:"Lily"))
        container.mainContext.insert(Pet(name:"Tiger"))
        container.mainContext.insert(Pet(name:"Lion"))
        container.mainContext.insert(Pet(name:"German"))
        container.mainContext.insert(Pet(name:"Pirry"))
        container.mainContext.insert(Pet(name:"Lily"))
        container.mainContext.insert(Pet(name:"Siri"))
        container.mainContext.insert(Pet(name:"Lulia"))
        return container
    }
}

//
//  ContentView.swift
//  WishList-App
//
//  Created by sonukg on 01/01/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishLists: [WishListModel]
    @State private var isAlertShowing: Bool = false
    @State private var newWishListTitle: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishLists) { wishList in
                    Text(wishList.title)
                        .swipeActions {
                            Button("Delete",role: .destructive){
                                modelContext.delete(wishList)
                            }
                        }
                    
                }
        
            }
            .navigationTitle("Wish Lists")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isAlertShowing.toggle()
                    }) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                    
                }
                if wishLists.isEmpty != true {
                    ToolbarItem(placement: .bottomBar){
                        Text("\(wishLists.count)Wish Lists\(wishLists.count > 1 ? "es" : "")")
                    }
                }
            }
            .alert("Create a new Wish List", isPresented: $isAlertShowing) {
                TextField("Title", text: $newWishListTitle)
                Button("Save") {
                    let newWishList = WishListModel(title: newWishListTitle)
                    modelContext.insert(newWishList)
                    isAlertShowing.toggle()
                    newWishListTitle = ""
                }
                Button("Cancel", role: .cancel) {
                    isAlertShowing.toggle()
                    newWishListTitle = ""
                }
            }
            .overlay(content: {
                if wishLists.isEmpty {
                    ContentUnavailableView("No Wish Lists", systemImage: "heart.circle",
                    description: Text("You have not added any wish lists yet. Tap the + button to add a new wish list."))
                    }

            })
        }
    }
}

#Preview("Sample List"){
    let container = try! ModelContainer(for: WishListModel.self,configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(WishListModel(title: "SwiftUI Projects"))
    container.mainContext.insert(WishListModel(title: "SwiftData Projects"))
    container.mainContext.insert(WishListModel(title: "Swift Projects"))
    container.mainContext.insert(WishListModel(title: "CoreData Projects"))
    
   return ContentView()
        .modelContainer(container)
}

#Preview("Empty List"){
    ContentView()
        .modelContainer(for: WishListModel.self,inMemory: true)
}

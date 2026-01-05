//
//  ContentView.swift
//  Grocery List
//
//  Created by sonukg on 09/12/25.
//

import SwiftUI
import SwiftData
import TipKit

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var item: String = ""
      
      @FocusState private var isFocused: Bool
      
    let buttonTip = ButtonTip()
      
      func setupTips() {
        do {
          try Tips.resetDatastore()
          Tips.showAllTipsForTesting()
          try Tips.configure([
            .displayFrequency(.immediate)
          ])
        } catch {
          print("Error initializing TipKit \(error.localizedDescription)")
        }
      }
      
      init() {
        setupTips()
      }
    
    func addFoods(){
        modelContext.insert(Item(title:"Rice & Bread",isChecked: false))
        modelContext.insert(Item(title:"Banana & Lichi",isChecked: false))
        modelContext.insert(Item(title:"Milk & Cereal",isChecked: .random()))
        modelContext.insert(Item(title:"Cheese & Ghee",isChecked: .random()))
        modelContext.insert(Item(title:"Musturd Oil & Refined Oil",isChecked: .random()))
        modelContext.insert(Item(title:"Poha & Namkeen",isChecked: false))
    }
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(items) { item in
                    Text(item.title)
                        .font(.title.weight(.light))
                        .padding(.vertical,2)
                            .foregroundStyle(item.isChecked == false ? Color.primary : Color.accentColor)
                            .strikethrough(item.isChecked)
                            .italic(item.isChecked)
                            .swipeActions{
                                Button(role:.destructive){
                                    withAnimation{
                                        modelContext.delete(item)
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                            
                            .swipeActions(edge: .leading){
                                Button("Done", systemImage: item.isChecked ? "checkmark.circle" : "x.cirle"){
                                    item.isChecked.toggle()
                                }
                                .tint(item.isChecked==false ? Color.green : Color.accentColor)
                            }
                            
                    
                    
                }
            }
            .navigationBarTitle("Grocery List")
            .toolbar{
                if(items.isEmpty){
                    ToolbarItem(placement: .topBarTrailing){
                        Button{
                            addFoods()
                        } label: {
                            Label("Food", systemImage: "carrot")
                        }
                        .popoverTip(buttonTip)
                    }
                }
            }
            .overlay{
                if(items.isEmpty){
                    ContentUnavailableView("No items to show",systemImage: "cart.circle",description: Text("Add some item to start"))
                }
            }
            
            .safeAreaInset(edge: .bottom) {
                    VStack(spacing: 12) {
                      TextField("", text: $item)
                        .textFieldStyle(.plain)
                        .padding(12)
                        .background(.tertiary)
                        .cornerRadius(12)
                        .font(.title.weight(.light))
                        .focused($isFocused)
                      
                      Button {
                        guard !item.isEmpty else {
                          return
                        }
                        
                        let newItem = Item(title: item, isChecked: false)
                        modelContext.insert(newItem)
                        item = ""
                        isFocused = false
                      } label: {
                        Text("Save")
                          .font(.title2.weight(.medium))
                          .frame(maxWidth: .infinity)
                      }
                      .buttonStyle(.borderedProminent)
                      .buttonBorderShape(.roundedRectangle)
                      .controlSize(.extraLarge)
                    }
                    .padding()
                    .background(.bar)
                  }
            
        }
    }
}

#Preview("List with Items") {
    let sampleItem: [Item] = [
        Item(title:"Rice & Bread",isChecked: false),
        Item(title:"Banana & Lichi",isChecked: false),
        Item(title:"Milk & Cereal",isChecked: .random()),
        Item(title:"Cheese & Ghee",isChecked: .random()),
        Item(title:"Musturd Oil & Refined Oil",isChecked: .random()),
        Item(title:"Poha & Namkeen",isChecked: false)
    ]
    
    let container = try! ModelContainer(for:Item.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    for item in sampleItem {
        try! container.mainContext.insert(item)
    }
    
    return ContentView()
        .modelContainer(container)
    
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

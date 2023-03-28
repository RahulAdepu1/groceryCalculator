//
//  TestingView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/21/23.
//

import SwiftUI

struct TestingView: View {
    @StateObject var foodCategoriesViewModel = FoodCategoriesViewModel()
    @StateObject var foodItemsViewModel = FoodItemsViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing:0) {
                List(foodCategoriesViewModel.foodCategories, id: \.self) { category in
                    NavigationLink(
                        destination: FoodItemsView(foodCategory: category)
                            .environmentObject(foodItemsViewModel),
                        label: {
                            Text(category.name)
                        }
                    )
                }
                Button(action: {
                    let newCategory = FoodCategory(name: "New Category", foodItems: [])
                    foodCategoriesViewModel.addCategory(newCategory)
                }, label: {
                    Text("Add Category")
                })
            }
            .navigationTitle("Food Categories")
            .environmentObject(foodCategoriesViewModel)
        }
    }
}


class FoodCategoriesViewModel: ObservableObject {
    @Published var foodCategories: [FoodCategory] = []
    
    func addCategory(_ category: FoodCategory) {
        foodCategories.append(category)
    }
}

class FoodItemsViewModel: ObservableObject {
    @Published var foodItems: [FoodCategory: [FoodItem]] = [:]
    
    func foodItems(for category: FoodCategory) -> [FoodItem] {
        foodItems[category] ?? []
    }
    
    func loadItems(for category: FoodCategory) {
        if foodItems[category] == nil {
            foodItems[category] = []
        }
    }
    
    func addItem(_ item: FoodItem, to category: FoodCategory) {
        if foodItems[category] == nil {
            foodItems[category] = []
        }
        foodItems[category]?.append(item)
    }
    
    func toggleFavorite(for item: FoodItem, in category: FoodCategory) {
        if let index = foodItems[category]?.firstIndex(where: { $0.id == item.id }) {
            
            print("Before -> \(item.favorite)")
            foodItems[category]?[index].favorite.toggle()
            print("After -> \(item.favorite)")
            
        }
    }
    
    func toggleVeryFavorite(for item: FoodItem, in category: FoodCategory) {
        if let index = foodItems[category]?.firstIndex(where: { $0.id == item.id }) {
            
            print("Before -> \(item.verFav)")
            foodItems[category]?[index].verFav.toggle()
            print("After -> \(item.verFav)")
            
        }
    }
}

struct FoodItemsView: View {
    
    @State private var tapCount = 0
    
    @EnvironmentObject var foodItemsViewModel: FoodItemsViewModel
    var foodCategory: FoodCategory
    
    @State private var newItemName = ""
    
    var body: some View {
        VStack {
            List(foodItemsViewModel.foodItems(for: foodCategory), id: \.self) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Button(action: {
                        tapCount += 1
                        
                        // Determine the text field output based on the tap count
                        switch tapCount % 3 {
                        case 0:
                            print("Case 0")
                            foodItemsViewModel.toggleFavorite(for: item, in: foodCategory)
                            
//                            print("\(item.favorite)")
//                            print("\(item.verFav)")
                        case 1:
                            print("Case 1")
                            foodItemsViewModel.toggleFavorite(for: item, in: foodCategory)
                            foodItemsViewModel.toggleVeryFavorite(for: item, in: foodCategory)
                            
//                            print("\(item.favorite)")
//                            print("\(item.verFav)")
                        case 2:
                            print("Case 2")
                            foodItemsViewModel.toggleVeryFavorite(for: item, in: foodCategory)
                            
//                            print("\(item.favorite)")
//                            print("\(item.verFav)")
                        default:
                            break
                        }
                    }, label: {
                        Image(systemName:item.favorite ? ( item.verFav ? "checkmark.circle": "multiply.circle") : "circle")
                            .foregroundColor(item.favorite ? (item.verFav ? Color.green: Color.red) : Color.black)
                    })
                }
            }
            .navigationTitle(foodCategory.name)
            
            
            HStack {
                TextField("New item name", text: $newItemName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    let newItem = FoodItem(name: newItemName, favorite: false, verFav: false)
                    foodItemsViewModel.addItem(newItem, to: foodCategory)
                    newItemName = ""
                }, label: {
                    Text("Add Item")
                })
            }
            .padding()
        }
        .onAppear {
            foodItemsViewModel.loadItems(for: foodCategory)
        }
    }
}

struct FoodCategory: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var foodItems: [FoodItem]
}

struct FoodItem: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var favorite: Bool
    var verFav: Bool
    
    //    var image: Image {
    //        Image(systemName: "heart.fill")
    //            .foregroundColor(favorite ? .green : .red) as! Image
    //    }
}

// MARK: - Testing Preview
struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}



// MARK: - Dummy Views
struct View1: View {
    var body: some View{
        Text("View 1")
    }
}

struct View2: View {
    var body: some View{
        Text("View 2")
    }
}

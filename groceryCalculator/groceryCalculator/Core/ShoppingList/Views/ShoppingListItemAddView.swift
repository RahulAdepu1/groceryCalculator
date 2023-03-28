//
//  ShoppingListItemAddView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/26/23.
//

import SwiftUI

struct ShoppingListItemAddView: View {

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var shoppingListItemVM: ShoppingListItemViewModel
    
    @State var textFieldItemName: String = ""
    @State var textFieldItemBrandName: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack() {
                CustomTextField(placeholderText: "Item Name", text: $textFieldItemName, keyboardType: .default)
                CustomTextField(placeholderText: "Brand Name", text: $textFieldItemBrandName, keyboardType: .default)
                Button(action: saveButtonPressed, label: {
                    Text("Add Value")
                        .font(.headline)
                        .foregroundColor(Color.theme.textPrimaryColor)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.theme.buttonAction)
                        .cornerRadius(10)
                        .shadow(radius: 10, x: 5, y: 5)
                })
                .opacity((textFieldItemName.count<2 || textFieldItemBrandName.count<2) ? 0.5 : 1.0)
                .disabled(textFieldItemName.count<2 || textFieldItemBrandName.count<2)
            }
            .font(.headline)
            .padding(15)
        }
        .navigationTitle("Add Items")
    }
    
    func saveButtonPressed(){
        shoppingListItemVM.addItems(itemName: textFieldItemName, itemBrandName: textFieldItemBrandName, itemCount: 1)
        dismiss()
    }
    
}

//MARK: - Preview

struct ShoppingListItemAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ShoppingListItemAddView()
        }
        .environmentObject(ShoppingListItemViewModel())
        .environmentObject(ShoppingListNameViewModel())
    }
}


struct CustomTextField: View {
    
    @State private var offset: CGFloat = 1
    @State private var scaleEffect: CGFloat = 0
    @State private var color: Color = .gray.opacity(0.3)
    var placeholderText: String
    @Binding var text: String
    var keyboardType: UIKeyboardType
    
    var body: some View{
        ZStack(alignment: .leading) {
            Text(placeholderText)
                .padding(10)
                .foregroundColor(text.isEmpty ? color : color)
                .offset(x: 0, y: text.isEmpty ? offset : offset)
                .scaleEffect(text.isEmpty ? scaleEffect : scaleEffect, anchor: .leading)
            TextField(placeholderText+" 2 char min", text: $text)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3))
                )
                .keyboardType(keyboardType)
                .lineLimit(2)
        }
        .padding(.top, 15)
        .onChange(of: text) { newValue in
            withAnimation(.easeInOut) {
                if text.isEmpty{
                    color = .gray.opacity(0.3)
                    offset = 0
                    scaleEffect = 1
                }else{
                    color = Color.theme.textSecondaryColor
                    offset = -34
                    scaleEffect = 0.8
                }
            }
        }
//        .animation(.easeInOut(duration: 2), value: color)
//                .animation(.easeInOut(duration: 2), value: offset)
//                .animation(.easeInOut(duration: 2), value: scaleEffect)
    }
}

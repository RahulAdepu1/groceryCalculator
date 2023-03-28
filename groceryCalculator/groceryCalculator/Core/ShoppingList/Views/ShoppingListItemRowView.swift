//
//  ShoppingListItemRowView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/21/23.
//

import SwiftUI

struct ShoppingListItemRowView: View {
    
    @EnvironmentObject var shoppingListItemVM: ShoppingListItemViewModel
    var shoppingListItem: ShoppingListItemModel
    @State var showSheet: Bool = false
    
    var body: some View{
        HStack(){
            Image(systemName: shoppingListItem.isLooking ? ( shoppingListItem.isFound ? "checkmark.circle" : "multiply.circle" ) :"circle")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(shoppingListItem.isLooking ? ( shoppingListItem.isFound ? Color.green : Color.red ) : Color.theme.textPrimaryColor)
                .padding(.leading, 15)
                .onTapGesture {
                    showSheet.toggle()
                }
            VStack(alignment:.leading) {
                HStack {
                    Text(shoppingListItem.itemName)
                    Text("- "+shoppingListItem.itemBrandName)
                }
                .font(.title2)
                
                Text("Qty: \(shoppingListItem.itemCount)")
                    .font(.body)
            }
            .padding(.leading, 10)
            Spacer()
            
        }
        .padding(.vertical, 10)
        .frame(width: .infinity)
        .background(Color.theme.backgroundSecondaryColor)
        .cornerRadius(10)
        
        .sheet(isPresented: $showSheet) {
            SheetShowView(shoppingListItem: shoppingListItem)
        .presentationDetents([.height(200)])
        }
    }
}

//MARK: - Preview
struct ShoppingListItemRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationStack{
            ShoppingListItemRowView(shoppingListItem: dev.shoppingListItem)
        }
        .environmentObject(ShoppingListItemViewModel())
        .environmentObject(ShoppingListNameViewModel())
    }
}

//MARK: - Sheet Show View
struct SheetShowView: View {
    
    @EnvironmentObject var shoppingListItemVM: ShoppingListItemViewModel
    var shoppingListItem: ShoppingListItemModel
    @Environment (\.dismiss) private var dismiss
    
    var body: some View{
        VStack{
            Button {
                shoppingListItemVM.updateIsLooking(shoppingListItem: shoppingListItem)
                dismiss()
            } label: {
                Text("Still Looking")
                    .foregroundColor(Color.theme.textSecondaryColor)
            }
            .padding(10)
            .foregroundColor(.black)

            Button {
                shoppingListItemVM.updateIsFound(shoppingListItem: shoppingListItem)
                dismiss()
            } label: {
                Text("Found")
                    .foregroundColor(Color.theme.textSecondaryColor)
            }
            .padding(10)
            .foregroundColor(.black)
            
            Button {
                shoppingListItemVM.updateIsNotFound(shoppingListItem: shoppingListItem)
                dismiss()
            } label: {
                Text("Not Found")
                    .foregroundColor(Color.theme.textSecondaryColor)
            }
            .padding(10)
            .foregroundColor(.black)
        }
    }
}

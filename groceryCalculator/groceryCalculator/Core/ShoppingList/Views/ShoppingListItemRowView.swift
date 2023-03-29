//
//  ShoppingListItemRowView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/21/23.
//

import SwiftUI

struct ShoppingListItemRowView: View {
    
    @EnvironmentObject var coreDataVM: CoreDataViewModel
    @Binding var listItemsCoreData: ListItemEntity
    @State var showSheet: Bool = false
    
    var body: some View{
        HStack(){
            Image(systemName: listItemsCoreData.isLooking ? ( listItemsCoreData.isFound ? "checkmark.circle" : "multiply.circle" ) :"circle")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(listItemsCoreData.isLooking ? ( listItemsCoreData.isFound ? Color.green : Color.red ) : Color.theme.textPrimaryColor)
                .padding(.leading, 15)
                .onTapGesture {
                    showSheet.toggle()
                }
            VStack(alignment:.leading) {
                HStack {
                    Text(listItemsCoreData.listItemName ?? "")
                }
                .font(.title2)
                
                Text("Qty: \(listItemsCoreData.listItemCount)")
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
            SheetShowView(listItemsCoreData: listItemsCoreData)
        .presentationDetents([.height(200)])
        }
    }
}

////MARK: - Preview
//struct ShoppingListItemRowView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        NavigationStack{
//            ShoppingListItemRowView(listItemsCoreData: ListItemEntity())
//        }
//        .environmentObject(ShoppingListItemViewModel())
//        .environmentObject(ShoppingListNameViewModel())
//        .environmentObject(CoreDataViewModel())
//    }
//}

//MARK: - Sheet Show View
struct SheetShowView: View {
    
    @EnvironmentObject var coreDataVM: CoreDataViewModel
    let listItemsCoreData: ListItemEntity

    @Environment (\.dismiss) private var dismiss
    
    var body: some View{
        VStack{
            Button {
                coreDataVM.updateIsLooking(listItemsCoreData: listItemsCoreData)
                dismiss()
            } label: {
                Text("Still Looking")
                    .foregroundColor(Color.theme.textSecondaryColor)
            }
            .padding(10)
            .foregroundColor(.black)

            Button {
                coreDataVM.updateIsFound(listItemsCoreData: listItemsCoreData)
                dismiss()
            } label: {
                Text("Found")
                    .foregroundColor(Color.theme.textSecondaryColor)
            }
            .padding(10)
            .foregroundColor(.black)
            
            Button {
                coreDataVM.updateIsNotFound(listItemsCoreData: listItemsCoreData)
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

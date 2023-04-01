//
//  PantryView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/31/23.
//

import SwiftUI

struct PantryView: View {
    var body: some View {
        ZStack {
            VStack {
                ScrollView{
                    ForEach(0..<5, id: \.self) { item in
                        pantryRowView()
                    }
                    
                }.padding(.top, 30)
            }
            .background(Color.black.opacity(0.4))
        }
        .navigationTitle("Pantry")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PantryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            pantryItemDetailView()
        }
        .environmentObject(ListNameCoreDataVM())
    }
}


//MARK: - Pantry Row View

struct pantryRowView: View {
    
    @State var detailSheet: Bool = false
    
    var body: some View{
        HStack{
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white.opacity(0.5))
                .frame(width: 50, height: 50)
                .padding(10)
                .background(
                    Color.black.opacity(0.5)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                )
                .padding(.leading, 10)
            
            VStack(alignment: .leading) {
                Text("Item Name")
                    .font(.title)
                    .padding(.top, 1)
                Text("Brand Name")
                    .padding(.bottom, 1)
            }
            Spacer()
            VStack(alignment: .center){
                Text("Expires in")
                    .font(.subheadline)
                Text("26")
                    .font(.title)
            }
        }
        .onTapGesture {
            detailSheet.toggle()
        }
        .foregroundColor(.white.opacity(0.5))
        .padding(10)
        .frame(maxWidth: .infinity)
        .background(Color.black.opacity(0.5))
        .cornerRadius(10)
        .padding(.horizontal, 20)
        .sheet(isPresented: $detailSheet) {
            pantryItemDetailView()
        }
    }
}

//MARK: - Pantry Item Detail View

struct pantryItemDetailView: View {
    var body: some View{
        VStack{
            HStack{
                Spacer()
                Text("Done")
                    .padding(10)
                    .padding(.horizontal, 10)
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(10)
            }
            Spacer()
            HStack{
                Text("Section 2")
                    .background(Color.black.opacity(0.2))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray)
    }
}

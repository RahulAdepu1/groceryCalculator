//
//  CustomAddButtonView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/25/23.
//

import SwiftUI

struct CustomAddButtonView: View {
    var body: some View {
        Image(systemName: "plus")
            .font(.headline)
            .foregroundColor(Color.black)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.white)
            )
            .shadow(color: Color.black.opacity(0.2), radius: 10)
    }
}

struct CustomAddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAddButtonView()
    }
}

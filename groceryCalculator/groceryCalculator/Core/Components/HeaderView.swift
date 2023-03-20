//
//  HeaderView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/19/23.
//

import SwiftUI

struct HeaderView: View {
    
    let leftIconName: String
    let rightIconName: String
    
    var body: some View {
            HStack {
                CircleButtonView(iconName: leftIconName) //"line.3.horizontal"
                Spacer()
                Text("Title")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.theme.tempColor)
                Spacer()
                CircleButtonView(iconName: rightIconName) //"plus"
            }
            .frame(height: 50)
            .padding(.horizontal, 10)
            .padding(.bottom, 5)
            .background(Color.theme.backgroundPrimaryColor)
//            .cornerRadius(20)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(leftIconName: "line.3.horizontal", rightIconName: "plus")
    }
}

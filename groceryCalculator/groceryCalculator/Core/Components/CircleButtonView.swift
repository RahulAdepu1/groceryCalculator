//
//  CircleButtonView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/18/23.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.tempColor)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.white)
            )
            .shadow(
                color: Color.theme.tempColor.opacity(0.25),
                radius: 10)
            .padding(10)
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(iconName: "heart.fill")
            .previewLayout(.sizeThatFits)
    }
}

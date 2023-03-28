//
//  CustomCircleButtonView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/18/23.
//

import SwiftUI

struct CustomCircleButtonView<Destination:View>: View {
    
    var image: Image
    var destination: Destination
    
    var body: some View {
        NavigationLink(
            destination: destination,
            label: {image
                    .font(.headline)
                    .foregroundColor(Color.theme.tempColor)
                    .frame(width: 50, height: 50)
                    .background(
                        Circle()
                            .foregroundColor(Color.white)
                    )
                    .shadow(color: Color.theme.tempColor.opacity(0.25), radius: 10) }
        )
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleButtonView(image: Image(systemName: "plus"), destination: Text(""))
    }
}

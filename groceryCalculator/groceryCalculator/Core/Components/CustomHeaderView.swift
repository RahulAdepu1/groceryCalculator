//
//  CustomHeaderView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/19/23.
//

import SwiftUI

struct CustomHeaderView<LeftButtonDestination: View, RightButtonDestination: View>: View {
    var title: String
    var leftButtonImage: Image? = nil
    var leftButtonDestination: LeftButtonDestination? = nil
    var rightButtonImage: Image? = nil
    var rightButtonDestination: RightButtonDestination? = nil

    var body: some View {
        ZStack {
            Text(title)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.tempColor)
                .frame(minWidth: 0, maxWidth: .infinity)
            VStack {
                HStack {
                    if let leftButtonDestination = leftButtonDestination {
                        CustomCircleButtonView(
                            image: leftButtonImage ?? Image(systemName: "chevron.left"),
                            destination: leftButtonDestination
                        )
                    }
                    Spacer()

                    if let rightButtonDestination = rightButtonDestination {
                        CustomCircleButtonView(
                            image: rightButtonImage ?? Image(systemName: "plus"),
                            destination: rightButtonDestination
                        )
                    }
                }
                .padding(.horizontal, 20)
                Divider()
            }
        }
    }
}

extension CustomHeaderView where LeftButtonDestination == Never {
    init(title: String, rightButtonImage: Image? = nil, rightButtonDestination: RightButtonDestination) {
        self.title = title
        self.rightButtonImage = rightButtonImage
        self.rightButtonDestination = rightButtonDestination
    }
}

extension CustomHeaderView where RightButtonDestination == Never {
    init(title: String, leftButtonImage: Image? = nil, leftButtonDestination: LeftButtonDestination) {
        self.title = title
        self.leftButtonImage = leftButtonImage
        self.leftButtonDestination = leftButtonDestination
    }
}

extension CustomHeaderView where LeftButtonDestination == Never, RightButtonDestination == Never {
    init(title: String) {
        self.title = title
    }
}

struct HeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        CustomHeaderView(title: "Title", leftButtonImage: Image(systemName: "line.3.horizontal"), leftButtonDestination: View1(), rightButtonImage: Image(systemName: "plus"), rightButtonDestination: View1())
    }
}

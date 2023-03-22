//
//  TestingView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/21/23.
//

import SwiftUI

struct TestingView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                CustomHeaderViewTesting(
                    title: "My Header",
                    leftButtonImage: Image(systemName: "plus"),
                    leftButtonDestination: View1() ,
                    rightButtonImage: Image(systemName: "plus"),
                    rightButtonDestination: View1()
                )
                
            }
        }
    }
}

struct View1: View {
    var body: some View {
        Text("Hello View 1")
    }
}

struct View2: View {
    var body: some View {
        Text("Hello View 2")
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}


struct CustomButton<Destination:View>: View {
    var image: Image
    var destination: Destination
    
    var body: some View {
        NavigationLink(
            destination: destination,
            label: {
                image
                    .font(.headline)
                    .foregroundColor(Color.theme.tempColor)
                    .frame(width: 50, height: 50)
                    .background(
                        Circle()
                            .foregroundColor(Color.white)
                    )
                    .shadow(
                        color: Color.theme.tempColor.opacity(0.25),
                        radius: 10) }
        )
    }
}

struct CustomHeaderViewTesting<LeftButtonDestination: View, RightButtonDestination: View>: View {
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
            HStack {
                if let leftButtonDestination = leftButtonDestination {
                    CustomButton(
                        image: leftButtonImage ?? Image(systemName: "chevron.left"),
                        destination: leftButtonDestination
                    )
                }
                Spacer()

                if let rightButtonDestination = rightButtonDestination {
                    CustomButton(
                        image: rightButtonImage ?? Image(systemName: "plus"),
                        destination: rightButtonDestination
                    )
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

extension CustomHeaderViewTesting where LeftButtonDestination == Never {
    init(title: String, rightButtonImage: Image? = nil, rightButtonDestination: RightButtonDestination) {
        self.title = title
        self.rightButtonImage = rightButtonImage
        self.rightButtonDestination = rightButtonDestination
    }
}

extension CustomHeaderViewTesting where RightButtonDestination == Never {
    init(title: String, leftButtonImage: Image? = nil, leftButtonDestination: LeftButtonDestination) {
        self.title = title
        self.leftButtonImage = leftButtonImage
        self.leftButtonDestination = leftButtonDestination
    }
}

extension CustomHeaderViewTesting where LeftButtonDestination == Never, RightButtonDestination == Never {
    init(title: String) {
        self.title = title
    }
}

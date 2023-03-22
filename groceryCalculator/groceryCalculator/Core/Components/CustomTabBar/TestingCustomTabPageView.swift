//
//  TestingCustomTabPageView.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/20/23.
//

import SwiftUI

struct TestingCustomTabPageView: View {
      
      @State private var currentIndex = 0
      private let colors: [Color] = [.red, .blue, .green, .yellow]
      
    var body: some View {
        VStack{
            TabView(selection: $currentIndex.animation()) { // 1
                ForEach(0..<colors.count, id: \.self) { index in
                    colors[index]
                        .tag(index)
                }
            }
            //        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            //        .overlay(
            //            Fancy3DotsIndexView(numberOfPages: colors.count, currentIndex: currentIndex)
            //                .background(Color.black)
            //        ) // 2
            Fancy3DotsIndexView(numberOfPages: colors.count, currentIndex: currentIndex)
                .background(Color.black)
        }
    }
}

struct TestingCustomTabPageView_Previews: PreviewProvider {
    static var previews: some View {
        TestingCustomTabPageView()
    }
}

struct Fancy3DotsIndexView: View {
  
  let numberOfPages: Int
  let currentIndex: Int
  
  private let circleSize: CGFloat = 16
  private let circleSpacing: CGFloat = 12
  
  private let primaryColor = Color.white
  private let secondaryColor = Color.white.opacity(0.6)
  
  private let smallScale: CGFloat = 0.6
  
  var body: some View {
      HStack(alignment: .bottom, spacing: circleSpacing) {
      ForEach(0..<numberOfPages) { index in // 1
        if shouldShowIndex(index) {
          Circle()
            .fill(currentIndex == index ? primaryColor : secondaryColor) // 2
            .scaleEffect(currentIndex == index ? 1 : smallScale)
            
            .frame(width: circleSize, height: circleSize)
       
            .transition(AnyTransition.opacity.combined(with: .scale)) // 3
            
            .id(index) // 4
        }
      }
    }
  }
  
  func shouldShowIndex(_ index: Int) -> Bool {
    ((currentIndex - 1)...(currentIndex + 1)).contains(index)
  }
}

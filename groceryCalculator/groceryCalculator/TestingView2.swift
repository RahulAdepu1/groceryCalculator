//
//  TestingView2.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/23/23.
//

import SwiftUI

struct TestingView2: View {

    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Section 1")) {
                    Text("Hello")
                }
            }
        }
    }
}

struct TestingView2_Previews: PreviewProvider {
    static var previews: some View {
        TestingView2()
    }
}

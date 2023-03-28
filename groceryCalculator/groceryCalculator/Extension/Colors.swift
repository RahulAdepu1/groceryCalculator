//
//  Colors.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/18/23.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    let tempColor = Color(.black)
    let buttonAction = Color("buttonAction")
    let textPrimaryColor = Color("textPrimary")
    let textSecondaryColor = Color("textSecondary")
    let backgroundPrimaryColor = Color("backgroundPrimary")
    let backgroundSecondaryColor = Color("backgroundSecondary")
}

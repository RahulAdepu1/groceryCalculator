//
//  Double.swift
//  groceryCalculator
//
//  Created by Rahul Adepu on 3/22/23.
//

import Foundation

extension Double {
    
    ///Converts a Double into a Currency with 2 Decimal Places
    ///```
    ///Convert 1234.56  to 1234.56
    ///Convert 12.3456  to 12.34
    ///Convert 0.123456 to 0.12
    ///```
    private var currencyFormatter2: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current             // For Default Value
        formatter.currencyCode = "USD"          // Change currency
        formatter.currencySymbol = "$"          // Change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    
    ///Converts a Double into a Currency as a String with 2-6 Decimal Places
    ///```
    ///Convert 1234.56  to "$1234.56"
    ///Convert 12.3456  to "$12.34"
    ///Convert 0.123456 to "$0.12"
    ///```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    ///Converts a Double into a Currency with 2-6 Decimal Places
    ///```
    ///Convert 1234.56  to 1234.56
    ///Convert 12.3456  to 12.3456
    ///Convert 0.123456 to 0.123456
    ///```
    private var currencyFormatter6: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current             // For Default Value
        formatter.currencyCode = "USD"          // Change currency
        formatter.currencySymbol = "$"          // Change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    
    ///Converts a Double into a Currency as a String with 2-6 Decimal Places
    ///```
    ///Convert 1234.56  to "$1234.56"
    ///Convert 12.3456  to "$12.3456"
    ///Convert 0.123456 to "$0.123456"
    ///```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    
    ///Converts a Double into a string represntation of percentage symbol
    ///```
    ///Convert 1.23456  to "$1.23"
    ///```
    func asPercentageString() -> String {
        return String(format: "%.2f", self) + "%"
    }
    
}

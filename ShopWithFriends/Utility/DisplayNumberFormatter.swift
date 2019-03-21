//
//  DisplayNumberFormatter.swift
//  ShopWithFriends
//
//  Created by John De Guzman on 2019-03-19.
//  Copyright © 2019 John De Guzman. All rights reserved.
//

import Foundation

class DisplayNumberFormatter {
    static var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        return formatter
    }()
    
    class func transform<NumberType: Numeric>(from: NumberType, style: NumberFormatter.Style = .currency, setOptions: (NumberFormatter) -> Void) -> String? {
        formatter.numberStyle = style
        setOptions(formatter)
        return formatter.string(from: from as! NSNumber)
    }
}

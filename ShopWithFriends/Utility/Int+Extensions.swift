//
//  Int+Extensions.swift
//  ShopWithFriends
//
//  Created by John De Guzman on 2019-03-19.
//  Copyright © 2019 John De Guzman. All rights reserved.
//

import Foundation
import UIKit

extension Int {
    func currency(_ withDecimal: Bool = true) -> String {
        return DisplayNumberFormatter.transform(from: self, style: .currency, setOptions: { formatter in
            formatter.maximumFractionDigits = withDecimal ? 2 : 0
            formatter.minimumFractionDigits = withDecimal ? 2 : 0
        })!
    }
}

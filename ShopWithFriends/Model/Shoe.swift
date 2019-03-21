//
//  Shoe.swift
//  ShopWithFriends
//
//  Created by John De Guzman on 2019-03-19.
//  Copyright © 2019 John De Guzman. All rights reserved.
//

import Foundation

struct FetchShoeResponse: Codable {
    var Products: [Shoe]
}

struct Shoe: Codable {
    
    struct media: Codable {
        var imageUrl: String
    }
    
    var id: String
    var title: String
    var media: media
    var retailPrice: Int
}

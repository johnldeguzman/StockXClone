//
//  Router.swift
//  ShopWithFriends
//
//  Created by John De Guzman on 2019-03-19.
//  Copyright © 2019 John De Guzman. All rights reserved.
//

import Foundation
import Alamofire


class API {
    
    //https://stockx.com/api/browse?currency=USD&order=DESC&productCategory=sneakers&sort=most-active
    
    static let basePath = "https://stockx.com/api/"
    
    enum Sort: String {
        case mostActive = "most-active"
        case featured = "featured"
    }
    
    enum Order: String {
        case descending = "DESC"
        case ascending = "ASC"
    }
    
    enum ProductCategory: String {
        case sneakers = "sneakers"
        case streetwear = "streetwear"
    }
    
    enum Currency: String {
        case usd = "USD"
        case cad = "CAD"
    }
    
    class func fetchProducts(productCategory: ProductCategory, order: Order? = nil, sort: Sort? = nil, currency: Currency = .usd, onComplete: @escaping (FetchShoeResponse) -> Void) {
        
        let path = basePath + "browse"
        
        var parameters: [String: String] = [:]
        parameters["productCategory"] = productCategory.rawValue
        parameters["currency"] = currency.rawValue
        
        
        if let order = order {
           parameters["order"] = order.rawValue
        }
        
        if let sort = sort {
            parameters["sort"] = sort.rawValue
        }
        
        Alamofire.request(path, method: .get, parameters: parameters).responseData { response in
    
            let decoder = JSONDecoder()
            let data: Result<FetchShoeResponse> = decoder.decodeResponse(FetchShoeResponse.self, from: response)
            
            switch data {
            case .success(let value):
                onComplete(value)
            case .failure(let error):
                //Manage error here
                print(error)
            }
        }
    }
    
}



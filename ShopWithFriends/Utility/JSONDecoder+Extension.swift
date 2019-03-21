//
//  JSONDecoder+Extension.swift
//  ShopWithFriends
//
//  Created by John De Guzman on 2019-03-19.
//  Copyright © 2019 John De Guzman. All rights reserved.
//

import Alamofire
import Foundation

extension JSONDecoder {
    func decodeResponse<T: Decodable>(_ type: T.Type, from response: DataResponse<Data>) -> Result<T> {
        if let error = response.error {
            return .failure(error)
        }
        
        guard let responseData = response.data else {
             let error = NSError(domain:"", code:500, userInfo:nil)
            return .failure(error)
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            return .failure(error)
        }
    }
}

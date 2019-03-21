//
//  ImageCell.swift
//  ShopWithFriends
//
//  Created by John De Guzman on 2019-03-19.
//  Copyright © 2019 John De Guzman. All rights reserved.
//

import Foundation
import FunctionalTableData
import PINRemoteImage

public typealias ImageCell = HostCell<UIImageView, ImageState, LayoutMarginsTableItemLayout>

/// A very simple state for a `UILabel` allowing a quick configuration of its text, font, and color values.
public struct ImageState: Equatable {
    public let url: String
    public let size: CGSize
    
    public init(url: String, size: CGSize) {
        self.url = url
        self.size = size
    }
    
    public static func updateView(_ view: UIImageView, state: ImageState?) {
        guard let state = state else {
            view.image = nil
            return
        }
        
        let urlImageRequest = URL(string: state.url)
        view.pin_setImage(from: urlImageRequest)
    }
    
    public static func ==(lhs: ImageState, rhs: ImageState) -> Bool {
        return lhs.url == rhs.url && lhs.size == rhs.size
    }
}

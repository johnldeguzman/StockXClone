//
//  ImageWithLabelCell.swift
//  ShopWithFriends
//
//  Created by John De Guzman on 2019-03-19.
//  Copyright © 2019 John De Guzman. All rights reserved.
//

import UIKit
import FunctionalTableData
import PINRemoteImage

typealias ImageLabelCell = HostCell<ImageLabelView, ImageLabelState, LayoutMarginsTableItemLayout>

class ImageLabelView: UIView {
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let subtitle = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.numberOfLines = 0
        
        let stack = UIView.createStackView(direction: .vertical )
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(subtitle)
        
        fill(with: stack)
        
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

struct ImageLabelState {
    let url: String
    let title: String
    let titleFont: UIFont
    let colour: UIColor
    let subtitle: String
    let subtitleFont: UIFont
    
    init(url: String, title: String, titleFont: UIFont = UIFont.boldSystemFont(ofSize: 12), subtitle: String, subtitleFont: UIFont =  UIFont.systemFont(ofSize: 11), colour: UIColor = UIColor.black) {
        self.url = url
        self.title = title
        self.titleFont = titleFont
        self.subtitle = subtitle
        self.subtitleFont = subtitleFont
        self.colour = colour
    }
    
    public static func updateView(_ view: ImageLabelView, state: ImageLabelState?) {
        guard let state = state else {
            view.titleLabel.text = nil
            view.imageView.image = nil
            return
        }
        
        view.titleLabel.text = state.title
        view.titleLabel.font = state.titleFont
        view.titleLabel.textColor = state.colour
        
        view.subtitle.text = state.subtitle
        view.subtitle.font = state.subtitleFont
        view.subtitle.textColor = state.colour
        
        let urlImageRequest = URL(string: state.url)
        
        view.imageView.pin_setImage(from: urlImageRequest)
    }
    
  
}

extension ImageLabelState: Equatable {
    public static func ==(lhs: ImageLabelState, rhs: ImageLabelState) -> Bool {
        return lhs.url == rhs.url && lhs.title == rhs.title && lhs.colour == rhs.colour && lhs.titleFont == rhs.titleFont && lhs.subtitleFont == rhs.subtitleFont && lhs.subtitle == rhs.subtitle
    }
}




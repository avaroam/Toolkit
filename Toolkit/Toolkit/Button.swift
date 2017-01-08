//
//  Button.swift
//  Toolkit
//
//  Created by Avario on 6/01/17.
//  Copyright © 2017 Avario. All rights reserved.
//

import Foundation
import UIKit

public extension UIButton {
    public var text: String? {
        get {
            return self.titleLabel!.text
        }
        set {
            self.setTitle(newValue, for: .normal)
        }
    }
    
    public var textColor: UIColor? {
        get {
            return self.titleLabel?.textColor
        }
        set {
            self.setTitleColor(newValue, for: .normal)
        }
    }
    
    public var image: UIImage? {
        get {
            return self.imageView?.image
        }
        set {
            self.setImage(newValue, for: .normal)
        }
    }
    
    public func addTarget(_ target: Any?, _ action: Selector) {
        self.addTarget(target, action: action, for: .touchUpInside)
    }
}

//
//  Button.swift
//  Toolkit
//
//  Created by Avario on 6/01/17.
//  Copyright © 2017 Avario. All rights reserved.
//

import Foundation
import UIKit

var ActionBlockKey: UInt8 = 0

typealias BlockButtonActionBlock = () -> Void

class ActionBlockWrapper : NSObject {
    var block : BlockButtonActionBlock
    
    init(block: @escaping BlockButtonActionBlock) {
        self.block = block
    }
}

extension UIButton {
    func setAction(_ block: @escaping BlockButtonActionBlock) {
        objc_setAssociatedObject(self, &ActionBlockKey, ActionBlockWrapper(block: block), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addTarget(self, #selector(block_handleAction))
    }
    
    func block_handleAction(sender: UIButton) {
        let wrapper = objc_getAssociatedObject(self, &ActionBlockKey) as! ActionBlockWrapper
        wrapper.block()
    }
}

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

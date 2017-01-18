//
//  ViewProperties.swift
//  Toolkit
//
//  Created by Avario on 6/01/17.
//  Copyright © 2017 Avario. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    public convenience init(dimension: CGFloat) {
        self.init(frame: CGRect(square: dimension))
    }
    
    public convenience init(width: CGFloat, height: CGFloat) {
        self.init(frame: CGRect(size: CGSize(width, height)))
    }
    
    public convenience init(size: CGSize) {
        self.init(frame: CGRect(size: size))
    }
    
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    public var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }
    
    public var top: CGFloat {
        return self.y
    }
    
    public var left: CGFloat {
        return self.x
    }
    
    public var bottom: CGFloat {
        return self.y + self.height
    }
    
    public var right: CGFloat {
        return self.x + self.width
    }
    
    public var insets: UIEdgeInsets {
        if let superview = self.superview {
            return UIEdgeInsets(top: self.top, left: self.left, bottom: superview.height - self.bottom, right: superview.width - self.right)
        } else {
            return UIEdgeInsets.zero
        }
    }
}

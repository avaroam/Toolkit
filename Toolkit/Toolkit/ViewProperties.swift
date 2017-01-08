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
    
    public convenience init(_ dimension: CGFloat) {
        self.init(frame: CGRect(square: dimension))
    }
    
    public convenience init(size: CGSize) {
        self.init(frame: CGRect(size: size))
    }
    
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    public var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
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

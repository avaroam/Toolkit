//
//  Geometry.swift
//  Toolkit
//
//  Created by Avario on 6/01/17.
//  Copyright © 2017 Avario. All rights reserved.
//

import Foundation
import UIKit

// Mark: Point

public extension CGPoint {
    public init(_ xValue: CGFloat, _ yValue: CGFloat) {
        self.init(x: xValue, y: yValue)
    }
}

// Mark: Size

public extension CGSize {
    public init(_ widthValue: CGFloat, _ heightValue: CGFloat) {
        self.init(width: widthValue, height: heightValue)
    }
    
    public init(square: CGFloat) {
        self.init(square, square)
    }
}

// Mark: Insets

public extension UIEdgeInsets {
    public init(_ topValue: CGFloat, _ leftValue: CGFloat, _ bottomValue: CGFloat, _ rightValue: CGFloat) {
        self.init(top: topValue, left: leftValue, bottom: bottomValue, right: rightValue)
    }
    
    public init(top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil, others : CGFloat = 0) {
        self.init(top ?? others, left ?? others, bottom ?? others, right ?? others)
    }
    
    public init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(vertical, horizontal, vertical, horizontal)
    }
    
    public init(_ inset: CGFloat) {
        self.init(inset, inset, inset, inset)
    }
    
    public static func +(left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets {
        return self.init(left.top + right.top, left.left + right.left, left.bottom + right.bottom, left.right + right.right)
    }
    
    public static func -(left: UIEdgeInsets, right: UIEdgeInsets) -> UIEdgeInsets {
        return self.init(left.top - right.top, left.left - right.left, left.bottom - right.bottom, left.right - right.right)
    }
}


// Mark: Rect

public extension CGRect {
    public init(_ originValue: CGPoint, _ sizeValue: CGSize) {
        self.init(origin: originValue, size: sizeValue)
    }
    
    public init(_ xValue: CGFloat, _ yValue: CGFloat, _ widthValue: CGFloat, _ heightValue: CGFloat) {
        self.init(x: xValue, y: yValue, width: widthValue, height: heightValue)
    }
    
    public init(size: CGSize, center: CGPoint? = nil){
        self.init(center != nil ? center!.x - size.width/2 : 0, center != nil ? center!.y - size.height/2 : 0, size.width, size.height)
    }
    
    public init(square: CGFloat) {
        self.init(size: CGSize(square: square))
    }
    
    public static func -(rect: CGRect, insets: UIEdgeInsets) -> CGRect {
        return self.init(rect.origin.x + insets.left, rect.origin.y + insets.top, rect.size.width - insets.left - insets.right, rect.size.height - insets.top - insets.bottom)
    }
    
    public static func +(rect: CGRect, insets: UIEdgeInsets) -> CGRect {
        return self.init(rect.origin.x - insets.left, rect.origin.y - insets.top, rect.size.width + insets.left + insets.right, rect.size.height + insets.top + insets.bottom)
    }
}

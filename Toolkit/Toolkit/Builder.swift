//
//  Builder.swift
//  Toolkit
//
//  Created by Avario on 10/01/17.
//  Copyright © 2017 Avario. All rights reserved.
//

import Foundation
import UIKit

public class Builder {
    static public let sharedBuilder = Builder()
    
    public var viewHierarchy: [UIView] = []
    
    public var currentView: UIView? {
        return viewHierarchy.last
    }
    
    var backgroundColor: UIColor? {
        get {
            return currentView?.backgroundColor
        }
        set {
            currentView?.backgroundColor = newValue
        }
    }
    
    @objc var textColor: UIColor? {
        get {
            return currentView?.value(forKey: #keyPath(textColor)) as! UIColor?
        }
        set {
            currentView?.setValue(newValue, forKey: #keyPath(textColor))
        }
    }
    
    @objc var text: String? {
        get {
            return currentView?.value(forKey: #keyPath(text)) as! String?
        }
        set {
            currentView?.setValue(newValue, forKey: #keyPath(text))
        }
    }
    
    @objc var font: UIFont? {
        get {
            return currentView?.value(forKey: #keyPath(font)) as! UIFont?
        }
        set {
            currentView?.setValue(newValue, forKey: #keyPath(font))
        }
    }
    
    @objc var textAlignment: NSTextAlignment {
        get {
            return currentView?.value(forKey: #keyPath(textAlignment)) as! NSTextAlignment
        }
        set {
            currentView?.setValue(newValue.rawValue, forKey: #keyPath(textAlignment))
        }
    }
    
    @objc var numberOfLines: Int {
        get {
            return currentView?.value(forKey: #keyPath(numberOfLines)) as! Int
        }
        set {
            currentView?.setValue(newValue, forKey: #keyPath(numberOfLines))
        }
    }
    
    @objc var contentMode: UIViewContentMode {
        get {
            return currentView?.value(forKey: #keyPath(contentMode)) as! UIViewContentMode
        }
        set {
            currentView?.setValue(newValue.rawValue, forKey: #keyPath(contentMode))
        }
    }
    
    @objc var selectionStyle: UITableViewCellSelectionStyle {
        get {
            return currentView?.value(forKey: #keyPath(selectionStyle)) as! UITableViewCellSelectionStyle
        }
        set {
            currentView?.setValue(newValue.rawValue, forKey: #keyPath(selectionStyle))
        }
    }
    
    var layer: CALayer {
        get {
            if let layer = currentView?.layer {
                return layer
            }
            else {
                return CALayer()
            }
        }
        set {
            fatalError("Layer is read-only")
        }
    }
    
    @objc var clipsToBounds: Bool {
        get {
            return currentView?.value(forKey: #keyPath(clipsToBounds)) as! Bool
        }
        set {
            currentView?.setValue(newValue, forKey: #keyPath(clipsToBounds))
        }
    }
    
    @objc var alpha: CGFloat {
        get {
            return currentView?.value(forKey: #keyPath(alpha)) as! CGFloat
        }
        set {
            currentView?.setValue(newValue, forKey: #keyPath(alpha))
        }
    }
}

infix operator >->

public extension UIView {
    
    @discardableResult public static func >-> (lhs: UIView, rhs: () -> Void) -> UIView {
        
        if let superview = Builder.sharedBuilder.viewHierarchy.last {
            superview.addSubview(lhs)
        }
        
        Builder.sharedBuilder.viewHierarchy.append(lhs)
        
        rhs()
        
        Builder.sharedBuilder.viewHierarchy.removeLast()
        
        return lhs
    }
}

prefix operator <-

@discardableResult public prefix func <-  (attribute: Attribute) -> [NSLayoutConstraint] {
    return Builder.sharedBuilder.currentView! <- [attribute]
}

@discardableResult public prefix func <-  (attributes: [Attribute]) -> [NSLayoutConstraint] {
    return Builder.sharedBuilder.currentView! <- attributes
}




public protocol BuilderProtocol {
    var __backgroundColor: UIColor? { get set }
    var __textColor: UIColor? { get set }
    var __text: String? { get set }
    var __font: UIFont? { get set }
    var __textAlignment: NSTextAlignment { get set }
    var __numberOfLines: Int { get set }
    var __contentMode: UIViewContentMode { get set }
    var __layer: CALayer { get set }
    var __selectionStyle: UITableViewCellSelectionStyle { get set }
    var __clipsToBounds: Bool { get set }
    var __alpha: CGFloat { get set }
}

extension UIViewController: BuilderProtocol {
    
    public var __backgroundColor: UIColor? {
        get { return Builder.sharedBuilder.backgroundColor }
        set { Builder.sharedBuilder.backgroundColor = newValue }
    }
    
    public var __textColor: UIColor? {
        get { return Builder.sharedBuilder.textColor }
        set { Builder.sharedBuilder.textColor = newValue }
    }
    
    public var __text: String? {
        get { return Builder.sharedBuilder.text }
        set { Builder.sharedBuilder.text = newValue }
    }
    
    public var __font: UIFont? {
        get { return Builder.sharedBuilder.font }
        set { Builder.sharedBuilder.font = newValue }
    }
    
    public var __textAlignment: NSTextAlignment {
        get { return Builder.sharedBuilder.textAlignment }
        set { Builder.sharedBuilder.textAlignment = newValue }
    }
    
    public var __numberOfLines: Int {
        get { return Builder.sharedBuilder.numberOfLines }
        set {  Builder.sharedBuilder.numberOfLines = newValue }
    }
    
    public var __contentMode: UIViewContentMode {
        get { return Builder.sharedBuilder.contentMode }
        set { Builder.sharedBuilder.contentMode = newValue }
    }
    
    public var __selectionStyle: UITableViewCellSelectionStyle {
        get { return Builder.sharedBuilder.selectionStyle }
        set { Builder.sharedBuilder.selectionStyle = newValue }
    }
    
    public var __layer: CALayer {
        get { return Builder.sharedBuilder.layer }
        set { Builder.sharedBuilder.layer = newValue }
    }
    
    public var __clipsToBounds: Bool {
        get { return Builder.sharedBuilder.clipsToBounds }
        set { Builder.sharedBuilder.clipsToBounds = newValue }
    }
    
    public var __alpha: CGFloat {
        get { return Builder.sharedBuilder.alpha }
        set { Builder.sharedBuilder.alpha = newValue }
    }
}

extension UIView: BuilderProtocol {
    
    public var __backgroundColor: UIColor? {
        get { return Builder.sharedBuilder.backgroundColor }
        set { Builder.sharedBuilder.backgroundColor = newValue }
    }
    
    public var __textColor: UIColor? {
        get { return Builder.sharedBuilder.textColor }
        set { Builder.sharedBuilder.textColor = newValue }
    }
    
    public var __text: String? {
        get { return Builder.sharedBuilder.text }
        set { Builder.sharedBuilder.text = newValue }
    }
    
    public var __font: UIFont? {
        get { return Builder.sharedBuilder.font }
        set { Builder.sharedBuilder.font = newValue }
    }
    
    public var __textAlignment: NSTextAlignment {
        get { return Builder.sharedBuilder.textAlignment }
        set { Builder.sharedBuilder.textAlignment = newValue }
    }
    
    public var __numberOfLines: Int {
        get { return Builder.sharedBuilder.numberOfLines }
        set {  Builder.sharedBuilder.numberOfLines = newValue }
    }
    
    public var __contentMode: UIViewContentMode {
        get { return Builder.sharedBuilder.contentMode }
        set { Builder.sharedBuilder.contentMode = newValue }
    }
    
    public var __selectionStyle: UITableViewCellSelectionStyle {
        get { return Builder.sharedBuilder.selectionStyle }
        set { Builder.sharedBuilder.selectionStyle = newValue }
    }
    
    public var __layer: CALayer {
        get { return Builder.sharedBuilder.layer }
        set { Builder.sharedBuilder.layer = newValue }
    }
    
    public var __clipsToBounds: Bool {
        get { return Builder.sharedBuilder.clipsToBounds }
        set { Builder.sharedBuilder.clipsToBounds = newValue }
    }
    
    public var __alpha: CGFloat {
        get { return Builder.sharedBuilder.alpha }
        set { Builder.sharedBuilder.alpha = newValue }
    }
}

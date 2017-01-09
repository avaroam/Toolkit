//
//  Layout.swift
//  Toolkit
//
//  Created by Avario on 6/01/17.
//  Copyright © 2017 Avario. All rights reserved.
//

import Foundation
import UIKit

infix operator <<-

public extension UIView {
    
    @discardableResult public static func <<- (lhs: UIView, rhs: Attribute) -> [NSLayoutConstraint] {
        return lhs <<- [rhs]
    }

    @discardableResult public static func <<- (lhs: UIView, rhs: [Attribute]) -> [NSLayoutConstraint] {
        lhs.translatesAutoresizingMaskIntoConstraints = false
        let constraints = lhs.apply(attributes: rhs)
        
        lhs.superview?.layoutIfNeeded()
        
        return constraints
    }
    
}

public typealias Fill = Edges

public class FillEdge: CompoundAttribute {
    public init(_ edge: ReferenceAttribute, _ length: CGFloat, _ insets: UIEdgeInsets = UIEdgeInsets.zero) {
        super.init()
        switch edge {
        case .top:
            self.attributes = [
                Top(insets.top),
                Left(insets.left),
                Right(insets.right),
                Height(length)
            ]
        case .left:
            self.attributes = [
                Top(insets.top),
                Left(insets.left),
                Bottom(insets.bottom),
                Width(length)
            ]
        case .bottom:
            self.attributes = [
                Left(insets.left),
                Right(insets.right),
                Bottom(insets.bottom),
                Height(length)
            ]
        case .right:
            self.attributes = [
                Top(insets.top),
                Right(insets.right),
                Bottom(insets.bottom),
                Width(length)
            ]
        default:
            fatalError("FillEdge can only be used with an edge attribute.")
        }
    }
}

public class Corner: CompoundAttribute {
    public init(_ verticalEdge: ReferenceAttribute, _ horizontalEdge: ReferenceAttribute, _ size: CGSize, _ insets: UIEdgeInsets = UIEdgeInsets.zero) {
        super.init()
        
        self.attributes = [Size(size)]
        
        switch verticalEdge {
        case .top:
            self.attributes.append(Top(insets.top))
        case .bottom:
            self.attributes.append(Bottom(insets.bottom))
        default:
            fatalError("This is not a vertical edge.")
        }
        
        switch horizontalEdge {
        case .left:
            self.attributes.append(Left(insets.left))
        case .right:
            self.attributes.append(Right(insets.right))
        default:
            fatalError("This is not a horizontal edge.")
        }
    }
}

public class Beside: CompoundAttribute {
    public init(_ view: UIView, _ edge: ReferenceAttribute, _ length: CGFloat, _ insets: UIEdgeInsets = UIEdgeInsets.zero) {
        super.init()
        switch edge {
        case .top:
            self.attributes = [
                Bottom(insets.bottom).to(view),
                Left(insets.left).to(view, .left),
                Right(insets.right).to(view, .right),
                Height(length)
            ]
        case .left:
            self.attributes = [
                Right(insets.right).to(view),
                Top(insets.top).to(view, .top),
                Bottom(insets.bottom).to(view, .bottom),
                Width(length)
            ]
        case .bottom:
            self.attributes = [
                Top(insets.top).to(view),
                Left(insets.left).to(view, .left),
                Right(insets.right).to(view, .right),
                Height(length)
            ]
        case .right:
            self.attributes = [
                Left(insets.left).to(view),
                Top(insets.top).to(view, .top),
                Bottom(insets.bottom).to(view, .bottom),
                Width(length)
            ]
        default:
            fatalError("Beside can only be used with an edge attribute.")
        }
    }
}



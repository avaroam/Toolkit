//
//  InlineIntialization.swift
//  Toolkit
//
//  Created by Avario on 8/01/17.
//  Copyright © 2017 Avario. All rights reserved.
//

import Foundation

infix operator >>

public protocol InlineIntialization {}
extension InlineIntialization {
    
    static public func >> (object: Self, block: (Self) -> Void) -> Self {
        block(object)
        return object
    }
}

extension NSObject: InlineIntialization {}

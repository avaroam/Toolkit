//
//  Color.swift
//  Toolkit
//
//  Created by Avario on 6/01/17.
//  Copyright © 2017 Avario. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    public convenience init(r: Int, g: Int, b: Int, a: Int = 255) {
        self.init(red: (CGFloat(r)/255.0), green: (CGFloat(g)/255.0), blue: (CGFloat(b)/255.0), alpha: (CGFloat(a)/255.0))
    }
    
    func image(size: CGSize = CGSize(square: 1), cornerRadius: CGFloat = 0) -> UIImage {
        let rect = CGRect(size: size)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setFillColor(self.cgColor)
        context.addPath(UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath)
        
        context.fillPath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}

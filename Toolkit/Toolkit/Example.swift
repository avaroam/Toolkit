//
//  Example.swift
//  Toolkit
//
//  Created by Avario on 6/01/17.
//  Copyright © 2017 Avario. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static let appRed = UIColor(r: 252, g: 18, b: 97)
    static let appGreen = UIColor(r: 37, g: 225, b: 178)
    static let appBlue = UIColor(r: 0, g: 142, b: 249)
}

extension UIFont {
    class func ceraLight(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "CeraGR-Light", size: fontSize)!
    }
    
    class func ceraRegular(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "CeraGR-Regular", size: fontSize)!
    }
    
    class func ceraBold(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "CeraGR-Bold", size: fontSize)!
    }
}

class ViewController: UIViewController {
    
    let headerLabel = UILabel() >> { x in
        x.textAlignment = .center
        x.textColor = .appBlue
        x.font = .ceraRegular(18)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view << headerLabel
        headerLabel <- FillEdge(.top, 80, UIEdgeInsets(top: 20, others: 10))
        
    }
    
}


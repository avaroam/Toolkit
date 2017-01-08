//
//  CellRegistration.swift
//  Toolkit
//
//  Created by Avario on 6/01/17.
//  Copyright © 2017 Avario. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {
    public func registerCell(_ cellClass: UITableViewCell.Type) {
        self.register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
    }
    
    public func registerHeaderFooter(_ viewClass: UITableViewHeaderFooterView.Type) {
        self.register(viewClass, forHeaderFooterViewReuseIdentifier: String(describing: viewClass))
    }
    
    public func dequeueCell<T>(_ cellClass: T.Type, for indexPath: IndexPath) -> T where T: UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: String(describing: cellClass), for: indexPath) as! T
    }
    
    public func dequeueHeaderFooter<T>(_ viewClass: T.Type) -> T where T: UITableViewHeaderFooterView {
        return self.dequeueReusableHeaderFooterView(withIdentifier: String(describing: viewClass))! as! T
    }
}

public extension UICollectionView {
    public func registerCell(_ cellClass: UICollectionViewCell.Type) {
        self.register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }
    
    public func registerSupplementaryView(_ viewClass: UICollectionReusableView.Type, for elementKind: String) {
        self.register(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: String(describing: viewClass))
    }
    
    public func dequeueCell<T>(_ cellClass: T.Type, for indexPath: IndexPath) -> T where T: UICollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: cellClass), for: indexPath) as! T
    }
    
    public func dequeueSupplementaryVie<T>(_ elementKind: String, viewClass: T.Type, for indexPath: IndexPath) -> T where T: UICollectionReusableView {
        return self.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: String(describing: viewClass), for: indexPath) as! T
    }
}


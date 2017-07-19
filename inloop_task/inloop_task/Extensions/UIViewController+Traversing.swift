//
//  UIViewController+Traversing.swift
//  inloop_task
//
//  Created by Roland Beke on 19.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import UIKit

extension UIViewController: UITraversingProviderProtocol {}

extension UITraversing where Element:UIViewController {
    
    public func context() -> UIViewController? {
        return self.context(of: self.base)
    }
}

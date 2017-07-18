//
//  UIWindow+Traversing.swift
//  inloop_task
//
//  Created by Roland Beke on 18.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import UIKit

extension UIWindow: UITraversingProviderProtocol {}

extension UITraversing where Element:UIWindow {
    
    public func context() -> UIViewController? {
        return self.context(of: self.base.rootViewController)
    }
}

//
//  TraversingExtension.swift
//  inloop_task
//
//  Created by Roland Beke on 18.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import UIKit

public protocol UITraversingProtocol {
    
    func pushContext() -> UINavigationController?
    func context() -> UIViewController?
    func context(of controller: UIViewController?) -> UIViewController?
}

public protocol UITraversingProviderProtocol: class {}

public struct UITraversing<Element>: UITraversingProtocol {
    
    public let base:Element
    
    fileprivate init(_ base:Element) {
        self.base = base
    }
}

extension UITraversingProviderProtocol {
    
    public var traversing:UITraversing<Self> {
        return UITraversing(self)
    }
}

extension UITraversingProtocol {
    
    public func pushContext() -> UINavigationController? {
        return self.context()?.navigationController
    }
    
    public func context() -> UIViewController? {
        return nil
    }
    
    public func context(of controller: UIViewController?) -> UIViewController? {
        
        if let tab = controller as? UITabBarController,
            
            let selected = tab.selectedViewController {
            return self.context(of: selected)
        }
        
        if let navigation = controller as? UINavigationController,
            
            let visible = navigation.visibleViewController {
            return self.context(of: visible)
        }
        
        if let presented = controller?.presentedViewController {
            return self.context(of: presented)
        }
        
        for subview in controller?.view?.subviews ?? [] {
            
            if let child = subview.next as? UIViewController {
                return self.context(of: child)
            }
        }
        
        return controller
    }
}

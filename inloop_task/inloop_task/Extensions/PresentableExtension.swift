//
//  PresentableExtension.swift
//  inloop_task
//
//  Created by Roland Beke on 18.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import UIKit

public protocol PresentableProtocol: class {
    
    func toPresent(using options:UI.ContextFormat) -> UIViewController?
}

extension UIViewController: PresentableProtocol {
    
    public func toPresent(using options:UI.ContextFormat = .root) -> UIViewController? {
        return self
    }
}

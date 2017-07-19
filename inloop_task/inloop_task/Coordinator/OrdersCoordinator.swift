//
//  OrdersCoordinator.swift
//  inloop_task
//
//  Created by Roland Beke on 19.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

public final class OrdersCoordinator: BaseCoordinator {
    
    private var root: UIViewController?
    private var stack: UINavigationController?
    
    public func start() -> PresentableProtocol? {
        
        let storyboard = SwinjectStoryboard.create(name: "Orders", bundle: Bundle.main, container: self.resolver)
        self.root = storyboard.instantiateInitialViewController()
        
        return self
    }
    
    public override func toPresent(using options: UI.ContextFormat = .root) -> UIViewController? {
        
        return self.root
    }
    
    public func prepare(stack controller:UIViewController) {
        
        self.stack = controller as? UINavigationController
    }
    
    public func addButtonPressed() {
        
        self.navigation.push("/detail")
    }
}

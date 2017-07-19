//
//  AppCoordinator.swift
//  inloop_task
//
//  Created by Roland Beke on 19.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

public final class AppCoordinator: BaseCoordinator {
    
    private var root: UIViewController?
    private var stack: UITabBarController?
    
    public func start() -> PresentableProtocol? {
        
        let storyboard = SwinjectStoryboard.create(name: "Main", bundle: Bundle.main, container: self.resolver)
        self.root = storyboard.instantiateInitialViewController()
        
        return self
    }
    
    public override func toPresent(using options: UI.ContextFormat = .root) -> UIViewController? {
        
        return self.root
    }
    
    public func prepare(stack controller:UIViewController) {
        
//        let tabs = [
//            self.addResolvedDependency(OrderCoordinator.self).start(),
//            self.addResolvedDependency(UserCoordinator.self).start()
//            ].flatMap{ $0?.toPresent(using:.root) }
        
        self.stack = controller as? UITabBarController
//        self.stack?.setViewControllers(tabs, animated:false)
        
    }
}

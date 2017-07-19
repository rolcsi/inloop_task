//
//  OrdersAssembly.swift
//  inloop_task
//
//  Created by Roland Beke on 19.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import SwinjectStoryboard

public final class OrdersAssembly: Assembly {
    
    public func assemble(container: Container) {
        
        // Coordinator
        
        container.register(UIWindow.self) { _ in self.window }
        
        container.register(UI.Router.self) { r in UI.Router(r, routes:UI.Routes()) }.inObjectScope(.container)
        container.register(OrdersCoordinator.self) { r in OrdersCoordinator(r, navigation: (r ~> UI.Router.self).navigation) }.inObjectScope(.container)
        
        
        // ViewModels
        
        container.register(OrdersViewModel.self) { r in OrdersViewModel(coordinator: r ~> OrdersCoordinator.self) }
        
        // Views
        
        container.storyboardInitCompleted(UINavigationController.self) { (_, _) in }
        container.storyboardInitCompleted(UIViewController.self) { (_, _) in }
        
        container.storyboardInitCompleted(OrdersController.self) { (r, c) in
            c.coordinator = r ~> OrdersCoordinator.self
            c.viewModel = r ~> OrdersViewModel.self
        }
    }
    
    
    private unowned let window:UIWindow
    
    public init(_ window:UIWindow) {
        self.window = window
    }
    
}

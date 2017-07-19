//
//  AppAssembly.swift
//  inloop_task
//
//  Created by Roland Beke on 14.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import SwinjectStoryboard

public final class AppAssembly: Assembly {
    
    public func assemble(container: Container) {
        
        // Coordinator
        
        container.register(UIWindow.self) { _ in self.window }
        
        container.register(UI.Router.self) { r in UI.Router(r, routes:UI.Routes()) }.inObjectScope(.container)
        container.register(AppCoordinator.self) { r in AppCoordinator(r, navigation: (r ~> UI.Router.self).navigation) }.inObjectScope(.container)
        
        
        // ViewModels
        
        container.register(AppViewModel.self) { r in AppViewModel(coordinator: r ~> AppCoordinator.self) }
        
        // Views
        
        container.storyboardInitCompleted(UINavigationController.self) { (_, _) in }
        container.storyboardInitCompleted(UITabBarController.self) { (_, _) in }
        
        container.storyboardInitCompleted(AppController.self) { (r, c) in
            c.coordinator = r ~> AppCoordinator.self
            c.viewModel = r ~> AppViewModel.self
        }
    }
    
    
    private unowned let window:UIWindow
    
    public init(_ window:UIWindow) {
        self.window = window
    }
    
}

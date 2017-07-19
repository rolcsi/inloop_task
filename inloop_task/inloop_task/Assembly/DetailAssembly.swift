//
//  DetailAssembly.swift
//  inloop_task
//
//  Created by Roland Beke on 19.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import SwinjectStoryboard

public final class DetailAssembly: Assembly {
    
    public func assemble(container: Container) {
        
        // Coordinator
        
        container.register(UI.Router.self) { r in UI.Router(r, routes:UI.Routes()) }.inObjectScope(.container)
        container.register(DetailCoordinator.self) { r in DetailCoordinator(r, navigation: (r ~> UI.Router.self).navigation) }.inObjectScope(.container)
        
        
        // ViewModels
        
        container.register(DetailViewModel.self) { r in DetailViewModel(coordinator: r ~> DetailCoordinator.self) }
        
        // Views
        
        container.storyboardInitCompleted(UINavigationController.self) { (_, _) in }
        //        container.storyboardInitCompleted(UIViewController.self) { (_, _) in }
        
        container.storyboardInitCompleted(DetailController.self) { (r, c) in
            c.coordinator = r ~> DetailCoordinator.self
            c.viewModel = r ~> DetailViewModel.self
        }
    }
}

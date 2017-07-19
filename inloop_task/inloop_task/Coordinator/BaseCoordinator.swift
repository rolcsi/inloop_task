//
//  BaseCoordinator.swift
//  inloop_task
//
//  Created by Roland Beke on 18.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

public class BaseCoordinator: CoordinatorProtocol, CoordinatorDependencyProtocol {
    
    public var dependencies: [CoordinatorDependencyProtocol] = []
    
    public let resolver: Resolver
    public let navigation: NavigationProtocol
    
    public init(_ resolver: Resolver, navigation: NavigationProtocol) {
        
        self.resolver = resolver
        self.navigation = navigation
    }
    
    
    public func addResolvedDependency<T:CoordinatorDependencyProtocol>(_ type:T.Type) -> T {
        let dependency = self.resolver ~> type
        defer {
            addDependency(dependency)
        }
        
        return dependency
    }
    
    public func toPresent(using options: UI.ContextFormat = .root) -> UIViewController? {
        return nil;
    }
}

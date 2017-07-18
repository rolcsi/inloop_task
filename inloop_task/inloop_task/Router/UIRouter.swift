//
//  UIRouter.swift
//  inloop_task
//
//  Created by Roland Beke on 14.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

extension UI {
    
    public class Router {
        
        public var navigation:Navigation {
            return Navigation(self)
        }
        
        fileprivate let resolver:Resolver
        fileprivate let routes:[Route]
        
        public init(_ resolver:Resolver, routes:[Route]) {
            self.resolver = resolver
            self.routes = routes
        }
        
        
        fileprivate func unwrap(using entrypoint: EntrypointConvertible?, parameters:UI.Parameters?) -> Deeplink {
            
            guard let entrypoint = entrypoint else { return .Invalid }
            var deeplink = entrypoint.deeplink
            
            return deeplink.merge(parameters)
        }
        
        fileprivate func process(using entrypoint: EntrypointConvertible?, parameters:UI.Parameters?) -> (option:UI.ContextFormat, presentable: PresentableProtocol?) {
            
            let deeplink = self.unwrap(using: entrypoint, parameters:parameters)
            
            
//            guard let a = (self.resolver ~> AppCoordinator.self).start() else { return (option:.root,presentable:nil) }
            
            return (option:.root,presentable:nil)
        }
    }
    
    public struct Navigation: NavigationProtocol {
        
        fileprivate let router:Router
        
        fileprivate init(_ router:Router) {
            self.router = router
        }
    }
    
}



extension UI.Navigation  {
    
    public func open(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil, animated: Bool, completion: (() -> Void)?) {
        
        let deeplink = self.router.unwrap(using: entrypoint, parameters:parameters)
        if deeplink != .Invalid {
            if deeplink.pushable {
                self.push(entrypoint, animated: animated, completion: completion)
            } else {
                self.present(entrypoint, animated: animated, completion: completion)
            }
        }
        
        
    }
    
    public func present(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil, animated: Bool, completion: (() -> Void)?) {
        
        let window = self.router.resolver ~> UIWindow.self
        if let context = window.traversing.context() {
            
            let (option, presentable) = self.router.process(using: entrypoint, parameters:parameters)
            if let presented = presentable?.toPresent(using: option) {
                
                context.present(presented, animated: animated, completion: completion)
            }
        }
    }
    
    public func push(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil, animated: Bool, completion: (() -> Void)?) {
        
        
        let window = self.router.resolver ~> UIWindow.self
        if let context = window.traversing.pushContext() {
            
            let (option, presentable) = self.router.process(using: entrypoint, parameters:parameters)
            if let presented = presentable?.toPresent(using: option) {
                
                context.pushViewController(presented, animated: animated)
                completion?()
            }
        }
    }
    
    public func pop(animated: Bool) {
        
        let window = self.router.resolver ~> UIWindow.self
        if let context = window.traversing.pushContext() {
            
            context.popViewController(animated: animated)
        }
    }
    
    public func dismiss(animated: Bool, completion: (() -> Void)?) {
        
        let window = self.router.resolver ~> UIWindow.self
        if let context = window.traversing.context() {
            
            context.dismiss(animated: animated, completion: completion)
        }
    }
    
    public func setRoot(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil, hideBar: Bool) {
        
        let (option, presentable) = self.router.process(using: entrypoint, parameters:parameters)
        if let presented = presentable?.toPresent(using: option) {
            
            let window = self.router.resolver ~> UIWindow.self
            window.rootViewController = presented
        }
    }
    
    public func popToRoot(animated: Bool) {
        
        let window = self.router.resolver ~> UIWindow.self
        if let context = window.traversing.pushContext() {
            
            context.popToRootViewController(animated: animated)
        }
    }
}

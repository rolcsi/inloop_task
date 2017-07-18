//
//  RouterExtension.swift
//  inloop_task
//
//  Created by Roland Beke on 18.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

public protocol NavigationProtocol {
    
    // Present or push determined via deeplink
    
    func open(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters?)
    func open(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters?, animated: Bool)
    func open(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters?, animated: Bool, completion: (() -> Void)?)
    
    // Present
    
    func present(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters?)
    func present(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters?, animated: Bool)
    func present(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters?, animated: Bool, completion: (() -> Void)?)
    
    // Push
    
    func push(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters?)
    func push(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters?, animated: Bool)
    func push(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters?, animated: Bool, completion: (() -> Void)?)
    
    func pop()
    func pop(animated: Bool)
    
    func dismiss()
    func dismiss(animated: Bool, completion: (() -> Void)?)
    
    func setRoot(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters?)
    func setRoot(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters?, hideBar: Bool)
    
    func popToRoot(animated: Bool)
    
}

extension NavigationProtocol {
    
    public func open(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil) {
        
        self.open(entrypoint, parameters:parameters, animated: true)
    }
    
    public func open(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil, animated: Bool) {
        
        self.open(entrypoint, parameters:parameters, animated: animated, completion: nil)
    }
    
    public func open(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil, animated: Bool, completion: (() -> Void)?) { /* Optional method */ }
    
    public func present(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil) {
        
        self.present(entrypoint, parameters:parameters, animated: true)
    }
    
    public func present(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil, animated: Bool) {
        
        self.present(entrypoint, parameters:parameters, animated: animated, completion: nil)
    }
    
    public func present(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil, animated: Bool, completion: (() -> Void)?) { /* Optional method */ }
    
    public func push(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil) {
        
        self.push(entrypoint, parameters:parameters, animated: true)
    }
    
    public func push(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil, animated: Bool) {
        
        self.push(entrypoint, parameters:parameters, animated: animated, completion: nil)
    }
    
    public func push(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil, animated: Bool, completion: (() -> Void)?) { /* Optional method */ }
    
    public func pop() {
        
        self.pop(animated: true)
    }
    
    public func pop(animated: Bool) { /* Optional method */ }
    
    public func dismiss() {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    public func dismiss(animated: Bool, completion: (() -> Void)?) { /* Optional method */ }
    
    public func setRoot(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil) {
        
        self.setRoot(entrypoint, parameters:parameters, hideBar: false)
    }
    
    public func setRoot(_ entrypoint: EntrypointConvertible?, parameters:UI.Parameters? = nil, hideBar: Bool) {
        
        print("a")
        /* Optional method */
    }
    
    public func popToRoot(animated: Bool) { /* Optional method */ }
}

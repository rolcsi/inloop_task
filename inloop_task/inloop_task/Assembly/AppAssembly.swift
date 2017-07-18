//
//  AppAssembly.swift
//  inloop_task
//
//  Created by Roland Beke on 14.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import Swinject

public final class AppAssembly: Assembly {
 
    private unowned let window: UIWindow
    
    public init(_ window: UIWindow) {
        
        self.window = window
    }
    
    public func assemble(container: Container) {
        
    }
}

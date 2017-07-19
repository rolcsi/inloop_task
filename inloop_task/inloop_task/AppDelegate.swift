//
//  AppDelegate.swift
//  inloop_task
//
//  Created by Roland Beke on 13.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
 
    var window: UIWindow?
    var assembler:Assembler?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let assembler = Assembler([
            OrdersAssembly(window),
            DetailAssembly()
            ])
        
        self.window = window
        self.assembler = assembler
        
        let router = assembler.resolver ~> UI.Router.self
        
        router.navigation.setRoot("/detail")
        
        window.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}


//
//  Routes.swift
//  inloop_task
//
//  Created by Roland Beke on 19.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import UIKit

extension UI {
    
    public static func Routes() -> [Route] {
        return [
            Route("/", to: .toType(of: AppCoordinator.self)),
//            Route("/orders", to: .toType(of: OrderCoordinator.self)) {
//                return [
//                    Route("/add", to: .toStoryboard(name:"Order", id:"\(OrderAddController.self)")),
//                    Route("/detail/:id", to: .toStoryboard(name:"Order", id:"\(OrderDetailController.self)"))
//                ]
//            },
//            Route("/users", to: .toType(of: UserCoordinator.self)),
//            Route("/login", to: .toType(of: UserLoginCoordinator.self)),
//            Route("/browser", to: .toType(of: BrowserCoordinator.self))
        ]
    }
}

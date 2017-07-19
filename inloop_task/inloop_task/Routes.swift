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
            Route("/orders", to: .toType(of: OrdersCoordinator.self)),
            Route("/detail", to: .toType(of: DetailCoordinator.self))
        ]
    }
}

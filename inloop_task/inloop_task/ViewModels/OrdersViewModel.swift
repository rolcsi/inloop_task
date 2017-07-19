//
//  OrdersViewModel.swift
//  inloop_task
//
//  Created by Roland Beke on 19.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

public class OrdersViewModel: BaseViewModel<OrdersCoordinator> {
    
    public func addAction() {
        
        self.coordinator?.addButtonPressed()
    }
}

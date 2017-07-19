//
//  OrdersController.swift
//  inloop_task
//
//  Created by Roland Beke on 19.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import UIKit

public class OrdersController: BaseController<OrdersCoordinator> {
    
    public static let Identifier = "orders-stack"
    
    public var viewModel: OrdersViewModel?
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Orders"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(OrdersController().addButtonPressed))
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let coordinator = self.coordinator, segue.identifier == OrdersController.Identifier {
            coordinator.prepare(stack: segue.destination)
        }
    }
    
    func addButtonPressed() {
        
        self.viewModel?.addAction()
    }
}

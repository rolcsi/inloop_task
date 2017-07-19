//
//  DetailController.swift
//  inloop_task
//
//  Created by Roland Beke on 19.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import UIKit

class DetailController: BaseController<DetailCoordinator> {
    
    public static let Identifier = "orders-stack"
    
    public var viewModel: DetailViewModel?
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Name"
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let coordinator = self.coordinator, segue.identifier == DetailController.Identifier {
            coordinator.prepare(stack: segue.destination)
        }
    }
}

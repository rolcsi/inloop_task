//
//  AppController.swift
//  inloop_task
//
//  Created by Roland Beke on 19.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import UIKit

public class AppController: BaseController<AppCoordinator> {
    
    public static let Identifier = "app-stack"
    
    public var viewModel:AppViewModel?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        
        //print(self.viewModel)
        // Do any additional setup after loading the view.
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let coordinator = self.coordinator, segue.identifier == AppController.Identifier {
            coordinator.prepare(stack: segue.destination)
        }
    }
}

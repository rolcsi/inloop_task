//
//  BaseController.swift
//  inloop_task
//
//  Created by Roland Beke on 19.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import UIKit

public class BaseController<Coordinator:CoordinatorProtocol>: UIViewController, CoordinatedTargetProtocol {
    
    public weak var coordinator:Coordinator?
}

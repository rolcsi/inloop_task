//
//  BaseViewModel.swift
//  inloop_task
//
//  Created by Roland Beke on 19.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

public class BaseViewModel<Coordinator:CoordinatorProtocol>: CoordinatedTargetProtocol {
    
    public weak var coordinator: Coordinator?
    
    public required init() {}
}

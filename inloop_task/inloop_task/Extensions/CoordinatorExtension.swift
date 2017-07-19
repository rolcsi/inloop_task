//
//  CoordinatorExtension.swift
//  inloop_task
//
//  Created by Roland Beke on 18.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

public protocol CoordinatorProtocol: PresentableProtocol {
    
    func start() -> PresentableProtocol?
}

public protocol CoordinatorDependencyProtocol: class {
    
    var dependencies:[CoordinatorDependencyProtocol] { get set }
    
    func addDependency(_ dependency:CoordinatorDependencyProtocol)
    func removeDependency(_ dependency:CoordinatorDependencyProtocol?)
}


public protocol CoordinatedTargetProtocol {
    
    associatedtype Coordinator:CoordinatorProtocol
    
    init()
    init(coordinator: Coordinator)
    
    weak var coordinator: Coordinator? {get set}
}


extension CoordinatorProtocol {
    
    public func start() -> PresentableProtocol? { return nil /* Optional method */ }
}

extension CoordinatorDependencyProtocol {
    
    
    public final func addDependency(_ dependency:CoordinatorDependencyProtocol) {
        
        
        if (dependencies.filter{ $0 === dependency }).isEmpty {
            
            //dependency.disposable.add = { [unowned self] (object) in
            //    self.removeDependency(object as? CoordinatorDependencyProtocol)
            //}
            dependencies.append(dependency)
        }
    }
    
    public final func removeDependency(_ dependency:CoordinatorDependencyProtocol?) {
        
        if let dependency = dependency, !dependencies.isEmpty  {
            for (index, element) in dependencies.enumerated() {
                if element === dependency {
                    dependencies.remove(at: index); break
                }
            }
        }
    }
}

// Type erasure for targets
/*
 public struct AnyCoordinatedTarget : CoordinatedTargetProtocol {
 
 
 public var coordinator: Target.Coordinator? {
 return self.target.coordinator
 }
 
 public init() {}
 public init(coordinator: Coordinator) {}
 
 private let target:CoordinatedTargetProtocol
 
 public init(_ target: CoordinatedTargetProtocol) {
 self.target = target
 }
 }*/

extension CoordinatedTargetProtocol where Coordinator:CoordinatorProtocol {
    
    public init(coordinator: Coordinator) {
        
        self.init()
        self.coordinator = coordinator
    }
}

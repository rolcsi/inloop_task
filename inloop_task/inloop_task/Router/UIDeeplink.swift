//
//  UIDeeplink.swift
//  inloop_task
//
//  Created by Roland Beke on 18.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

extension UI {
    
    public struct Deeplink: Equatable {
        
        public static let Invalid = Deeplink(using:Route.Invalid)
        
        fileprivate let route:Route
        private var parameters:Parameters
        
        
        public var pushable:Bool {
            return (route.parameters[Keys.Query.Push] as? Bool) ?? false
        }
        
        public init(usingPresentable presentable:PresentableProtocol) {
            
            self.init(using:Route(to:.to(value:presentable)))
        }
        
        public init(usingParameters parameters:Parameters) {
            
            //TODO:
            self.init(using:Route(to:.none))
        }
        
        public init(using route:Route) {
            self.route = route
            self.parameters = route.parameters
        }
        
        public mutating func merge(_ parameters:Parameters?) -> Deeplink {
            
            self.parameters += (parameters ?? UI.ParametersEmpty)
            return self
        }
        
    }
}

public func ==(lhs:UI.Deeplink, rhs:UI.Deeplink) -> Bool {
    return lhs.route == rhs.route
}

public func ==(lhs:UI.Deeplink, rhs:UI.Route) -> Bool {
    return lhs.route == rhs
}

public func ==(lhs:UI.Route, rhs:UI.Deeplink) -> Bool {
    return lhs == rhs.route
}


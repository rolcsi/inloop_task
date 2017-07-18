//
//  UIRoute.swift
//  inloop_task
//
//  Created by Roland Beke on 18.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import Foundation

public protocol UIQueryProviderProtocol {}

extension UI {
    
    public typealias Parameters = [AnyHashable:Any]
    public static let ParametersEmpty = Parameters()
    
    public struct Keys {
        
        public struct Uri {
            
            public static let Root = "/"
            public static let Optional = "*"
            public static let Invalid = "_invalid_"
        }
        
        public struct Query {
            
            public static let Push = "push"
        }
    }
    
    public struct Route: Equatable {
        
        public static let Invalid = Route(Keys.Uri.Invalid, to:.none)
        
        
        public let uri:String
        public let presentable:PresentableFormat
        public let children:[Route]
        public let parameters:Parameters
        
        public init(to presentable:PresentableFormat) {
            self.init(Keys.Uri.Optional, to: presentable)
        }
        
        public init(_ uri:String, to presentable:PresentableFormat) {
            self.init(uri, to: presentable, children: nil)
        }
        
        public init(_ uri:String, to presentable:PresentableFormat, children:(() -> [Route])?) {
            
            if uri == Keys.Uri.Optional {
                
                self.uri = uri
                self.parameters = UI.ParametersEmpty
                
            } else {
                
                let url = URLComponents(string:uri)
                
                self.uri = url?.path ?? Keys.Uri.Invalid
                self.parameters = url?.queryItems?.toDictionary{ ($0.name, $0.value) } ?? UI.ParametersEmpty
            }
            
            
            self.presentable = presentable
            self.children = children?() ?? []
        }
    }
    
    public struct Query<Base> {
        
        public let base:Base
        
        fileprivate init(_ base:Base) {
            self.base = base
        }
    }
    
}

public func ==(lhs:UI.Route, rhs:UI.Route) -> Bool {
    
    let routes = lhs.children.map { lhs.uri + $0.uri }
    
    return lhs.uri == rhs.uri
}

extension String: UIQueryProviderProtocol {}

extension UIQueryProviderProtocol {
    
    public var query:UI.Query<Self> {
        return UI.Query(self)
    }
}

extension UI.Query where Base == String {
    
    public func queryPush(_ pushed:Bool) -> Base {
        
        return self.query(
            [UI.Keys.Query.Push:pushed]
        )
    }
    
    public func query(_ parameters:UI.Parameters) -> Base {
        
        guard var url = URLComponents(string: self.base) else { return self.base }
        url.queryItems = parameters.flatMap{ key, value in
            guard let key = key as? String, let value = value as? String else { return nil }
            return URLQueryItem(name: key, value: value)
        }
        
        return url.string ?? self.base
    }
}

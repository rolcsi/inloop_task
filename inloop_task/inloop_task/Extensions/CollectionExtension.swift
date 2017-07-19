//
//  CollectionExtension.swift
//  inloop_task
//
//  Created by Roland Beke on 18.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

extension Collection {
    public func toDictionary<K, V>(transform:(_ element: Self.Iterator.Element) -> (key: K, value: V?)?) -> [K : V] {
        
        var dictionary = [K : V]()
        for e in self {
            if let (key, value) = transform(e), let val = value {
                dictionary[key] = val
            }
        }
        return dictionary
    }
}

func += <K, V> (_ left: inout [K:V], right: [K:V]) {
    for (k, v) in right {
        left[k] = v
    }
}


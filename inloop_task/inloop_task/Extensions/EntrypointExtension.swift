//
//  EntrypointExtension.swift
//  inloop_task
//
//  Created by Roland Beke on 18.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

import UIKit

public protocol EntrypointConvertible {
    var deeplink:UI.Deeplink { get }
}

extension String: EntrypointConvertible {
    
    public var deeplink: UI.Deeplink {
        return UI.Deeplink(using: UI.Route(self, to:.none))
    }
}

extension Dictionary: EntrypointConvertible {
    
    public var deeplink: UI.Deeplink {
        return UI.Deeplink(usingParameters: self)
    }
}

extension URL: EntrypointConvertible {
    
    public var deeplink: UI.Deeplink {
        return UI.Deeplink(using: UI.Route(self.absoluteString, to:.none))
    }
}

//extension UI.Deeplink: EntrypointConvertible {
//    
//    public var deeplink: UI.Deeplink {
//        return self
//    }
//}

extension UIViewController: EntrypointConvertible {
    
    public var deeplink: UI.Deeplink {
        return UI.Deeplink(usingPresentable: self)
    }
}
//
//extension BaseCoordinator: EntrypointConvertible {
//    
//    public var deeplink: UI.Deeplink {
//        return UI.Deeplink(usingPresentable: self)
//    }
//}


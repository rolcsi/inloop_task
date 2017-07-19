//
//  Enums.swift
//  inloop_task
//
//  Created by Roland Beke on 18.7.17.
//  Copyright © 2017 Roland Beke. All rights reserved.
//

extension UI {
    
    public enum ContextFormat {
        
        case root
        case to(deeplink:Deeplink)
    }
     
    public enum PresentableFormat {
        
        case none
        case to(value:PresentableProtocol)
        case toType(of:PresentableProtocol.Type)
        case toStoryboard(name:String, id:String)
    }
    
    public enum AbilityFormat {
        
        case modal
        case push
    }
}

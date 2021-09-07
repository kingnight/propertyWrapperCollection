//
//  ValueSetOnce.swift
//  propertyWrapperCollection
//
//  Created by kai jin on 2021/8/24.
//

import Foundation

@propertyWrapper
struct ValueSetOnce {
    var property:String
    
    var wrappedValue:String {
        get {
            if !property.isEmpty {
                return property
            }
            else{
                return ""
            }
        }
        set {
            if property.isEmpty {
                property = newValue
            }
        }
    }
}

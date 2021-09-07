//
//  LateInitialized.swift
//  propertyWrapperCollection
//
//  Created by kai jin on 2021/8/24.
//

import Foundation

@propertyWrapper
public struct LateInitialized<Value> {
    private var storage: Value?
    public var wrappedValue: Value {
        get {
            guard let value = storage else {
                fatalError("value has not yet been set!")
            }
            return value
        }
        set { storage = newValue }
    }
    public init() {
        
    }
}

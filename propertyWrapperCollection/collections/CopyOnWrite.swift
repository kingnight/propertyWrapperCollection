//
//  CopyOnWrite.swift
//  propertyWrapperCollection
//
//  Created by kai jin on 2021/8/24.
//

import Foundation

@propertyWrapper
struct CopyOnWrite<Value: NSCopying> {
    init(wrappedValue: Value) {
          store = wrappedValue
     }
     private var store: Value
     var wrappedValue: Value {
        mutating get {
            if !isKnownUniquelyReferenced(&store) {
                store = store.copy() as! Value
            }
            return store
        }
        set { store = newValue }
    }
}

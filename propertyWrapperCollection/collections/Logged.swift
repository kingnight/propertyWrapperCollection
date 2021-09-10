//
//  Logged.swift
//  propertyWrapperCollection
//
//  Created by kai jin on 2021/8/24.
//

import Foundation

@propertyWrapper
struct Logged<Value> {
    init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }

    var wrappedValue: Value {
        didSet {
            #if DEBUG
                print(wrappedValue)
            #endif
        }
    }
}

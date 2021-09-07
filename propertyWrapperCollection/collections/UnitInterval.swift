//
//  UnitInterval.swift
//  propertyWrapperCollection
//
//  Created by kai jin on 2021/8/24.
//

import Foundation

@propertyWrapper
struct UnitInterval<Value: FloatingPoint> {
    @Clamping(0...1)
    var wrappedValue: Value = .zero
    
    init(wrappedValue value: Value) {
        self.wrappedValue = value
    }
}

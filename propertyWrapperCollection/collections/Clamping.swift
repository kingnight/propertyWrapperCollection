//
//  Clamping.swift
//  propertyWrapperCollection
//
//  Created by kai jin on 2021/8/24.
//

import Foundation

@propertyWrapper
struct Clamping<V: Comparable> {
    var value: V
    let min: V
    let max: V
    
    init(wrappedValue: V, min: V, max: V) {
        value = wrappedValue
        self.min = min
        self.max = max
        assert(value >= min && value <= max)
    }
    
    init(wrappedValue: V, _ range:ClosedRange<V>){
        precondition(range.contains(wrappedValue))
        self.value = wrappedValue
        self.min = range.lowerBound
        self.max = range.upperBound
    }
    
    var wrappedValue: V {
        get { return value }
        set {
            if newValue < min {
                value = min
            } else if newValue > max {
                value = max
            } else {
                value = newValue
            }
        }
    }
}


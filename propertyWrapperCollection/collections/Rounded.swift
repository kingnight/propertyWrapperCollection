//
//  Rounded.swift
//  propertyWrapperCollection
//
//  Created by kai jin on 2021/8/24.
//

import Foundation

@propertyWrapper
struct Rounded{
    private let digits : Int
    private var value : Double
    
    init(wrappedValue:Double,digits:Int) {
        self.digits = digits
        self.value = wrappedValue.roundTo(places: digits)
    }
    
    var wrappedValue:Double {
        get{
            value
        }
        set{
            value = newValue.roundTo(places: digits)
        }
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

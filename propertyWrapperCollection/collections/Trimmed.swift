//
//  Trimmed.swift
//  propertyWrapperCollection
//
//  Created by kai jin on 2021/8/24.
//

import Foundation

@propertyWrapper
struct Trimmed {
    private(set) var value: String = ""

    var wrappedValue: String {
        get { value }
        set { value = newValue.trimmingCharacters(in: .whitespacesAndNewlines) }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}


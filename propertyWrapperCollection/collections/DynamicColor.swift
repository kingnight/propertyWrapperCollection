//
//  DynamicColor.swift
//  propertyWrapperCollection
//
//  Created by kai jin on 2021/8/24.
//

import Foundation
import UIKit

@propertyWrapper
struct DynamicColor {
    let lightVariant: UIColor
    let darkVariant: UIColor

    var wrappedValue: UIColor {
        get {
            if #available(iOS 13.0, *) {
                return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                    if traitCollection.userInterfaceStyle == .dark {
                        return self.darkVariant
                    }
                    else {
                        return self.lightVariant
                    }
                }
            }
            else {
                return self.lightVariant
            }
        }
    }
}

//
//  DecodableDefaultValue.swift
//  propertyWrapperCollection
//
//  Created by kai jin on 2021/8/25.
//

import Foundation
/*
 Reference from: https://mp.weixin.qq.com/s/jOyHRS2Wx6MJpuYuENhVgg
 Gist:https://gist.github.com/onevcat/0f055ece50bd0c07e882890129dfcfb8
 */
@propertyWrapper
public struct Default<T: DefaultValue> {
    public var wrappedValue: T.Value
    public init(wrappedValue: T.Value) {
        self.wrappedValue = wrappedValue
    }
}

extension Default: Decodable {
    public init(from decoder: Decoder) throws {
        let c = try  decoder.singleValueContainer()
        self.wrappedValue = (try? c.decode(T.Value.self)) ?? T.defaultValue
    }
}

public protocol DefaultValue {
    associatedtype Value: Decodable
    static var defaultValue: Value { get }
}

extension KeyedDecodingContainer {
    // 注意这个地方一定要写public 不然在主工程依然会keyNotFound报错
    public func decode<T>(_ type: Default<T>.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> Default<T> where T: DefaultValue {
        return (try? self.decodeIfPresent(type, forKey: key)) ?? Default(wrappedValue: T.defaultValue)
    }
}

extension Bool: DefaultValue{
    public static let defaultValue = false
    
    public enum True: DefaultValue {
        public static let defaultValue = true
    }
    
    public enum False: DefaultValue {
        public static let defaultValue = false
    }
}

extension Int8: DefaultValue {
    public static let defaultValue: Int8 = 0
}

extension UInt8: DefaultValue {
    public static let defaultValue: UInt8 = 0
}

extension Int16: DefaultValue {
    public static let defaultValue: Int16 = 0
}

extension UInt16: DefaultValue {
    public static let defaultValue: UInt16 = 0
}

extension Int32: DefaultValue {
    public static let defaultValue: Int32 = 0
}

extension UInt32: DefaultValue {
    public static let defaultValue: UInt32 = 0
}

extension Int64: DefaultValue {
    public static let defaultValue: Int64 = 0
}

extension UInt64: DefaultValue {
    public static let defaultValue: UInt64 = 0
}

extension Int: DefaultValue {
    public static let defaultValue: Int = 0
}

extension UInt: DefaultValue {
    public static let defaultValue: UInt = 0
}

extension Float: DefaultValue {
    public static let defaultValue: Float = 0.0
}

extension Double: DefaultValue {
    public static let defaultValue: Double = 0.0
}

extension String: DefaultValue {
    public static let defaultValue = ""
}

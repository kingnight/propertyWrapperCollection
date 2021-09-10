//
//  UserDefaultTests.swift
//  propertyWrapperCollectionTests
//
//  Created by kai jin on 2021/9/10.
//

import XCTest
@testable import propertyWrapperCollection

class UserDefaultTests: XCTestCase {
    @UserDefault("test", defaultValue: "Hello") var test:String
    
    @UserDefault("count", defaultValue: 100) var count: Int
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDefaultValue() throws {
        let userDefaults = UserDefaults.makeClearedInstance()
        _test.userDefaults = userDefaults
        //获得默认值，但是UserDefaults内部对应key并没有值，为nil
        XCTAssertEqual(test, "Hello")
        let value = userDefaults.string(forKey: "test")
        XCTAssertEqual(value, nil)
    }
    
    func testGetValue() {
        let userDefaults = UserDefaults.makeClearedInstance()
        userDefaults.set("ValueForTest", forKey: "test")
        _test.userDefaults = userDefaults
        
        XCTAssertEqual(test, "ValueForTest")
        XCTAssertEqual(userDefaults.string(forKey: "test"), "ValueForTest")
    }
    
    func testSetValue() {
        let userDefaults = UserDefaults.makeClearedInstance()
        _test.userDefaults = userDefaults
        
        test = "ValueSetForTest"
        XCTAssertEqual(test,"ValueSetForTest")
        
        let value = userDefaults.string(forKey: "test")
        XCTAssertEqual(value, "ValueSetForTest")
    }
    
    func testInt() {
        _count.userDefaults = UserDefaults.makeClearedInstance()
        
        XCTAssertEqual(count, 100)
        count = 7
        XCTAssertEqual(count, 7)
    }

}

fileprivate extension UserDefaults {
    static func makeClearedInstance(
        for functionName: StaticString = #function,
        inFile fileName: StaticString = #file
    ) -> UserDefaults {
        let className = "\(fileName)".split(separator: ".")[0]
        let testName = "\(functionName)".split(separator: "(")[0]
        let suiteName = "\(className).\(testName)"
        
        let defaults = self.init(suiteName: suiteName)!
        defaults.removePersistentDomain(forName: suiteName)
        return defaults
    }
}

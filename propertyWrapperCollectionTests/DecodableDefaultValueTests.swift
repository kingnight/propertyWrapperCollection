//
//  DecodableDefaultValueTests.swift
//  propertyWrapperCollectionTests
//
//  Created by kai jin on 2021/9/10.
//

import XCTest
@testable import propertyWrapperCollection

class DecodableDefaultValueTests: XCTestCase {
    struct Demo:Decodable {
       @Default<String> var text:String
       @Default<Bool> var check:Bool
       @Default<Int> var count1:Int
    }
    
//    var demo:Demo

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExitValue() {
        let json = #"{"count1": 12345, "text": "My First Video", "check": true}"#
        let value = try! JSONDecoder().decode(Demo.self, from: json.data(using: .utf8)!)
        XCTAssertEqual(value.check,true)
        XCTAssertEqual(value.count1, 12345)
        
    }
    
    func testDefaultValue() {
        let json = #"{"check": true}"#
        let value = try! JSONDecoder().decode(Demo.self, from: json.data(using: .utf8)!)
        XCTAssertEqual(value.text,"")
        XCTAssertEqual(value.count1, 0)
    }

}

//
//  TrimmedTests.swift
//  propertyWrapperCollectionTests
//
//  Created by kai jin on 2021/9/10.
//

import XCTest
@testable import propertyWrapperCollection

class TrimmedTests: XCTestCase {
    @Trimmed var string:String = "A good student"
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitResult() throws {
        XCTAssertEqual(string, "A good student")
    }
    
    func testTrimmedResult() {
        string = " __NNNNN___ __YYYYYY"
        XCTAssertEqual(string, "__NNNNN___ __YYYYYY")
    }

}

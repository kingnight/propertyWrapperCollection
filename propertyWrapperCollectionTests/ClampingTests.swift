//
//  ClampingTests.swift
//  propertyWrapperCollectionTests
//
//  Created by kai jin on 2021/8/25.
//

import XCTest
@testable import propertyWrapperCollection

class ClampingTests: XCTestCase {
    @Clamping(1.0...14.0) var pH : Double = 7.0
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

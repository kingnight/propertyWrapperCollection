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
        pH = 7
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetEqual() throws {
        XCTAssertEqual(pH, 7)
    }
    
    func testValueOutRangeGetMax() {
        pH = 28
        XCTAssertEqual(pH, 14)
    }
    
    func testValueOutRangeGetMin() {
        pH = 0
        XCTAssertEqual(pH, 1)
    }

    func testInitMaxMin()  {
       _pH = Clamping(wrappedValue: 10, min: 1, max: 14)
        XCTAssertEqual(pH, 10)
    }

    func testInitRange() {
        _pH = Clamping(wrappedValue: 8, 1...14)
    }
    
}

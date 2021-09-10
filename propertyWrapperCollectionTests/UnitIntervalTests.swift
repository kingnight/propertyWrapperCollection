//
//  UnitIntervalTests.swift
//  propertyWrapperCollectionTests
//
//  Created by kai jin on 2021/9/10.
//

import XCTest
@testable import propertyWrapperCollection

class UnitIntervalTests: XCTestCase {
    @UnitInterval var red:Double = 0.392
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTAssertEqual(red, 0.392)
    }
    
    func testSetUpValue() {
        red = 23
        XCTAssertEqual(red, 1.0)
    }
    
    func testSetDownValue() {
        red = -1.2
        XCTAssertEqual(red, 0)
    }


}

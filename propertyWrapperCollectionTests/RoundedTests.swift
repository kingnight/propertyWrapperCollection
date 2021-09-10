//
//  RoundedTests.swift
//  propertyWrapperCollectionTests
//
//  Created by kai jin on 2021/9/10.
//

import XCTest
@testable import propertyWrapperCollection

class RoundedTests: XCTestCase {
    @Rounded(digits: 2) var number: Double = 3.1415926
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTAssertEqual(number, 3.14)
    }

    func testInitDigitsThreeEqual()  {
        _number = Rounded(wrappedValue: 3.1415926, digits: 3)
        XCTAssertEqual(number, 3.142)
    }
    
    func testInitDigitsFourEqual()  {
        _number = Rounded(wrappedValue: 3.1415926, digits: 4)
        XCTAssertEqual(number, 3.1416)
    }
}

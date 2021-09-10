//
//  LoggedTests.swift
//  propertyWrapperCollectionTests
//
//  Created by kai jin on 2021/9/10.
//

import XCTest
@testable import propertyWrapperCollection

class LoggedTests: XCTestCase {
    @Logged var param:String = ""
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValueEqual() throws {
        _param = Logged(wrappedValue: "newwww")
        XCTAssertEqual(param, "newwww")
    }

    func testDidSetEqual() {
        param = "newText"
        XCTAssertEqual(param, "newText")
    }

}

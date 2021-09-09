//
//  LateInitializedTests.swift
//  propertyWrapperCollectionTests
//
//  Created by kai jin on 2021/9/9.
//

import XCTest
@testable import propertyWrapperCollection

class LateInitializedTests: XCTestCase {
    @LateInitialized var text:String
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSetValue() {
        text = "new content"
        XCTAssertEqual(text, "new content")
    }


}

//
//  DynamicColorTests.swift
//  propertyWrapperCollectionTests
//
//  Created by kai jin on 2021/9/9.
//

import XCTest
@testable import propertyWrapperCollection


class DynamicColorTests: XCTestCase {

    @DynamicColor(lightVariant: .black, darkVariant: .white)
    var dynamicColor: UIColor
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetLightColor()  {
        if #available(iOS 13, *) {
            let lightTrait = UITraitCollection(userInterfaceStyle: .light)
            XCTAssertEqual(dynamicColor.resolvedColor(with: lightTrait), .black)
            let darkTrait = UITraitCollection(userInterfaceStyle: .dark)
            XCTAssertEqual(dynamicColor.resolvedColor(with: darkTrait), .white)
        }
        else{
            XCTAssertEqual(dynamicColor, UIColor.black)
        }
    }

}

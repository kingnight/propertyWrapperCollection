//
//  propertyWrapperCollectionTests.swift
//  propertyWrapperCollectionTests
//
//  Created by kai jin on 2021/8/25.
//

import XCTest
@testable import propertyWrapperCollection

class CopyOnWriteTests: XCTestCase {

    class Texture:NSObject,NSCopying {
        func copy(with zone: NSZone? = nil) -> Any {
            let copy = Texture()
            return copy
        }
    }
    
    @CopyOnWrite var texture: Texture = .init()
    
    let textureInstance = Texture()
    
    override func setUpWithError() throws {
        _texture = CopyOnWrite(wrappedValue: textureInstance)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDefaultCopyOnWrite() throws {
        XCTAssert(texture !== textureInstance)
    }
    
    func testGet() {
        let textureInstance2 = Texture()
        texture = textureInstance2
        XCTAssert(texture !== textureInstance)
    }
    
    

}

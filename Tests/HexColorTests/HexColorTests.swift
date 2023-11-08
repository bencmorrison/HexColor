// Copyright © 2023 Ben Morrison. All rights reserved.

import XCTest
@testable import HexColor

final class HexColorTests: XCTestCase {
    func testRGBToHexColor_using_UInt8() throws {
        for color in TestColor.allCases {
            let rgb = color.rgbValues(as: UInt8.self)
            let hexColor = HexColor(red: rgb.0, green: rgb.1, blue: rgb.2)
            
            XCTAssertEqual(color.hex, hexColor.description, "Color: \(color.rawValue.uppercased())")
        }
    }
    
    func testRGBToHexColor_using_Int() throws {
        for color in TestColor.allCases {
            let rgb = color.rgbValues(as: Int.self)
            let hexColor = HexColor(red: rgb.0, green: rgb.1, blue: rgb.2)
            
            XCTAssertEqual(color.hex, hexColor.description, "Color: \(color.rawValue.uppercased())")
        }
    }
    
    func testHexStringToHexColor() throws {
        for color in TestColor.allCases {
            let hexColor = try HexColor(color.hex)
            
            XCTAssertEqual(color.hex, hexColor.description, "Color: \(color.rawValue.uppercased())")
        }
    }
    
    func testHexIntToHexColor_using_UInt32() {
        for color in TestColor.allCases {
            let hexColor = HexColor(color.hexInt(as: UInt32.self))
            
            XCTAssertEqual(color.hex, hexColor.description, "Color: \(color.rawValue.uppercased())")
        }
    }
    
    func testHexIntToHexColor_using_Int() {
        for color in TestColor.allCases {
            let hexColor = HexColor(color.hexInt(as: Int.self))
            
            XCTAssertEqual(color.hex, hexColor.description, "Color: \(color.rawValue.uppercased())")
        }
    }
}

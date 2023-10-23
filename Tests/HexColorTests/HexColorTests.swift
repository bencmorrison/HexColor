// Copyright © 2023 Ben Morrison. All rights reserved.

import XCTest
@testable import HexColor

final class HexColorTests: XCTestCase {
    func testRGBToHexColor() throws {
        for color in TestColor.allCases {
            let rgb = color.rgb
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
    
    func testHexIntToHexColor() {
        for color in TestColor.allCases {
            let hexColor = HexColor(color.hexInt)
            
            XCTAssertEqual(color.hex, hexColor.description, "Color: \(color.rawValue.uppercased())")
        }
    }
}

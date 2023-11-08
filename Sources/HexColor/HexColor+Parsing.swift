// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

extension HexColor {
    /// Takes a `String` representation of a Hexadecimal color and returns the
    /// three color channels for that represenation.
    /// - Throws: an error when the format is not `#RRGGBB`
    /// - Parameter stringHexColor: The `String` represenation of the hexadecimal color
    /// - Returns: A Tupal of the Red, Green, and Blue channel values, in that order.
    public static func rgbValues(from stringHexColor: String) throws -> (UInt8, UInt8, UInt8) {
        guard stringHexColor.contains(.hexColor) else { throw HexColorError.stringDoesNotMeetExpectedFormat }
        
        let hexColorString = String(stringHexColor.dropFirst())
        let scanner = Scanner(string: hexColorString)
        var hex: UInt64 = 0
        scanner.scanHexInt64(&hex)
        
        return rgbValues(from: UInt32(hex))
    }
    
    /// Takes a `UInt32` representation of a Hexadecimal color and returns the
    /// three color channels for that represenation.
    /// - Note: When the value is above 0xFFFFFF, it will be treated as 0xFFFFFF
    /// - Parameter stringHexColor: The `UInt64` represenation of the hex color
    /// - Returns: A Tupal of the Red, Green, and Blue channel values, in that order.
    public static func rgbValues(from hexValue: UInt32) -> (UInt8, UInt8, UInt8) {
        let clampedValue = hexValue.clamp(.hexValue)
        let red = UInt8((0xFF0000 & clampedValue) >> 16)
        let green = UInt8((0x00FF00 & clampedValue) >> 8)
        let blue = UInt8(0x0000FF & clampedValue)
        
        return(red, green, blue)
    }
}

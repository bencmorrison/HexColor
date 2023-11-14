// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

extension HexColor {
    /// Takes a `String` representation of a Hexadecimal color and returns the
    /// three color channels for that represenation.
    /// - Throws: an error when the format is not `#RRGGBB` or `#RRGGBBAA`
    /// - Parameter stringHexColor: The `String` represenation of the hexadecimal color
    /// - Returns: A Tupal of the Red, Green, Blue, and Alpha channel values (Alpha is only
    /// present when the string contains an alpha value).
    public static func rgbValues(from stringHexColor: String) throws -> (UInt8, UInt8, UInt8, UInt8?) {
        let isJustHexColor: Bool = stringHexColor.contains(.hexColorNoAlpha)
        let containsAlpha: Bool = stringHexColor.contains(.hexColorWithAlpha)
        
        guard isJustHexColor || containsAlpha else { throw HexColorError.stringDoesNotMeetExpectedFormat }
        
        let hexColorString = String(stringHexColor.dropFirst())
        let scanner = Scanner(string: hexColorString)
        var hex: UInt64 = 0
        scanner.scanHexInt64(&hex)
        
        return rgbValues(from: UInt32(hex), hasAlpha: containsAlpha)
    }
    
    /// Takes a `UInt32` representation of a Hexadecimal color and returns the
    /// three color channels for that represenation.
    /// - Note: The value is clamped to either 0xFFFFFF or 0xFFFFFFFF depending on alpha.
    /// - Parameter hexValue: The `UInt32` represenation of the hex color
    /// - Returns: A Tupal of the Red, Green, Blue, and (optional) alpha channel values, 
    /// in that order.
    public static func rgbValues(from hexValue: UInt32, hasAlpha: Bool) -> (UInt8, UInt8, UInt8, UInt8?) {
        let clampedValue = hexValue.clamp(hasAlpha ? .hexValueWithAlpha : .hexValueNoAlpha)
        
        let red = clampedValue.isolateUInt8(
            mask: hasAlpha ? 0xFF000000 : 0xFF0000,
            bitShift: hasAlpha ? 24 : 16
        )
        
        let green = clampedValue.isolateUInt8(
            mask: hasAlpha ? 0x00FF0000 : 0x00FF00,
            bitShift: hasAlpha ? 16 : 8
        )
        
        let blue = clampedValue.isolateUInt8(
            mask: hasAlpha ? 0x0000FF00 : 0x0000FF,
            bitShift: hasAlpha ? 8 : 0
        )
        
        let alpha: UInt8? = if hasAlpha {
            clampedValue.isolateUInt8(mask: 0x000000FF, bitShift: 0)
        } else {
            nil
        }
        
        return(red, green, blue, alpha)
    }
}

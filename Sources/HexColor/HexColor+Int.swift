// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

extension HexColor {
    /// Creates `HexColor` from the values for the red, green, and blue channels directly.
    /// - Note: Channel values will be clamed from 0 to 255
    /// - Parameters:
    ///   - red: The red channel value
    ///   - green: The green channel value
    ///   - blue: The blue channel value
    public init(red: Int, green: Int, blue: Int, alpha: Int? = nil) {
        self.init(
            red: UInt8(red.clamp(.colorChannel)), 
            green: UInt8(green.clamp(.colorChannel)),
            blue: UInt8(blue.clamp(.colorChannel)),
            alpha: UInt8(alpha?.clamp(.colorChannel))
        )
    }
    
    /// Creates a `HexColor` from a `Int` representation of
    /// a Hexadecimal Color.
    /// - Note: The value will be clamped between 0 to 0xFFFFFF or 0xFFFFFFFF depending on `hasAlpha`
    /// - Parameters:
    ///   - hexValue: The `UInt32` representation of the hex color.
    ///   - hasAlpha: Set to true if value contains alpha. Default false.
    public init(_ hexValue: Int, hasAlpha: Bool = false) {
        self.init(
            UInt32(hexValue.clamp(hasAlpha ? .hexValueWithAlpha : .hexValueNoAlpha)),
            hasAlpha: hasAlpha
        )
    }
}

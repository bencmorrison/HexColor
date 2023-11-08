// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

extension HexColor {
    /// Creates `HexColor` from the values for the r, g, and b channels directly.
    /// - Note: Channel values will be clamed from 0 to 255
    /// - Parameters:
    ///   - red: The red channel value
    ///   - green: The green channel value
    ///   - blue: The blue channel value
    public init(red: Int, green: Int, blue: Int) {
        self.init(
            red: UInt8(red.clamp(.colorChannel)), 
            green: UInt8(green.clamp(.colorChannel)),
            blue: UInt8(blue.clamp(.colorChannel))
        )
    }
    
    /// Creates a `HexColor` from a `Int` representation of
    /// a Hexadecimal Color.
    /// - Note: When the value will be clamped between 0 and 16777215 (0xFFFFFF)
    /// - Parameter hexValue: The `UInt32` representation of the hex color.
    public init(_ hexValue: Int) {
        self.init(UInt32(hexValue.clamp(.hexValue)))
    }
}

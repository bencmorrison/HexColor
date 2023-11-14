// Copyright © 2023 Ben Morrison. All rights reserved.

import SwiftUI

extension Color {
    /// Allows the creation of a `Color` form Hexadecimal color.
    /// - Note: Expects `#` to be prepended to the string
    /// - Throws: an error when the format is not `#RRGGBB` or `#RRGGBBAA`
    /// - Parameter hexString: The Hexadecimal Color to use.
    public init(hexString: String) throws {
        let hex = try HexColor(hexString)
        self = hex.color
    }
    
    /// Allows the creation of a `Color` from a `UInt32` that represents
    /// a Hexadecimal color.
    /// - Note: Hex is capped at 0xFFFFFF
    /// - Parameters:
    ///   - hex: The Hexadecimal Color value to use.
    ///   - hasAlpha: If your `UInt32` has the alpha channel, set to true.
    public init(hex: UInt32, hasAlpha: Bool = false) {
        let hex = HexColor(hex, hasAlpha: hasAlpha)
        self = hex.color
    }
    
    /// Allows the creation of a `Color` from a `Int` that represents
    /// a Hexadecimal color.
    /// - Note: Hex is capped at 0xFFFFFF
    /// - Parameters:
    ///   - hex: The Hexadecimal Color value to use.
    ///   - hasAlpha: If your `Int` has the alpha channel, set to true.
    public init(hex: Int, hasAlpha: Bool = false) {
        let hex = HexColor(hex, hasAlpha: hasAlpha)
        self = hex.color
    }
    
    /// Allows the creation of a `Color` from the `HexColor` structure.
    /// - Parameter hexColor: The `HexColor` that defines your Hexadecimal color
    public init(_ hexColor: HexColor) {
        self = hexColor.color
    }
    
    /// Allows the creation of a `Color` using the R, G, and B channels directly.
    /// While not requiring the user to devide by 1.0.
    /// - Parameters:
    ///   - red: The value for the red channel
    ///   - green: The value for the green channel
    ///   - blue: The value for the blue channel
    ///   - alpha: The opacity value is optional. When nil default will be 0xFF (255).
    public init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8?) {
        self.init(
            red: red.asDoubleColorChannel(),
            green: green.asDoubleColorChannel(),
            blue: blue.asDoubleColorChannel(),
            opacity: alpha.default(0xFF).asDoubleColorChannel()
        )
    }
}

extension HexColor {
    /// Returns a new instance of a `Color` that is defined by the `HexColor` struture.
    public var color: Color {
        return Color(red: red, green: green, blue: blue, alpha: alpha)
    }
}

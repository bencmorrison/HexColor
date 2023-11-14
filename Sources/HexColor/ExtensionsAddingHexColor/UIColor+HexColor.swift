// Copyright © 2023 Ben Morrison. All rights reserved.

#if canImport(UIKit)
import UIKit

extension UIColor {
    /// Allows the creation of a `UIColor` form Hexadecimal color.
    /// - Note: This expects `#` to be pre-pended to the value.
    /// - Throws: an error when the format is not `#RRGGBB` or `#RRGGBBAA`
    /// - Parameter hexString: The Hexadecimal Color to use.
    public convenience init(hexString: String) throws {
        let hex = try HexColor(hexString)
        self.init(hex)
    }
    
    /// Creates a `UIColor` from a `UInt32` representation of
    /// a Hexadecimal Color.
    /// - Note: Value is clamped to 0xFFFFFF or 0xFFFFFFFF depending on alpha.
    /// - Parameters:
    ///   - hexValue: The `UInt32` representation of the hex color.
    ///   - hasAlpha: If the value contains alpha, set this to true. Default is false
    public convenience init(hex: UInt32, hasAlpha: Bool = false) {
        let hex = HexColor(hex)
        self.init(hex)
    }
    
    /// Creates a `UIColor` from a `Int` representation of
    /// a Hexadecimal Color.
    /// - Note: Value is clamped to 0xFFFFFF or 0xFFFFFFFF depending on alpha.
    /// - Parameters:
    ///   - hexValue: The `Int` representation of the hex color.
    ///   - hasAlpha: If the value contains alpha, set this to true. Default is false
    public convenience init(hex: Int, hasAlpha: Bool = false) {
        let hex = HexColor(hex)
        self.init(hex)
    }
    
    /// Allows the creation of a `UIColor` from the `HexColor` structure.
    /// - Parameter hexColor: The `HexColor` that defines your Hexadecimal color
    public convenience init(_ hexColor: HexColor) {
        self.init(
            red: hexColor.red.asCGFloatColorChannel(),
            green: hexColor.green.asCGFloatColorChannel(),
            blue: hexColor.blue.asCGFloatColorChannel(),
            alpha: hexColor.alpha.default(0xFF).asCGFloatColorChannel()
        )
    }
}

extension HexColor {
    /// Returns a new instance of a `UIColor` that is defined by the `HexColor` struture.
    public var uiColor: UIColor { UIColor(self) }
}

#endif

// Copyright © 2023 Ben Morrison. All rights reserved.

#if canImport(AppKit)
import AppKit

extension NSColor {
    /// Allows the creation of a `Color` form Hexadecimal color.
    /// - Note: Expects `#` to be prepended to the string
    /// - Throws: an error when the format is not `#RRGGBB` or `#RRGGBBAA`
    /// - Parameter hexString: The Hexadecimal Color to use.
    public convenience init(hexString: String) throws {
        let hex = try HexColor(hexString)
        self.init(hex)
    }
    
    /// Allows the creation of a `Color` from a `UInt32` that represents
    /// a Hexadecimal color.
    /// - Throws: an error when the `hex` parameter is not equal to or below `0xFFFFFF`
    /// - Parameters:
    ///   - hex: The Hexadecimal Color value to use.
    ///   - hasAlpha: When the calue contains alpha as well, set this to true. Default is false.
    public convenience init(hex: UInt32, hasAlpha: Bool = false) {
        let hex = HexColor(hex, hasAlpha: hasAlpha)
        self.init(hex)
    }
    
    /// Allows the creation of a `NSColor` from a `Int` that represents
    /// a Hexadecimal color.
    /// - Throws: an error when the `hex` parameter is not equal to or below `0xFFFFFF`
    /// - Parameters:
    ///   - hex: The Hexadecimal Color value to use.
    ///   - hasAlpha: When the calue contains alpha as well, set this to true. Default is false.
    public convenience init(hex: Int, hasAlpha: Bool = false) {
        let hex = HexColor(hex, hasAlpha: hasAlpha)
        self.init(hex)
    }
    
    /// Allows the creation of a `Color` from the `HexColor` structure.
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
    public var nsColor: NSColor { NSColor(self) }
}

#endif

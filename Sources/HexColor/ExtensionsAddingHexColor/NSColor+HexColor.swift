// Copyright © 2023 Ben Morrison. All rights reserved.

#if canImport(AppKit)
import AppKit

extension NSColor {
    /// Allows the creation of a `Color` form Hexadecimal color.
    /// - Note: Expects `#` to be prepended to the string
    /// - Throws: an error when the format is not `#RRGGBB`
    /// - Parameters:
    ///    - hexString: The Hexadecimal Color to use.
    ///    - alpha: The alpha (opacity), specified as a value from 0-1.0.
    ///    Alpha values below 0 are interpreted as 0.0, 
    ///    and values above 1.0 are interpreted as 1.0.
    ///    Default value is 1.0
    public convenience init(hexString: String, alpha: CGFloat = 1.0) throws {
        let hex = try HexColor(hexString)
        self.init(
            red: CGFloat(hex.red) / 255.0,
            green: CGFloat(hex.green) / 255.0,
            blue: CGFloat(hex.blue) / 255.0,
            alpha: alpha
        )
    }
    
    /// Allows the creation of a `Color` from a `UInt32` that represents
    /// a Hexadecimal color.
    /// - Throws: an error when the `hex` parameter is not equal to or below `0xFFFFFF`
    /// - Parameters:
    ///    - hex: The Hexadecimal Color value to use.
    ///    When the value is above 0xFFFFFF it will be treated as 0xFFFFFF
    ///    - alpha: The alpha (opacity), specified as a value from 0-1.0.
    ///    Alpha values below 0 are interpreted as 0.0,
    ///    and values above 1.0 are interpreted as 1.0.
    ///    Default value is 1.0
    public convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let hex = HexColor(hex)
        self.init(
            red: CGFloat(hex.red) / 255.0,
            green: CGFloat(hex.green) / 255.0,
            blue: CGFloat(hex.blue) / 255.0,
            alpha: alpha
        )
    }
    
    /// Allows the creation of a `Color` from the `HexColor` structure.
    /// - Parameters:
    ///     - hexColor: The `HexColor` that defines your Hexadecimal color
    ///     - alpha: The alpha (opacity), specified as a value from 0-1.0.
    ///    Alpha values below 0 are interpreted as 0.0,
    ///    and values above 1.0 are interpreted as 1.0.
    ///    Default value is 1.0
    public convenience init(_ hexColor: HexColor, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat(hexColor.red) / 255.0,
            green: CGFloat(hexColor.green) / 255.0,
            blue: CGFloat(hexColor.blue) / 255.0,
            alpha: 1.0
        )
    }
}

extension HexColor {
    /// Returns a new instance of a `UIColor` that is defined by the `HexColor` struture.
    public var nsColor: NSColor {
        NSColor(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: 1.0
        )
    }
}

#endif

// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation
import PrettyBinaryIntegerString

/// Provides a structure to define a Hexademimal color via it's Red, Green Blue, and Alpha channels
public struct HexColor: Hashable, Sendable {
    /// The value for the red channel
    public let red: UInt8
    /// The value for the green channel
    public let green: UInt8
    /// The value for the blue channel
    public let blue: UInt8
    /// The value for the alpha channel
    public let alpha: UInt8?
    /// Provides the full hex value for the color defined via the channels.
    /// If no alpha channel is provided the max value is `0xFFFFFF`
    /// If an alpha channel is provided the max value is `0xFFFFFFFF`
    public let hexValue: UInt32
    
    /// Creates `HexColor` from the values for the red, green, blue, and alpha channels directly.
    /// - Parameters:
    ///   - red: The red channel value
    ///   - green: The green channel value
    ///   - blue: The blue channel value
    ///   - alpha: The alpha channel value
    public init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8? =  nil) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
        hexValue = UInt32(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// Creates a `HexColor` from a `String` representation of
    /// a Hexadecimal Color.
    /// - Note: This expects `#` to be pre-pended to the value.
    /// - Throws: an error when the format is not `#RRGGBB` or `#RRGGBBAA`
    /// - Parameters hexString: The `String` representation of the hex color
    public init(_ hexString: String) throws {
        let values = try Self.rgbValues(from: hexString)
        self.init(red: values.0, green: values.1, blue: values.2, alpha: values.3)
    }
    
    /// Creates a `HexColor` from a `String` representation of a Hexadecimal Color.
    /// This init returns `nil` instead of throws when the `hexString` is not the
    /// format of `#RRGGBB`
    /// - Note: This expects `#` to be pre-pended to the value.
    /// - Parameter hexString: The `String` representation of the hex color
    public init?(from hexString: String, hasAlpha: Bool = false) throws {
        guard let values = try? Self.rgbValues(from: hexString) else { return nil }
        self.init(red: values.0, green: values.1, blue: values.2, alpha: values.3)
    }
    
    /// Creates a `HexColor` from a `UInt32` representation of
    /// a Hexadecimal Color.
    /// - Note: Value is clamped to 0xFFFFFF or 0xFFFFFFFF depending on alpha.
    /// - Parameters:
    ///   - hexValue: The `UInt32` representation of the hex color.
    ///   - hasAlpha: If the value contains alpha, set this to true. Default is false
    public init(_ hexValue: UInt32, hasAlpha: Bool = false) {
        let values = Self.rgbValues(from: hexValue, hasAlpha: hasAlpha)
        self.init(red: values.0, green: values.1, blue: values.2, alpha: values.3)
    }
}

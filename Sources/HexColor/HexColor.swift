// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation
import PrettyBinaryIntegerString

/// Provides a structure to define a Hexademimal color via it's R, G, and B channels
public struct HexColor: Hashable, Sendable {
    /// The value for the red channel
    public let red: UInt8
    /// The value for the green channel
    public let green: UInt8
    /// The value for the blue channel
    public let blue: UInt8
    /// Provides the full hex value for the color defined via the channels.
    public let hexValue: UInt32
    
    /// Creates `HexColor` from the values for the r, g, and b channels directly.
    /// - Parameters:
    ///   - red: The red channel value
    ///   - green: The green channel value
    ///   - blue: The blue channel value
    public init(red: UInt8, green: UInt8, blue: UInt8) {
        self.red = red
        self.green = green
        self.blue = blue
        hexValue = UInt32(red: red, green: green, blue: blue)
    }
    
    /// Creates a `HexColor` from a `String` representation of
    /// a Hexadecimal Color.
    /// - Note: This expects `#` to be pre-pended to the value.
    /// - Throws: an error when the format is not `#RRGGBB`
    /// - Parameter stringHexColor: The `String` representation of the hex color
    public init(_ hexString: String) throws {
        let values = try Self.rgbValues(from: hexString)
        self.init(red: values.0, green: values.1, blue: values.2)
    }
    
    /// Creates a `HexColor` from a `String` representation of a Hexadecimal Color.
    /// This init returns `nil` instead of throws when the `hexString` is not the
    /// format of `#RRGGBB`
    /// - Note: This expects `#` to be pre-pended to the value.
    /// - Parameter stringHexColor: The `String` representation of the hex color
    public init?(from hexString: String) throws {
        guard let values = try? Self.rgbValues(from: hexString) else { return nil }
        self.init(red: values.0, green: values.1, blue: values.2)
    }
    
    /// Creates a `HexColor` from a `UInt32` representation of
    /// a Hexadecimal Color.
    /// - Note: When the value is above 16777215 (0xFFFFFF), it will be treated as 0xFFFFFF
    /// - Parameter hexValue: The `UInt32` representation of the hex color.
    public init(_ hexValue: UInt32) {
        let values = Self.rgbValues(from: hexValue)
        self.init(red: values.0, green: values.1, blue: values.2)
    }
}

// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

extension UInt32 {
    /// Allows an UInt32 to be quickly created from a `HexColor`
    /// The value can be used as a normal `UInt32`. Primarly being used to
    /// display the value in strings.
    /// - Parameter hexColor: The `HexColor` that needs to be converted
    ///             to an `UInt32`
    public init(_ hexColor: HexColor) {
        self.init(red: hexColor.red, green: hexColor.green, blue: hexColor.blue)
    }
    
    init(red: UInt8, green: UInt8, blue: UInt8) {
        self = ((UInt32(red) << 16) | (UInt32(green) << 8) | UInt32(blue))
    }
    
    func clamp(_ range: ClosedRange<Self>) -> Self {
        range.clamp(self)
    }
}

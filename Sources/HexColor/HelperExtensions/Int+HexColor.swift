// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

import Foundation

extension Int {
    /// Allows an Int to be quickly created from a `HexColor`
    /// The value can be used as a normal `Int`. Primarly being used to display
    /// the value in strings.
    /// - Parameter hexColor: The `HexColor` that needs to be converted to an `Int`
    public init(_ hexColor: HexColor) {
        self.init(
            red: hexColor.red,
            green: hexColor.green,
            blue: hexColor.blue,
            alpha: hexColor.alpha
        )
    }
    
    init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8?) {
        self.init(UInt32(red: red, green: green, blue: blue, alpha: alpha))
    }
}

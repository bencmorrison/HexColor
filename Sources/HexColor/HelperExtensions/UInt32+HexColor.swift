// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

extension UInt32 {
    /// Allows an UInt32 to be quickly created from a `HexColor`
    /// The value can be used as a normal `UInt32`. Primarly being used to
    /// display the value in strings.
    /// - Parameter hexColor: The `HexColor` that needs to be converted
    ///             to an `UInt32`
    public init(_ hexColor: HexColor) {
        self.init(
            red: hexColor.red,
            green: hexColor.green,
            blue: hexColor.blue,
            alpha: hexColor.alpha
        )
    }
        
    init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8?) {
        let red   = UInt32(red)   << ((alpha == nil) ? 16 : 24)
        let green = UInt32(green) << ((alpha == nil) ? 8  : 16)
        let blue  = UInt32(blue)  << ((alpha == nil) ? 0  : 8)
        
        guard let alpha else { self = (red | green | blue); return  }
        self = (red | green | blue | UInt32(alpha))
    }
    
    func isolateUInt8(mask: UInt32, bitShift: Int) -> UInt8 {
        let masked = self & mask
        let shifted = if bitShift > 0 { masked >> bitShift } else { masked }
        return UInt8(shifted)
    }
}

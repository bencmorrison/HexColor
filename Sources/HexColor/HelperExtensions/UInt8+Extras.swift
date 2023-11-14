// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

extension UInt8 {
    init?(_ value: (any FixedWidthInteger)?) {
        guard let value else { return nil }
        self = UInt8(value)
    }
    
    func asDoubleColorChannel() -> Double {
        Double(self) / 255.0
    }
    
    func asCGFloatColorChannel() -> CGFloat {
        CGFloat(self) / 255.0
    }
}

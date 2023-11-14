// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

extension ClosedRange where Bound == UInt32 {
    static let hexValueWithAlpha: ClosedRange<Bound> = 0...0xFFFFFFFF
    static let hexValueNoAlpha: ClosedRange<Bound>   = 0...0xFFFFFF
    static let hexColorChannel: ClosedRange<Bound>   = 0...0xFF
}

extension ClosedRange where Bound == Int {
    static let hexValueWithAlpha: ClosedRange<Bound> = 0...0xFFFFFFFF
    static let hexValueNoAlpha: ClosedRange<Bound>   = 0...0xFFFFFF
    static let colorChannel: ClosedRange<Bound>      = 0...0xFF
}

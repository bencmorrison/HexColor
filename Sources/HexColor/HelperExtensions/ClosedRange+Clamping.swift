// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

extension ClosedRange where Bound == UInt32 {
    static let hex: ClosedRange<Bound> = 0...0xFFFFFF
}

extension ClosedRange {
    func clamp(_ value: Bound) -> Bound {
        Swift.min(Swift.max(value, lowerBound), upperBound)
    }
}

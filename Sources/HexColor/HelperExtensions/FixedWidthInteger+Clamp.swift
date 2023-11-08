// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

extension FixedWidthInteger {
    func clamp(_ range: ClosedRange<Self>) -> Self {
        Swift.min(Swift.max(self, range.lowerBound), range.upperBound)
    }
}

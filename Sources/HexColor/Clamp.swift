// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

/// Defines a range to clamp the value to.
@propertyWrapper
public struct Clamped<Value: Comparable> {
    private var value: Value
    private var range: ClosedRange<Value>
    
    public var wrappedValue: Value {
        get { value }
        set { value = range.clamp(newValue) }
    }
    
    init(wrappedValue: Value, to range: ClosedRange<Value>) {
        self.range = range
        self.value = range.clamp(wrappedValue)
    }
}

extension ClosedRange {
    func clamp(_ value: Bound) -> Bound {
        Swift.min(Swift.max(value, lowerBound), upperBound)
    }
}

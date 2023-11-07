// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

extension HexColor: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        let string = String(hexValue, radix: .hexadecimal, prefix: .none)
        return "#\(string.dropFirst(2))"
    }
    
    public var debugDescription: String {
        return """
        red: \(String(red, radix: .hexadecimal)),
        green: \(String(green, radix: .hexadecimal)),
        blue: \(String(blue, radix: .hexadecimal)))
        combined: \(String(hexValue, radix: .hexadecimal))
        """
    }
}

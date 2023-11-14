// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

extension HexColor: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        var string = String(hexValue, radix: .hexadecimal, prefix: .none)
        if alpha == nil { string = String(string.dropFirst(2)) }
        return "#\(string)"
    }
    
    public var debugDescription: String {
        var desc = """
        red: \(String(red, radix: .hexadecimal))
        green: \(String(green, radix: .hexadecimal))
        blue: \(String(blue, radix: .hexadecimal)))
        """
        
        if let alpha {
            desc += "alpha: \(String(alpha, radix: .hexadecimal)))"
        }
        
        desc += "combined: \(String(hexValue, radix: .hexadecimal))"
        return desc
    }
}

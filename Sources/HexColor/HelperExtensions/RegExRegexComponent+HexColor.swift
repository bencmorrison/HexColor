// Copyright © 2023 Ben Morrison. All rights reserved.

import RegexBuilder

extension RegexComponent where Self == String  {
    /// Expected represenation starting with a `#` followed by 6 hex digits.
    static var hexColorNoAlpha: Regex<Substring> { Regex.hexColorNoAlpha }
    /// Expected represenation starting with a `#` followed by 8 hex digits.
    static var hexColorWithAlpha: Regex<Substring> { Regex.hexColorWithAlpha }
}

private extension Regex where Output == Substring {
    static let hexColorNoAlpha = Regex {
        Anchor.startOfLine
        "#"
        Repeat(count: 6) { .hexDigit }
        Anchor.endOfLine
    }
    
    static let hexColorWithAlpha = Regex {
        Anchor.startOfLine
        "#"
        Repeat(count: 8) { .hexDigit }
        Anchor.endOfLine
    }
}

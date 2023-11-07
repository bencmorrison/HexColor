// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

extension HexColor: Equatable {
    public static func == (lhs: HexColor, rhs: HexColor) -> Bool {
        return lhs.red == rhs.red &&
            lhs.green == rhs.green &&
            lhs.blue == rhs.blue
    }
}

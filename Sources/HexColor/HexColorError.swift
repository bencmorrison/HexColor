// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

public enum HexColorError: Error {
    case stringDoesNotMeetExpectedFormat
    
    public var message: String {
        switch self {
        case .stringDoesNotMeetExpectedFormat:
            return "Expected Format: #RRGGBB"
        }
    }
}

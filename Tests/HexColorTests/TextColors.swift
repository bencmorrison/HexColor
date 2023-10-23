// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

typealias RGBValue = (UInt8, UInt8, UInt8)

enum TestColor: String, CaseIterable {
    case black
    case white
    case red
    case green
    case blue
    case yellow
    case cyan
    case magenta
    case gray
    
    var rgb: RGBValue {
        switch self {
        case .black: return (0,0,0)
        case .white: return (255,255,255)
        case .red: return (255,0,0)
        case .green: return (0,255,0)
        case .blue: return (0,0,255)
        case .yellow: return (255,255,0)
        case .cyan: return (0,255,255)
        case .magenta: return  (255,0,255)
        case .gray: return (64,64,64)
        }
    }
    
    var hex: String {
        switch self {
        case .black: return "#000000"
        case .white: return "#FFFFFF"
        case .red: return "#FF0000"
        case .green: return "#00FF00"
        case .blue: return "#0000FF"
        case .yellow: return "#FFFF00"
        case .cyan: return "#00FFFF"
        case .magenta: return "#FF00FF"
        case .gray: return "#404040"
        }
    }
    
    var hexInt: UInt32  {
        switch self {
        case .black: return 0x000000
        case .white: return 0xFFFFFF
        case .red: return 0xFF0000
        case .green: return 0x00FF00
        case .blue: return 0x0000FF
        case .yellow: return 0xFFFF00
        case .cyan: return 0x00FFFF
        case .magenta: return 0xFF00FF
        case .gray: return 0x404040
        }
    }
}

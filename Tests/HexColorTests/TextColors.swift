// Copyright © 2023 Ben Morrison. All rights reserved.

import Foundation

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
    
    // MARK: - Hex String
    private var hexString: String {
        switch self {
        case .black:   return "#000000"
        case .white:   return "#FFFFFF"
        case .red:     return "#FF0000"
        case .green:   return "#00FF00"
        case .blue:    return "#0000FF"
        case .yellow:  return "#FFFF00"
        case .cyan:    return "#00FFFF"
        case .magenta: return "#FF00FF"
        case .gray:    return "#404040"
        }
    }
    
    private var alphaString: String {
        switch self {
        case .black:   return "00"
        case .white:   return "FF"
        case .red:     return "AA"
        case .green:   return "09"
        case .blue:    return "BB"
        case .yellow:  return "CD"
        case .cyan:    return "90"
        case .magenta: return "11"
        case .gray:    return "45"
        }
    }
    
    func hexString(withAlpha: Bool = false) -> String {
        guard withAlpha else { return hexString }
        return hexString + alphaString
    }
    
    // MARK: - RBG Values
    func rgbValues<T: FixedWidthInteger>(as: T.Type) -> (T, T, T, T) {
        switch self {
        case .black:   return (0,0,0,0)
        case .white:   return (255,255,255,255)
        case .red:     return (255,0,0,170)
        case .green:   return (0,255,0,9)
        case .blue:    return (0,0,255,187)
        case .yellow:  return (255,255,0,205)
        case .cyan:    return (0,255,255,144)
        case .magenta: return  (255,0,255,17)
        case .gray:    return (64,64,64,69)
        }
    }
    
    // MARK: - HEX Integers
    private func hexInt<T: FixedWidthInteger>(as: T.Type) -> T {
        switch self {
        case .black:   return 0x000000
        case .white:   return 0xFFFFFF
        case .red:     return 0xFF0000
        case .green:   return 0x00FF00
        case .blue:    return 0x0000FF
        case .yellow:  return 0xFFFF00
        case .cyan:    return 0x00FFFF
        case .magenta: return 0xFF00FF
        case .gray:    return 0x404040
        }
    }
    
    private func alphaInt<T: FixedWidthInteger>(as: T.Type) -> T {
        switch self {
        case .black:   return 0x00
        case .white:   return 0xFF
        case .red:     return 0xAA
        case .green:   return 0x09
        case .blue:    return 0xBB
        case .yellow:  return 0xCD
        case .cyan:    return 0x90
        case .magenta: return 0x11
        case .gray:    return 0x45
        }
    }
    
    func hexInt<T: FixedWidthInteger>(as Atype: T.Type, withAlpha: Bool = false) -> T {
        guard withAlpha else { return hexInt(as: Atype) }
        let hexVal = hexInt(as: Atype) << 8
        let alpha = alphaInt(as: Atype)
        return hexVal + alpha
    }
}

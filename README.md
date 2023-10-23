# `HexColor` for Swift

This small SPM that allows you to easily take a `String` or `UInt32` hex color value and get a `Color`, `UIColor`, or `NSColor` from it.

## Examples

### `HexColor` examples
```swift
let hexColor = HexColor(0xFF0000)
let color = HexColor(hexColor)
// color is a red color
```

```swift
let hexColor = HexColor("0x00FF00")
let color = HexColor(hexColor)
// color is a green color
```

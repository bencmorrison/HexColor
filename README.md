# `HexColor` for Swift

This small Swift Package allows you to use Hexadecimal values to create a `Color`,
`UIColor`, or `NSColor`. Supporting Hex Values with or without alpha.

## Examples

### `HexColor` examples
```swift
let hexColor = HexColor(0xFF0000)
let color = HexColor(hexColor)
// color is a red color with no alpha
```

```swift
let hexColor = HexColor("0x00FF00")
let color = HexColor(hexColor)
// color is a green color with no alpha
```

```swift
let hexColor = HexColor(0xFF00007F)
let color = HexColor(hexColor, hasAlpha: true)
// color is a red color with no ~ 50% alpha.
```

```swift
let hexColor = HexColor("0x00FF00FF")
let color = HexColor(hexColor)
// color is a green color with 100% alpha
```

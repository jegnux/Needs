# Needs

[![Version](https://img.shields.io/cocoapods/v/Needs.svg?style=flat)](https://cocoapods.org/pods/Needs)
[![License](https://img.shields.io/cocoapods/l/Needs.svg?style=flat)](https://cocoapods.org/pods/Needs)
[![Platform](https://img.shields.io/cocoapods/p/Needs.svg?style=flat)](https://cocoapods.org/pods/Needs)

*Needs* is a small library that let you use a property wrapper to automatically call `setNeeds-` methods.
It works out-of-the-box for all `setNeeds-` methods available on `UIView`, `UIViewController` and `NSView`. 
If you _need to_ you can also [extend it](https://en.wikipedia.org/wiki/Open–closed_principle) with your own _Need_.

## Requirements

- iOS 9.0+ / macOS 10.10+
- Swift 5.2

## Installation
*Needs* is available through CocoaPods and SwiftPM

## Example

Add a `Needs` property wrapper to one of your properties to call automatically the desired `setNeeds-` method 
```swift
@Needs(.layout, .display)
var progress: CGFloat = 0
```

## Available _needs_

#### [`UIView`](/Sources/Need+UIView.swift)
```swift
.display            // self.setNeedsDisplay()
.layout             // self.setNeedsLayout()
.updateConstraints  // self.setNeedsUpdateConstraints()
.focusUpdate        // self.setNeedsFocusUpdate()
```

#### [`UIViewController`](/Sources/Need+UIViewController.swift)
```swift
.statusBarAppearanceUpdate                    // self.setNeedsStatusBarAppearanceUpdate()
.updateOfHomeIndicatorAutoHidden              // self.setNeedsUpdateOfHomeIndicatorAutoHidden()
.updateOfScreenEdgesDeferringSystemGestures   // self.setNeedsUpdateOfScreenEdgesDeferringSystemGestures()
.updateOfPrefersPointerLocked                 // self.setNeedsUpdateOfPrefersPointerLocked()
.userInterfaceAppearanceUpdate                // self.setNeedsUserInterfaceAppearanceUpdate()
.focusUpdate                                  // self.setNeedsFocusUpdate()
.viewDisplay                                  // self.viewIfLoaded?.setNeedsDisplay()
.viewLayout                                   // self.viewIfLoaded?.setNeedsLayout()
.updateViewConstraints                        // self.viewIfLoaded?.setNeedsUpdateConstraints()
.reloadData                                   // self.tableView.reloadData()
```

#### [`NSView`](/Sources/Need+NSView.swift)
```swift
.display           // self.setNeedsDisplay($0.bounds)
.layout            // self.needsLayout = true
.updateConstraints // self.needsUpdateConstraints = true
```

## Author

[Jérôme Alves](https://twitter.com/jegnux)

## License

**Needs** is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

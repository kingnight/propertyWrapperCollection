# propertyWrapperCollection
A collection of Swift Property Wrappers 



![](https://img.shields.io/badge/Code%20Coverage-82.8%25-green)![](https://img.shields.io/badge/License-MIT-blue) ![](https://img.shields.io/badge/iOS-%3E%3D11-blue)

A collection of  tested Swift Property Wrappers.

## List

- [@Clamping](#Clamping)
- [@CopyOnWrite](#CopyOnWrite)
- [@DynamicColor](#DynamicColor)
- [@UserDefault](#UserDefault)
- [@LateInitialized](#LateInitialized)
- [@Logged](#Logged)
- [@Rounded](#Rounded)
- [@UnitInterval](#UnitInterval)
- [@Trimmed](#Trimmed)
- [@Default](#Default)


## Requirements
Xcode 11 & Swift 5

## @Clamping

 A property wrapper that automatically clamps its wrapped value in a range.

```swift
@Clamping(1.0...14.0) var pH : Double = 7.0
pH = 0
print(pH) //1
ph = 20
print(ph) //14
```



## @CopyOnWrite

A property wrapper that if object is referenced by other object, the object will `.copy()` as new same type object.

```swift
    class Texture:NSObject,NSCopying {
        func copy(with zone: NSZone? = nil) -> Any {
            let copy = Texture()
            return copy
        }
    }
    
    @CopyOnWrite var texture: Texture = .init()

```



## @DynamicColor

A property wrapper arround UIColor to support dark mode.

By default in iOS >= 13 it uses the new system wide user interface style trait and dynamic UIColor constructor to support dark mode without any extra effort. On prior iOS versions it defaults to light.
```swift
@DynamicColor(lightVariant: .black, darkVariant: .white)
    var dynamicColor: UIColor

// The color will automatically update when traits change
view.backgroundColor = backgroundColor
```



## @Trimmed

A wrapper that automatically trims strings both on initialization and reassignment.

```swift
@Trimmed
var text = " \n Hello, World! \n\n    "

print(text) // "Hello, World!"

// By default trims white spaces and new lines, but it also supports any character set
@Trimmed(characterSet: .whitespaces)
var text = " \n Hello, World! \n\n    "
print(text) // "\n Hello, World! \n\n"
```

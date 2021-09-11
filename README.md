# propertyWrapperCollection
A collection of  tested Swift Property Wrappers.

![](https://img.shields.io/badge/Code%20Coverage-82.8%25-green)![](https://img.shields.io/badge/License-MIT-blue) ![](https://img.shields.io/badge/iOS-%3E%3D11-blue)

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

## @UserDefault

A type safe property wrapper to set and get values from UserDefaults with support for defaults values.

```Swift
@UserDefault("has_seen_app_introduction", defaultValue: false)
static var hasSeenAppIntroduction: Bool
```

## @LateInitialized

A property wrapper that implement Swift Implicitly Unwrapped Optional,  if Access it before initializing will result in fatal error

```swift
@LateInitialized var text:String
print(text) //fatalError("value has not yet been set!")
//
```

## @Logged

A property wrapper that when you set value ,will print its value 

```swift
@Logged var param:String = ""
param = "newText"
//print newText in debug mode

//in Swift 5.5  add "Extend Property Wrappers to Function and Closure parameters" new function , that means you can put  Property Wrappers before function parameter

class Test{
    func runAnimation(@Logged withDuration duration: Double) {
        
    }
}
// duration paramter will print when call runAnimation
```

## @Rounded

A property wrapper that  rounds the double to decimal places value

```swift
@Rounded(digits: 2) var number: Double = 3.1415926
print(number)   //3.14

@Rounded(digits: 3) var number: Double = 3.1415926
print(number)   //3.142

@Rounded(digits: 4) var number: Double = 3.1415926
print(number)   //3.1416

```
## @UnitInterval

 A property wrapper that automatically clamps its wrapped value in 0...1

```swift
struct RGB {
    @UnitInterval var red: Double
    @UnitInterval var green: Double
    @UnitInterval var blue: Double
}

let cornflowerBlue = RGB(red: 0.392, green: 0.584, blue: 0.929)

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

## @Default

A property wrapper when decode support for defaults values.

```swift
struct Demo:Decodable {
   @Default<String> var text:String
   @Default<Bool> var check:Bool
   @Default<Int> var count1:Int
}

let json = #"{"count1": 12345, "text": "My First Video", "check": true}"#
let value = try! JSONDecoder().decode(Demo.self, from: json.data(using: .utf8)!)
print(value)
//value.count1 12345
//value.text  "My First Video"
//value.check  true

let json = #"{"check": true}"#
let value = try! JSONDecoder().decode(Demo.self, from: json.data(using: .utf8)!)
print(value)
//value.count1 0
//value.text  ""
```


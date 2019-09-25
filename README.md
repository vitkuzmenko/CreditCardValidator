# Credit Card Validator on Swift
Credit Card Validator and type detector on Swift.

Inspired from [https://github.com/MaxKramer/ObjectiveLuhn]()


# Installation

### CocoaPods

```
pod "CreditCardValidator"
```

### Swift Package Manager

```swift
.package(url: "https://github.com/vitkuzmenko/CreditCardValidator.git", .upToNextMajor(from: "_currentVersion_"))
```

After specifying `"CreditCardValidator"` as a dependency of the target in which you want to use it, run `swift package update`.

### Accio

Do the same configurations as for SwiftPM, then run `accio update` instead of `swift package update`.

# Usage
## Validating

```Swift
let number = "1234 5678 9123 4567"
   
let v = CreditCardValidator()
   
if v.validateString(number) {
  // Card number is valid
} else {
  // Card number is invalid
}

```

## Detect Card Type

```Swift
let number = "1234 5678 9123 4567"
   
let v = CreditCardValidator()
if let type = v.typeFromString(number) {
	println(type.name) // Visa, Mastercard, Amex etc.
} else {
	// I Can't detect type of credit card
}

```
# Contribution
Contributions are very welcomed 👍😃.

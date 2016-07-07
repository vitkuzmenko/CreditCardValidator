# Credit Card Validator on Swift
Credit Card Validator and type detector on Swift.

Migrated to Swift 3 on Xcode 8 beta 2 by Shai Mishali ([@freak4pc](http://github.com/freak4pc)).

Inspired from [https://github.com/MaxKramer/ObjectiveLuhn]()


# Installation
`pod "CreditCardValidator", :git => 'https://github.com/vitkuzmenko/CreditCardValidator.git', :branch => 'swift3'`

*Note:* On Xcode 8 beta 2, if you get a `Mach Linker Error`, please use the temporary hack [provided here](https://github.com/CocoaPods/CocoaPods/issues/5598#issuecomment-230662508).

# Usage
## Validating

```Swift
let number = "1234 5678 9123 4567"

let v = CreditCardValidator()

if v.validate(string: number) {
  // Card number is valid
} else {
  // Card number is invalid
}

```

## Detect Card Type

```Swift
let number = "1234 5678 9123 4567"

let v = CreditCardValidator()
if let type = v.type(of: number) {
	print(type.name) // Visa, Mastercard, Amex etc.
} else {
	// I Can't detect type of credit card
}

```
# Contribution
Contributions are very welcomed 👍😃.

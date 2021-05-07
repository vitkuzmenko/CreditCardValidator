import Foundation

public enum CreditCardType: String {
    case amex = "^3[47][0-9]{5,}$"
    case visa = "^4[0-9]{6,}$"
    case masterCard = "^(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}$"
    case maestro = "^(?:5[0678]\\d\\d|6304|6390|67\\d\\d)\\d{8,15}$"
    case dinersClub = "^3(?:0[0-5]|[68][0-9])[0-9]{4,}$"
    case jcb = "^(?:2131|1800|35[0-9]{3})[0-9]{3,}$"
    case discover = "^6(?:011|5[0-9]{2})[0-9]{3,}$"
    case unionPay = "^62[0-5]\\d{13,16}$"
    case mir = "^2[0-9]{6,}$"
}

public struct CreditCardValidator {
    
    /// Available credit card types
    private let types: [CreditCardType] = [
        .amex,
        .visa,
        .masterCard,
        .maestro,
        .dinersClub,
        .jcb,
        .discover,
        .unionPay,
        .mir
    ]
    
    private let string: String
    
    /// Create validation value
    /// - Parameter string: credit card number
    public init(_ string: String) {
        self.string = string.numbers
    }
    
    /// Get card type
    /// Card number validation is not perfroms here
    public var type: CreditCardType? {
        types.first { type in
            NSPredicate(format: "SELF MATCHES %@", type.rawValue)
                .evaluate(
                    with: string.numbers
                )
        }
    }
    
    /// Calculation structure
    private struct Calculation {
        let odd, even: Int
        func result() -> Bool {
            (odd + even) % 10 == 0
        }
    }
    
    /// Validate credit card number
    public var isValid: Bool {
        string.count >= 9 && string
            .reversed()
            .compactMap({ Int(String($0)) })
            .enumerated()
            .reduce(Calculation(odd: 0, even: 0), { value, iterator in
                return .init(
                    odd: iterator.offset % 2 != 0 ? value.odd + (iterator.element / 5 + (2 * iterator.element) % 10) : value.odd,
                    even: iterator.offset % 2 == 0 ? value.even + iterator.element : value.even
                )
            })
            .result()
    }
    
    /// Validate card number string for type
    /// - Parameters:
    ///   - string: card number string
    ///   - type: credit card type
    /// - Returns: bool value
    public func isValid(for type: CreditCardType) -> Bool {
        isValid && self.type == type
    }
    
}

fileprivate extension String {
 
    var numbers: String {
        let set = CharacterSet.decimalDigits.inverted
        let numbers = components(separatedBy: set)
        return numbers.joined(separator: "")
    }
    
}

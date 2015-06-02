//
//  CreditCardValidator.swift
//  WOSDK
//
//  Created by Vitaliy Kuzmenko on 02/06/15.
//  Copyright (c) 2015 Wallet One. All rights reserved.
//

import Foundation

extension String {
    
    var onlyNumbers: String {
        let set = NSCharacterSet.decimalDigitCharacterSet().invertedSet
        let numbers = self.componentsSeparatedByCharactersInSet(set)
        return "".join(numbers)
    }
    
}


class CreditCardValidator {
    
    typealias T = CreditCardValidationType
    
    lazy var types: [T] = {
        var types = [T]()
        for object in CreditCardValidator.types {
            types.append(T(dict: object))
        }
        return types
        }()
    
    /**
    Get card type from string
    
    :param: string card number string
    
    :returns: CreditCardValidationType structure
    */
    func typeFromString(string: String) -> T? {
        for type in types {
            let predicate = NSPredicate(format: "SELF MATCHES %@", type.regex)
            if predicate.evaluateWithObject(string.onlyNumbers) {
                return type
            }
        }
        return nil
    }
    
    /**
    Validate card number
    
    :param: string card number string
    
    :returns: true or false
    */
    func validateString(string: String) -> Bool {
        let numbers = string.onlyNumbers
        if count(numbers) < 9 {
            return false
        }
        
        var reversedString = ""
        let range = Range<String.Index>(start: numbers.startIndex, end: numbers.endIndex)
        
        numbers.enumerateSubstringsInRange(range, options: (.Reverse | .ByComposedCharacterSequences)) { (substring, substringRange, enclosingRange, stop) -> () in
            reversedString += substring
        }
        
        var oddSum = 0, evenSum = 0
        var reversedArray = Array(reversedString)
        var i = 0
        
        for s in reversedArray {
            
            let digit = String(s).toInt()!
            
            if i++ % 2 == 0 {
                evenSum += digit
            } else {
                oddSum += digit / 5 + (2 * digit) % 10
            }
        }
        return (oddSum + evenSum) % 10 == 0
    }
    
    /**
    Validate card number string for type
    
    :param: string card number string
    :param: type   CreditCardValidationType structure
    
    :returns: true or false
    */
    func validateString(string: String, forType type: T) -> Bool {
        return typeFromString(string) == type
    }
    
    // MARK: - Loading data

    private static let types = [
        [
            "name": "Amex",
            "regex": "^3[47][0-9]{5,}$"
        ], [
            "name": "Visa",
            "regex": "^4[0-9]{6,}$"
        ], [
            "name": "MasterCard",
            "regex": "^5[1-5][0-9]{5,}$"
        ], [
            "name": "Maestro",
            "regex": "^(?:5[0678]\\d\\d|6304|6390|67\\d\\d)\\d{8,15}$"
        ], [
            "name": "Diners Club",
            "regex": "^3(?:0[0-5]|[68][0-9])[0-9]{4,}$"
        ], [
            "name": "JCB",
            "regex": "^(?:2131|1800|35[0-9]{3})[0-9]{3,}$"
        ], [
            "name": "Discover",
            "regex": "^6(?:011|5[0-9]{2})[0-9]{3,}$"
        ], [
            "name": "UnionPay",
            "regex": "^62[0-5]\\d{13,16}$"
        ]
    ]
    
}

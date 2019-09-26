//
//  CreditCardValidationType.swift
//
//  Created by Vitaliy Kuzmenko on 02/06/15.
//  Copyright (c) 2015. All rights reserved.
//

import Foundation

public func == (lhs: CreditCardValidationType, rhs: CreditCardValidationType) -> Bool {
    return lhs.name == rhs.name
}

public struct CreditCardValidationType: Equatable {
    public var name: String
    public var regex: String

    public init(dict: [String: Any]) {
        name = dict["name"] as? String ?? ""
        regex = dict["regex"] as? String ?? ""
    }
}

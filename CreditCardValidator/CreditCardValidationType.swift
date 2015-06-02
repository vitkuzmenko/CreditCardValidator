//
//  CreditCardValidationType.swift
//  WOSDK
//
//  Created by Vitaliy Kuzmenko on 02/06/15.
//  Copyright (c) 2015 Wallet One. All rights reserved.
//

import Foundation

func ==(lhs: CreditCardValidationType, rhs: CreditCardValidationType) -> Bool {
    return lhs.name == rhs.name
}

struct CreditCardValidationType: Equatable {
    
    var name: String
    
    var regex: String

    init(dict: [String: AnyObject]) {
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            self.name = ""
        }
        
        if let regex = dict["regex"] as? String {
            self.regex = regex
        } else {
            self.regex = ""
        }
    }
    
}


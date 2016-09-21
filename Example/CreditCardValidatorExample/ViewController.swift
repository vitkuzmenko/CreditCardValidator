//
//  ViewController.swift
//  CreditCardValidatorExample
//
//  Created by Vitaliy Kuzmenko on 02/06/15.
//  Copyright (c) 2015 Kuzmenko Family. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet weak var cardNumberTextField: UITextField!
    
    @IBOutlet weak var cardValidationLabel: UILabel!
    
    @IBOutlet weak var cardTypeLabel: UILabel!

    var creditCardValidator: CreditCardValidator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialise Credit Card Validator
        creditCardValidator = CreditCardValidator()
    }

    @IBAction func cardNumberDidChange(sender: UITextField) {
        if let number = sender.text {
            if number.isEmpty {
                self.cardValidationLabel.text = "Enter card number"
                self.cardValidationLabel.textColor = UIColor.black
                
                self.cardTypeLabel.text = "Enter card number"
                self.cardTypeLabel.textColor = UIColor.black
            } else {
                validateCardNumber(number: number)
                detectCardNumberType(number: number)
            }
        }
    }
    
    /**
    Credit card validation
    
    - parameter number: credit card number
    */
    func validateCardNumber(number: String) {
        if creditCardValidator.validate(string: number) {
            self.cardValidationLabel.text = "Card number is valid"
            self.cardValidationLabel.textColor = UIColor.green
        } else {
            self.cardValidationLabel.text = "Card number is invalid"
            self.cardValidationLabel.textColor = UIColor.red
        }
    }

    /**
    Credit card type detection
    
    - parameter number: credit card number
    */
    func detectCardNumberType(number: String) {
        if let type = creditCardValidator.type(from: number) {
            self.cardTypeLabel.text = type.name
            self.cardTypeLabel.textColor = UIColor.green
        } else {
            self.cardTypeLabel.text = "Undefined"
            self.cardTypeLabel.textColor = UIColor.red
        }
    }
    
}


//
//  CreditCardValidatorExampleTests.swift
//  CreditCardValidatorExampleTests
//
//  Created by Vitaliy Kuzmenko on 02/06/15.
//  Copyright (c) 2015 Kuzmenko Family. All rights reserved.
//

import UIKit
import XCTest

@testable import CreditCardValidatorExample

class CreditCardValidatorExampleTests: XCTestCase {
	
	var creditCardValidator : CreditCardValidator!
	
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
		self.creditCardValidator = CreditCardValidator()
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
	
	func testUnionPayDebit() {
		let number = "6222023602899998371"
		creditCardValidator.validateString(number)
		guard let type = creditCardValidator.typeFromString(number) else { XCTFail("CC Type not valid on unionpay debit"); return}
		
		XCTAssertEqual(type.name, "UnionPay")
	}
	
	func testUnionPayCredit(){
		let number = "5309900599078555"
		creditCardValidator.validateString(number)
		guard let type = creditCardValidator.typeFromString(number) else { XCTFail("CC Type not valid on unionpay credit"); return}
		
		XCTAssertEqual(type.name, "UnionPay")
	}
	
	func testMaestroCardNL(){
		let number = "6731012345678906"
		creditCardValidator.validateString(number)
		guard let type = creditCardValidator.typeFromString(number) else { XCTFail("CC Type not valid on maestro NL"); return }
		
		XCTAssertEqual(type.name, "Maestro")
	}
	
	func testMaestroCardUK(){
		let number = "6759649826438453"
		creditCardValidator.validateString(number)
		guard let type = creditCardValidator.typeFromString(number) else { XCTFail("CC Type not valid on maestro UK"); return }
		
		XCTAssertEqual(type.name, "Maestro")
	}
	
	func testJCB(){
		let number = "3530111333300000"
		creditCardValidator.validateString(number)
		guard let type = creditCardValidator.typeFromString(number) else { XCTFail("CC Type not valid on JCB"); return }
		
		XCTAssertEqual(type.name, "JCB")
	}
	
	func testVisaCredit(){
		let number = "4646464646464644"
		creditCardValidator.validateString(number)
		guard let type = creditCardValidator.typeFromString(number) else { XCTFail("CC Type not valid on VISA credit"); return }
		
		XCTAssertEqual(type.name, "Visa")
	}
	
	func testVisaDebit(){
		let number = "4400000000000008"
		creditCardValidator.validateString(number)
		guard let type = creditCardValidator.typeFromString(number) else { XCTFail("CC Type not valid on VISA debit"); return }
		
		XCTAssertEqual(type.name, "Visa")
	}
	
	func testMasterCard(){
		let number = "5280934283171080"
		creditCardValidator.validateString(number)
		guard let type = creditCardValidator.typeFromString(number) else { XCTFail("CC Type not valid on Mastercard"); return }
		
		XCTAssertEqual(type.name, "MasterCard")
	}
	
	func testDiscover(){
		let number = "6011894492395579"
		creditCardValidator.validateString(number)
		guard let type = creditCardValidator.typeFromString(number) else { XCTFail("CC Type not valid on Discover"); return }
		
		XCTAssertEqual(type.name, "Discover")
	}
	
	func testAmex(){
		let number = "377669501013152"
		creditCardValidator.validateString(number)
		guard let type = creditCardValidator.typeFromString(number) else { XCTFail("CC Type not valid on Amex"); return }
		
		XCTAssertEqual(type.name, "Amex")
	}
	
	func testDinersClub(){
		let number = "30569309025904"
		creditCardValidator.validateString(number)
		guard let type = creditCardValidator.typeFromString(number) else { XCTFail("CC Type not valid on Diner's club"); return }
		
		XCTAssertEqual(type.name, "Diners Club")
	}
}


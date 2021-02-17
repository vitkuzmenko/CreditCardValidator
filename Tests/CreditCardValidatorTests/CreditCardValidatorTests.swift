import XCTest
@testable import CreditCardValidator

final class CreditCardValidatorTests: XCTestCase {
    
    /// Card numbers provided from
    /// https://www.paypalobjects.com/en_GB/vhelp/paypalmanager_help/credit_card_numbers.htm
    /// https://docs.adyen.com/development-resources/test-cards/test-card-numbers
    //// https://www.kobzarev.com/other/testoviye-nomera-kreditnyh-kart/
    func testValidData() {
        let values: [(CreditCardType, String)] = [
            (.amex, "3782 8224 6310 005"),
            (.amex, "3714 4963 5398 431"),
            (.amex, "3787 3449 3671 000"),
            (.visa, "4111 1111 1111 1111"),
            (.visa, "4012 8888 8888 1881"),
            (.visa, "4222 2222 2222 2"),
            (.masterCard, "5500 0000 0000 0004"),
            (.masterCard, "5555 5555 5555 4444"),
            (.masterCard, "5105 1051 0510 5100"),
            (.masterCard, "2222 4107 4036 0010"),
            (.maestro, "6771 7980 2100 0008"),
            (.dinersClub, "30569309025904"),
            (.jcb, "3569 9900 1009 5841"),
            (.discover, "6011 0000 0000 0004"),
            (.unionPay, "6250 9470 0000 0014"),
            (.mir, "2200 0000 0000 0004"),
            (.mir, "2200 0000 0000 0012"),
            (.mir, "2200 0000 0000 0020"),
            (.mir, "2200 0000 0000 0046"),
        ]
        values.forEach { (item) in
            print(item.0)
            XCTAssertTrue(CreditCardValidator(item.1).isValid)
            XCTAssertEqual(item.0, CreditCardValidator(item.1).type)
            XCTAssertTrue(CreditCardValidator(item.1).isValid(for: item.0))
        }
    }
    
    func testInvalidData() {
        let values: [(CreditCardType, String)] = [
            (.amex, "3782 8224 6310 006"),
            (.amex, "3714 4963 5398 432"),
            (.amex, "3787 3449 3671 001"),
            (.visa, "4111 1111 1111 1112"),
            (.visa, "4012 8888 8888 1882"),
            (.visa, "4222 2222 2222 3"),
            (.masterCard, "5500 0000 0000 0005"),
            (.masterCard, "5555 5555 5555 4445"),
            (.masterCard, "5105 1051 0510 5101"),
            (.masterCard, "2222 4107 4036 0011"),
            (.maestro, "6771 7980 2100 0009"),
            (.dinersClub, "30569309025905"),
            (.jcb, "3569 9900 1009 5842"),
            (.discover, "6011 0000 0000 0005"),
            (.unionPay, "6250 9470 0000 0015"),
            (.mir, "2200 0000 0000 0005"),
            (.mir, "2200 0000 0000 0013"),
            (.mir, "2200 0000 0000 0021"),
            (.mir, "2200 0000 0000 0047"),
        ]
        values.forEach { (item) in
            print(item.0)
            XCTAssertFalse(CreditCardValidator(item.1).isValid)
            XCTAssertEqual(item.0, CreditCardValidator(item.1).type)
            XCTAssertFalse(CreditCardValidator(item.1).isValid(for: item.0))
        }
    }

    static var allTests = [
        ("testValidData", testValidData),
        ("testInvalidData", testValidData),
    ]
}

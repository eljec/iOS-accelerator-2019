//
//  BankApiTests.swift
//  BankApiTests
//
//  Created by VICTOR ABEL CABEZA on 31/01/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//

import XCTest
@testable import BankApi

class BankApiTests: XCTestCase {

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBankAccountService() {
        
        BankAccountService.addAccount(userName: "userTest")
        let bankAccount:BankAccount? = BankAccountService.getAccount(userName: "userTest")
        
        XCTAssert(
            bankAccount!.getUserName() == "userTest")
        
        XCTAssert(
            bankAccount!.getAccountNumber() != 0)
        
        XCTAssert(
            bankAccount!.balance() == 0.0)

        bankAccount!.updateAccount(BankAccountMovement(amount: 20, date: Date()))
        bankAccount!.updateAccount(BankAccountMovement(amount: -60, date: Date()))

        bankAccount!.updateAccount(BankAccountMovement(amount: 80, date: Date()))

        XCTAssert(bankAccount!.balance() == 40.0)

        XCTAssertEqual(bankAccount!.movementList(asc: true).count, 3)
        
    }

}

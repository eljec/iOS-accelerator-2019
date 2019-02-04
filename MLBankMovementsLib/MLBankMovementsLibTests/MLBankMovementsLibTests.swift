//
//  MLBankMovementsLibTests.swift
//  MLBankMovementsLibTests
//
//  Created by Marcio Mortarino on 31/01/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

import XCTest
@testable import MLBankMovementsLib

class MLBankMovementsLibTests: XCTestCase {

    var account = [Account]()
    var accountActions = MLBankMovements()
    
    override func setUp() {
        account[0].value = 10
        account[0].accountOwner = "Yo"
        account[0].accountBalance = 10
        
    }

    override func tearDown() {
        account = []
    }

    func testGetBalance() {
        let balanceExpected = 100
        XCTAssertEqual(MLBankMovements.getBalance(accounts: account), balanceExpected)
    }

    func testGetAccount() {
        XCTAssertNotEqual(MLBankMovements.getAccount(), [])
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

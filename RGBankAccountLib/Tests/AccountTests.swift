//
//  Tests.swift
//  Tests
//
//  Created by Roman Guarino on 04/02/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

import XCTest
@testable import RGBankAccountLib

class Tests: XCTestCase {
    
    let account = RGBankAccount()
    
    override func setUp() {
        let _ = account.clearAccount()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetAccount() {
        let account = RGBankAccount()
        XCTAssertNotNil(account)
    }
    
    func testMovementAccount() {
        var actualBalance = account.getAccountBalance()
        var newMovementValue: Float = 100.0
        let _ = account.doMovementAccount(value: newMovementValue)
        XCTAssertEqual(account.getAccountBalance(), (actualBalance + newMovementValue), "Fallo al realizar un movimiento positivo")
        actualBalance = account.getAccountBalance()
        newMovementValue = newMovementValue * (-1)
        let _ = account.doMovementAccount(value: newMovementValue)
        XCTAssertEqual(account.getAccountBalance(), (actualBalance + newMovementValue), "Fallo al realizar un movimiento negativo")
    }
    
    func testClearAccount() {
        let _ = account.clearAccount()
        XCTAssertEqual(account.getAccountBalance(), 0, "Fallo al limpiar el balance de la cuenta")
        XCTAssertEqual(account.getAccount().movement.count, 0, "Fallo al limpiar los movimientos de la cuenta")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

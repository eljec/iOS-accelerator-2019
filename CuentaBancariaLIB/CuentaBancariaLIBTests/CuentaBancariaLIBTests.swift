//
//  CuentaBancariaLIBTests.swift
//  CuentaBancariaLIBTests
//
//  Created by Pedro Eduardo Waquim on 01/02/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

import XCTest
@testable import CuentaBancariaLIB

class CuentaBancariaLIBTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: CBAccount.KEY_BALANCE)
        UserDefaults.standard.removeObject(forKey: CBAccount.KEY_TRANSACTION)
        UserDefaults.standard.removeObject(forKey: CBAccount.KEY_COLOR_ERROR)
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEmptyBalance(){
        XCTAssertEqual(0, CBAccount.showBalance())
    }
    
    func testEmptyShowTransaction(){
        let transaction = CBAccount.showTransactions()
        XCTAssertEqual(0, transaction.count)
    }
    
    func testPlusTransaction(){
        let transactionPlus = CBTransaction(amount: 200)
        
        CBAccount.add(transaccion: transactionPlus)
        
        XCTAssertEqual(200, CBAccount.showBalance())
        
        let transactions = CBAccount.showTransactions()
        XCTAssertEqual(1, transactions.count)
        XCTAssertEqual(200, transactions[0].amount)
    }
    
    func testMinusTransaction(){
        let transactionMinus = CBTransaction(amount: -300)
        
        CBAccount.add(transaccion: transactionMinus)
        
        XCTAssertEqual(-300, CBAccount.showBalance())
        
        let transactions = CBAccount.showTransactions()
        XCTAssertEqual(1, transactions.count)
        XCTAssertEqual(-300, transactions[0].amount)
    }
    
    func testMultipleTransaction(){
        let transactionPlus = CBTransaction(amount: 200)
        let transactionMinus = CBTransaction(amount: -300)
        
        CBAccount.add(transaccion: transactionPlus)
        CBAccount.add(transaccion: transactionMinus)
        
        XCTAssertEqual(-100, CBAccount.showBalance())
        
        let transactions = CBAccount.showTransactions()
        XCTAssertEqual(2, transactions.count)
        XCTAssertEqual(200, transactions[0].amount)
        XCTAssertEqual(-300, transactions[1].amount)
    }
    
    func testBlackColor(){
        CBAccount.chooseErrorColor(color: CBErrorColor.BLACK)
        let color = CBAccount.wichColorError()
        
        XCTAssertEqual(UIColor(red: 0, green: 0, blue: 0, alpha: 1), color)
    }
    
    func testRedColor(){
        CBAccount.chooseErrorColor(color: CBErrorColor.RED)
        let color = CBAccount.wichColorError()
        
        XCTAssertEqual(UIColor(red: 1.0, green: 0, blue: 0, alpha: 1), color)
    }
    
    func testEmptyUserDefault(){
        let decode = UserDefaults.standard.object(forKey: CBAccount.KEY_TRANSACTION)
        
        XCTAssertNil(decode)
    }
    
    func testColorNil(){
        let color = CBAccount.wichColorError()
        XCTAssertEqual(UIColor(red: 1.0, green: 0, blue: 0, alpha: 1), color)
    }
    
}

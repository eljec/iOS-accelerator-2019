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

    var account: [Account] = []
    var userDefaults = UserDefaults.standard
    
    override func setUp() {
        account = []
        userDefaults.removeObject(forKey: "accounts")
    }

    func testAccount() {
        XCTAssertEqual(account.count, 0)
    }
    
    func testGetBalance() {
        let expected = 10
        var encodeData = Data()

        // Test account without movements
        XCTAssertEqual(MLBankMovements.getBalance(accounts: account), 0)
        
        account.append(Account(value: 10, accountOwner: "Yo", accountBalance: 10))
        encodeData = try! NSKeyedArchiver.archivedData(withRootObject: account, requiringSecureCoding: false)
        userDefaults.set(encodeData, forKey: "accounts")
        userDefaults.synchronize()
        
        // Test account with movements
        XCTAssertEqual(MLBankMovements.getBalance(accounts: account), expected)
        XCTAssertEqual(account.count, 1)
    }

    func testGetAccount() {
        var acc = MLBankMovements.getAccount()
        var encodeData = Data()
        
        // Test account without movements
        XCTAssertEqual(acc, [])
        
        acc.append(Account(value: 10, accountOwner: "Yo", accountBalance: 10))
        encodeData = try! NSKeyedArchiver.archivedData(withRootObject: acc, requiringSecureCoding: false)
        userDefaults.set(encodeData, forKey: "accounts")
        userDefaults.synchronize()
        
        // Test account with movements
        XCTAssertNotEqual(acc, [])
        XCTAssertEqual(acc.count, 1)
        XCTAssertEqual(acc[0].value, 10)
        XCTAssertEqual(acc[0].accountBalance, 10)
        XCTAssertEqual(acc[0].accountOwner, "Yo")
    }
    
    func testRemoveObjectsFromUserDefaults() {
        MLBankMovements.delete()
        XCTAssertNil(userDefaults.object(forKey: "accounts") as? Data)
    }
    
    func testSaveMovementInAccount() {
        var acc = MLBankMovements.saveMovementInAccount(value: 20, accountOwner: "oY")
        
        XCTAssertEqual(acc[0].value, 20)
        XCTAssertEqual(acc[0].accountBalance, 20)
        XCTAssertEqual(acc[0].accountOwner, "oY")
    }
    
    func testSaveOnUserDefaults() {
        var acc = MLBankMovements.getAccount()
        acc.append(Account(value: 40, accountOwner: "atr", accountBalance: 20))
        MLBankMovements.save(accounts: acc)
        let accountsData  = userDefaults.object(forKey: "accounts") as? Data
        let accLast = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(accountsData!) as! [Account]
        
        XCTAssertEqual(accLast[0].value, 40)
        XCTAssertEqual(accLast[0].accountBalance, 20)
        XCTAssertEqual(accLast[0].accountOwner, "atr")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

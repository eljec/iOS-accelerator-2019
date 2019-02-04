//
//  MLBankMovements.swift
//  MLBankMovementsLib
//
//  Created by Marcio Mortarino on 31/01/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

import UIKit

@objc public class Account: NSObject, NSCoding {
    
    @objc public var value: Int
    @objc public var accountOwner: String
    @objc public var accountBalance: Int
    
    
    @objc public init(value: Int, accountOwner: String, accountBalance: Int) {
        self.value = value
        self.accountOwner = accountOwner
        self.accountBalance = accountBalance
        
    }
    
    @objc public required convenience init(coder aDecoder: NSCoder) {
        let value = aDecoder.decodeInteger(forKey: "value")
        let accountOwner = aDecoder.decodeObject(forKey: "accountOwner") as! String
        let accountBalance = aDecoder.decodeInteger(forKey: "accountBalance")
        self.init(value: value, accountOwner: accountOwner, accountBalance: accountBalance)
    }
    
    @objc public func encode(with aCoder: NSCoder) {
        aCoder.encode(value, forKey: "value")
        aCoder.encode(accountOwner, forKey: "accountOwner")
        aCoder.encode(accountBalance, forKey: "accountBalance")
    }
}

@objc public class MLBankMovements: NSObject {
    
    @objc public static func startAccount(accountOwner: String) -> [Account] {
        let userDefaults = UserDefaults.standard
        var accounts: [Account] = []
        let accountsData  = userDefaults.object(forKey: "accounts") as? Data ?? nil
        if (accountsData == nil) {
            accounts.append(Account(value: 0, accountOwner: accountOwner, accountBalance: 0))
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: accounts)
            userDefaults.set(encodedData, forKey: "accounts")
            userDefaults.synchronize()
        } else {
            accounts = NSKeyedUnarchiver.unarchiveObject(with: accountsData!) as! [Account]
        }
        return accounts
    }

    @objc public static func loadValues(accounts: [Account]) -> Int {
         return accounts[accounts.count - 1].accountBalance
    }
    
    @objc public func balanceCount(accounts: [Account]) -> Int {
        return accounts.count
    }
    
    @objc public func loadAccountOwnerFromArray(accounts: [Account]) -> [Account] {
        return accounts
    }
    
    @objc public static func save(value: Int, accountOwner: String) -> [Account] {
        let userDefaults = UserDefaults.standard
        var accounts = startAccount(accountOwner: accountOwner)
        accounts.append(Account(value: value, accountOwner: accountOwner, accountBalance: value + accounts[accounts.count - 1].accountBalance))
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: accounts)
        userDefaults.set(encodedData, forKey: "accounts")
        userDefaults.synchronize()
        return accounts
    }
    
    @objc public static func delete() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "accounts")
    }
}

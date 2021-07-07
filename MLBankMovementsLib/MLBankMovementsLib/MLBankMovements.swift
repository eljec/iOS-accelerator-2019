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
    
    static let userDefaults = UserDefaults.standard
    
    static func save(accounts: [Account]) {
        var encodeData = Data()
        if #available(iOS 11.0, *) {
            encodeData = try! NSKeyedArchiver.archivedData(withRootObject: accounts, requiringSecureCoding: false)
            userDefaults.set(encodeData, forKey: "accounts")
            userDefaults.synchronize()
        }
    }
    
    @objc public static func getAccount() -> [Account] {
        var accounts: [Account] = []
        
        let accountsData  = userDefaults.object(forKey: "accounts") as? Data ?? nil
        if (accountsData == nil) {
            save(accounts: accounts)
        } else {
            accounts = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(accountsData!) as! [Account]
        }
        return accounts
    }

    @objc public static func getBalance(accounts: [Account]) -> Int {
        var balance = 0;
        if accounts.count != 0 {
            balance = accounts.last!.accountBalance
        }
        return balance
    }
    
    @objc public static func saveMovementInAccount(value: Int, accountOwner: String) -> [Account] {
        var accounts = getAccount()
        print(accounts)
        accounts.append(Account(value: value, accountOwner: accountOwner, accountBalance: value + getBalance(accounts: accounts)))
        save(accounts: accounts)
        return accounts
    }
    
    @objc public static func delete() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "accounts")
    }
}

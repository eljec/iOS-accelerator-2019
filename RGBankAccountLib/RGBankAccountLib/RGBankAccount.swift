//
//  RGBankAccountLib.swift
//  RGBankAccountLib
//
//  Created by Roman Guarino on 01/02/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//
import Foundation

@objc public class RGBankAccount : NSObject {
    
    @objc public func doMovementAccount(value: Float) -> RGAccount? {
        let userDefaults = UserDefaults.standard
        var account: RGAccount? = RGAccount(balance: 0.0, movement: [])
        if let decoded = userDefaults.object(forKey: "account") as? Data {
            account = getAccountPersistence(dataDecoded: decoded)
        }
        
        if(account != nil) {
            account!.balance = account!.balance + value
            let movement = RGMovement(value: value, date: Date())
            account!.movement.append(movement)
            
            let _ = setAccountPersistence(account: account!)
            return account!
        } else {
            return nil
        }
    }
    
    @objc public func clearAccount() -> Bool {
        let account: RGAccount = RGAccount(balance: 0.0, movement: [])
        return self.setAccountPersistence(account: account)
    }
    
    @objc public func getAccount() -> RGAccount {
        let userDefaults = UserDefaults.standard
        let emptyAccount = RGAccount(balance: 0.0, movement: [])
        if let decoded = userDefaults.object(forKey: "account") as? Data {
            let account = getAccountPersistence(dataDecoded: decoded)
            if(account != nil) {
                return account!
            } else {
                return emptyAccount
            }
        } else {
            return emptyAccount
        }
    }
    
    @objc public func getAccountBalance() -> Float {
        let userDefaults = UserDefaults.standard
        let emptyBalance: Float = 0.00
        if let decoded = userDefaults.object(forKey: "account") as? Data {
            let account = getAccountPersistence(dataDecoded: decoded)
            if(account != nil) {
                return account!.balance
            } else {
                return emptyBalance
            }
        } else {
            return emptyBalance
        }
    }
    
    @objc private func setAccountPersistence(account: RGAccount) -> Bool {
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: account)
        userDefaults.set(encodedData, forKey: "account")
        userDefaults.synchronize()
        return true
    }
    
    @objc private func getAccountPersistence(dataDecoded: Data) -> RGAccount? {
        return NSKeyedUnarchiver.unarchiveObject(with: dataDecoded) as? RGAccount
    }
}

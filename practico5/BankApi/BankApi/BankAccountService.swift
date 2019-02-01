//
//  BankAccountService.swift
//  BankApi
//
//  Created by VICTOR ABEL CABEZA on 01/02/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//

import Foundation


@objc public class BankAccountService: NSObject{

    private static var accounts:[BankAccount] = []
    
    @objc public static func getAccount(userName:String) -> BankAccount? {
        for account in accounts{
            if account.userName == userName {
                return account
            }
        }
        return nil
    }
    
    @objc public static func getAccount(accountNumber:Int) -> BankAccount? {
        for account in accounts{
            if account.accountNumber == accountNumber {
                return account
                
            }
        }
        return nil
    }
    
    @objc public static func addAccount(userName:String) {
        let bankAccount:BankAccount = BankAccount(userName: userName, accountNumber: Int.random(in: 0 ..< 10000));
        accounts.append(bankAccount)
    }
}

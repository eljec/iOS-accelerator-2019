//
//  CBCuenta.swift
//  Pods
//
//  Created by Pedro Eduardo Waquim on 01/02/2019.
//

import Foundation
import UIKit

@objc public class CBAccount: NSObject {
    
    // KEYS
    public static let KEY_TRANSACTION = "com.mercadolibre.cuentabancaria.transactions"
    public static let KEY_BALANCE = "com.mercadolibre.cuentabancaria.balance"
    public static let KEY_COLOR_ERROR = "com.mercadolibre.cuentabancaria.errorcolor"
    
    @objc public class func showBalance() -> Double {
        return UserDefaults.standard.double(forKey: CBAccount.KEY_BALANCE)
    }
    
    // METHODS
    @objc public class func showTransactions() -> [CBTransaction]{
        let decoded = UserDefaults.standard.object(forKey: CBAccount.KEY_TRANSACTION)
        var arrayMovs:[CBTransaction] = []
        
        if decoded != nil {
            arrayMovs = NSKeyedUnarchiver.unarchiveObject(with: decoded as! Data) as! [CBTransaction]
        }
        
        
        return arrayMovs
    }
    
    /// Add a transaction to the account
    ///
    /// - Parameter transaccion: Transaction to add
    @objc public class func add(transaccion:CBTransaction){
        let balance =  showBalance() + transaccion.amount
        
        // Obtengo los movimientos
        var arrayMovs = showTransactions()
        
        // Updateo los movimientos
        arrayMovs.append(transaccion)
        
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: arrayMovs)
        
        // Persisto los movimientos
        UserDefaults.standard.set(encodedData, forKey:CBAccount.KEY_TRANSACTION)
        
        // Persisto el saldo
        UserDefaults.standard.set(balance, forKey:CBAccount.KEY_BALANCE)
        
    }
   
    
    @objc public class func wichColorError() -> UIColor{
        let decoded = UserDefaults.standard.object(forKey: CBAccount.KEY_COLOR_ERROR)
        
        
        var color = CBErrorColor(rawValue: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))!.rawValue
        
        if (decoded != nil){
            color = NSKeyedUnarchiver.unarchiveObject(with: decoded as! Data) as! UIColor
        }
        
        return color;
    }
    
    @objc public class func chooseErrorColor(color: CBErrorColor){
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: color.rawValue)
        UserDefaults.standard.set(encodedData, forKey: KEY_COLOR_ERROR)
    }
}

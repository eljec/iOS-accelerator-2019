//
//  CBCuenta.swift
//  Pods
//
//  Created by Pedro Eduardo Waquim on 01/02/2019.
//

import Foundation
import UIKit

@objc public class CBCuenta: NSObject {
    
    // KEYS
    public static let KEY_MOVS = "com.mercadolibre.cuentabancaria.movs"
    public static let KEY_BALANCE = "com.mercadolibre.cuentabancaria.balance"
    public static let KEY_COLOR_ERROR = "com.mercadolibre.cuentabancaria.errorcolor"
    
    @objc public class func showBalance() -> Double {
        return UserDefaults.standard.double(forKey: CBCuenta.KEY_BALANCE)
    }
    
    // METHODS
    @objc public class func add(transaccion:CBTransaction){
        let balance =  showBalance() + transaccion.amount
        
        // Obtengo los movimientos
        let decoded = UserDefaults.standard.object(forKey: CBCuenta.KEY_MOVS)
        
        var arrayMovs:[CBTransaction] = []
       
        if decoded != nil {
            arrayMovs = NSKeyedUnarchiver.unarchiveObject(with: decoded as! Data) as! [CBTransaction]
        }
        
        // Updateo los movimientos
        arrayMovs.append(transaccion)
        
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: arrayMovs)
        
        // Persisto los movimientos
        UserDefaults.standard.set(encodedData, forKey:CBCuenta.KEY_MOVS)
        
        // Persisto el saldo
        UserDefaults.standard.set(balance, forKey:CBCuenta.KEY_BALANCE)
        
    }
    
    @objc public class func wichColorError() -> UIColor{
        let decoded = UserDefaults.standard.object(forKey: CBCuenta.KEY_COLOR_ERROR) as! Data
        let color = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! UIColor
        return color;
    }
    
    @objc public class func chooseErrorColor(color: CBErrorColor){
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: color.rawValue)
        UserDefaults.standard.set(encodedData, forKey: KEY_COLOR_ERROR)
    }
}

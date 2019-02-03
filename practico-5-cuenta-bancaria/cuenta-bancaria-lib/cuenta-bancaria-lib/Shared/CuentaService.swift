//
//  CuentaService.swift
//  cuenta-bancaria-lib
//
//  Created by Gonzalo Alexis Quarin on 01/02/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

import Foundation

@available(iOS 11.0, *)
@objc public class CuentaService: NSObject {
    
    static var _cuentaKey = "cuenta"
    
    @objc public static func getCuenta() -> Cuenta{
        var cuenta = Cuenta()
        
        if (UserDefaults.standard.object(forKey: _cuentaKey<) != nil) {
            let resultadoCrearCuenta = save(cuenta: cuenta)
            print("\(resultadoCrearCuenta)")
        }
        
        let decoded: Any? = UserDefaults.standard.object(forKey: _cuentaKey)

        do{
            
            cuenta = try NSKeyedUnarchiver.unarchivedObject(ofClass: Cuenta.self, from: decoded as! Data) ?? cuenta
            print("\(cuenta)")

            
        }catch let error {
            print("Se produjo un error al obtener los datos en User Defaults: Error -> \(error)")
        }
        
        return cuenta
    }
    
    @objc public static func save(cuenta: Cuenta) -> Bool{
        
        do {
            
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: cuenta, requiringSecureCoding: true)

            UserDefaults.standard.set(encodedData, forKey: _cuentaKey)
            UserDefaults.standard.synchronize()
            
            return true
            
        } catch let error{
            print("Se produjo un error al guardar los datos en User Defaults: Error -> \(error)")
        }

        return false
    }
    
}

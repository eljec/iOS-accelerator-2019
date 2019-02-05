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
    static var _movimientoskey = "movimientos"
    
    @objc public static func getCuenta() -> Cuenta{
        var cuenta = Cuenta()
            
        if (UserDefaults.standard.object(forKey: _cuentaKey) == nil) {
            let resultado = save(cuenta: cuenta)
            if(!resultado){
                print("Ocurrió un error al inicializar la cuenta")
            }
        }
        
        let decoded: Any? = UserDefaults.standard.object(forKey: _cuentaKey)
        
        do{
            cuenta = try NSKeyedUnarchiver.unarchivedObject(ofClass: Cuenta.self, from: decoded as! Data) ?? cuenta
        
            cuenta.movimientos = getMovimientos()
            print("\(cuenta)")
            
        }catch let error {
            print("Se produjo un error al obtener los CUENTA en User Defaults: Error -> \(error)")
        }
        
        return cuenta
    }
    
    fileprivate static func saveUserData(_ encodedData: Data, key: String) {
        UserDefaults.standard.set(encodedData, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    @objc public static func save(cuenta: Cuenta) -> Bool{
        var resultado = false
        
        do {
            
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: cuenta, requiringSecureCoding: true)
            
            resultado = saveMovimiento(movimiento: cuenta.movimientos)
            
            if(resultado){
                saveUserData(encodedData, key: _cuentaKey)
            }
            
            return resultado
            
        } catch let error{
            print("Se produjo un error al guardar la CUENTA en User Defaults: Error -> \(error)")
        }

        return false
    }
    
    @objc public static func getMovimientos() -> [Movimiento]{
        var movimientos = [Movimiento]()
        
        
        if (UserDefaults.standard.object(forKey: _movimientoskey) == nil) {
            let resultadoMovimientos = saveMovimiento(movimiento: movimientos)
            print("\(resultadoMovimientos)")
        }
        
        let decoded: Any? = UserDefaults.standard.object(forKey: _movimientoskey)
        
        do{
            
            movimientos =  try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded as! Data) as? [Movimiento] ?? movimientos
            
            print("\(movimientos)")
            
            
        }catch let error {
            print("Se produjo un error al obtener los MOVIMIENTOS en User Defaults: Error -> \(error)")
        }
        
        return movimientos
    }
    
    @objc static func saveMovimiento(movimiento: [Movimiento]) -> Bool{
        
        do {
            
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: movimiento, requiringSecureCoding: true)
            
            saveUserData(encodedData, key: _movimientoskey)
            
            return true
            
        } catch let error{
            print("Se produjo un error al guardar los MOVIMIENTOS en User Defaults: Error -> \(error)")
        }
        
        return false
    }
    
    public static func removeKeys(){
        UserDefaults.standard.removeObject(forKey: _cuentaKey)
        UserDefaults.standard.removeObject(forKey: _movimientoskey)
    }
    
}

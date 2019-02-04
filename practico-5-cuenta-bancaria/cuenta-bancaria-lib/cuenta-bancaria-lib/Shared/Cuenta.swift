//
//  Cuenta.swift
//  cuenta-bancaria-lib
//
//  Created by Gonzalo Alexis Quarin on 31/01/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

import UIKit

@objc public class Cuenta: NSObject, NSCoding, NSSecureCoding {
    public static var supportsSecureCoding: Bool = true
    
    @objc public var nombre: String = ""
    @objc public var saldo: Float = 0
    @objc public var movimientos : [Movimiento] = [Movimiento]()
    
    convenience init(nombre: String, saldo: Float, movimientos: [Movimiento]){
        self.init()
        self.nombre = nombre
        self.saldo = saldo
        self.movimientos = movimientos
    }
    
    convenience required public init?(coder aDecoder: NSCoder) {
        let nombre = aDecoder.decodeObject(forKey: "nombre") as! String
        let saldo = aDecoder.decodeFloat(forKey: "saldo")
        
        self.init(nombre: nombre, saldo: saldo, movimientos: [])
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(nombre, forKey: "nombre")
        aCoder.encode(saldo, forKey: "saldo")
    }
    
    @objc public func addMovimiento(importe: Float){
        
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: Date()) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MMM-yyyy"
      
        let movimiento = Movimiento(importe: importe, fecha: formatter.string(from: yourDate!))
        movimientos.append(movimiento)
        saldo += movimiento.importe
    }
    
    @objc public func saldoString() -> String {
        return String(format: "%.2f", saldo)
    }
    
}

@objc public class Movimiento : NSObject, NSCoding, NSSecureCoding{
    public static var supportsSecureCoding: Bool = true
    
    @objc public var importe : Float = 0
    @objc public var fecha : String = ""
    
    @objc public init(importe: Float, fecha: String){
        self.importe = importe
        self.fecha = fecha
        
        super.init()

    }
    
    convenience required public init?(coder aDecoder: NSCoder) {
        let importe = aDecoder.decodeFloat(forKey: "importe")
        let fecha = aDecoder.decodeObject(forKey: "fecha") as! String
        
        self.init(importe: importe, fecha: fecha)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(importe, forKey: "importe")
        aCoder.encode(fecha, forKey: "fecha")
    }
    
    @objc public func importeString() -> String{
        return String(format: "%.2f", importe)
    }
    
}

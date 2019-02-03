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
    
    convenience init(nombre: String, saldo: Float){
        self.init()
        self.nombre = nombre
        self.saldo = saldo
    }
    
    required convenience public init?(coder aDecoder: NSCoder) {
        let nombre = aDecoder.decodeObject(forKey: "nombre") as! String
        let saldo = aDecoder.decodeFloat(forKey: "saldo")
        
        self.init(nombre: nombre, saldo: saldo)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(nombre, forKey: "nombre")
        aCoder.encode(saldo, forKey: "saldo")
    }
    
}

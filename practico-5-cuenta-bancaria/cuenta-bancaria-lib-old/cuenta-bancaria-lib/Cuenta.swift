//
//  Cuenta.swift
//  cuenta-bancaria-lib
//
//  Created by Gonzalo Alexis Quarin on 31/01/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

import UIKit

class Cuenta: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var nombre: String = ""
    var saldo: Float = 0
    
    convenience init(nombre: String, saldo: Float){
        self.init()
        self.nombre = nombre
        self.saldo = saldo
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
         let nombre = aDecoder.decodeObject(forKey: "nombre") as! String
         let saldo = aDecoder.decodeFloat(forKey: "saldo")
        
         self.init(nombre: nombre, saldo: saldo)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nombre, forKey: "nombre")
        aCoder.encode(saldo, forKey: "saldo")
    }
    
    
    
}

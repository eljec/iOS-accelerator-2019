//
//  ViewController.swift
//  cuenta-bancaria-lib
//
//  Created by Gonzalo Alexis Quarin on 31/01/2019.
//  Copyright © 2019 Accelerator-Meli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let cuenta = CuentaService.getCuenta()
        cuenta.nombre = "Default"
        cuenta.saldo = 150.0
        cuenta.addMovimiento(importe: 100.0)
        
        let resultado = CuentaService.save(cuenta: cuenta)
        
        print("Resultado: \(resultado), \(cuenta), \(cuenta.movimientos.count)")
        
    }
    
    
}


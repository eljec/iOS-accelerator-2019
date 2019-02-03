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
        
        let cuenta = Cuenta(nombre: "Default", saldo: 150.0)
        let userDefaults = UserDefaults.standard
        
        do {
            
            if #available(iOS 11.0, *) {
                let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: cuenta, requiringSecureCoding: true)
                userDefaults.set(encodedData, forKey: "cuenta")
                userDefaults.synchronize()
            } else {
                // Fallback on earlier versions
            }
        
            
            
        } catch let error{
            print("Se produjo un error al guardar los datos en User Defaults: Error -> \(error)")
        }
        
        
        let decoded  = userDefaults.object(forKey: "cuenta") as! Data
        do{
            if #available(iOS 11.0, *) {
                let decodedData: Cuenta = try NSKeyedUnarchiver.unarchivedObject(ofClass: Cuenta.self, from: decoded)!
                print("\(decodedData)")
            } else {
                // Fallback on earlier versions
            }
            
            

        }catch let error {
            print("Se produjo un error al obtener los datos en User Defaults: Error -> \(error)")
        }
        
        
    }


}


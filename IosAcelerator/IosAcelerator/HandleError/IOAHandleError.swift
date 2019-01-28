//
//  IOAHandleError.swift
//  IosAcelerator
//
//  Created by Pedro Eduardo Waquim on 25/01/2019.
//  Copyright © 2019 Pedro Eduardo Waquim. All rights reserved.
//

import UIKit

class IOAHandleError: NSObject {
    func handleError(error: Error, controller: UIViewController){
        let alert =  UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in })
        
        alert.addAction(action)
        
        controller.present(alert, animated: true, completion: {})
    }
}

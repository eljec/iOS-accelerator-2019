//
//  IOAAlert.swift
//  IosAcelerator
//
//  Created by Pedro Eduardo Waquim on 31/01/2019.
//  Copyright © 2019 Pedro Eduardo Waquim. All rights reserved.
//

import UIKit
import ProgressHUD

class IOAAlert: NSObject {
    static func showError(){
        ProgressHUD.showError("Something went wrong.")
    }
    static func showBuy(){
        ProgressHUD.showSuccess("Gracias por su compra")
    }
}

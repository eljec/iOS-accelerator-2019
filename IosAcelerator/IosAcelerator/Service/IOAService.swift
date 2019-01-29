//
//  IOAService.swift
//  IosAcelerator
//
//  Created by Pedro Eduardo Waquim on 25/01/2019.
//  Copyright © 2019 Pedro Eduardo Waquim. All rights reserved.
//

import UIKit

class IOAService: NSObject {
    func fetchUrl(strUrl: String, onSuccess:@escaping (Data?, URLResponse?) -> Void, onError:@escaping (Error?) -> Void){
        
        // Creo la Url
        guard let url = URL(string: strUrl) else {
            onError(nil)
            return
        }
        
        // Control de Errores
        let closure : (Data?, URLResponse?, Error?) -> Void = {
            (data, response, error) in
            if let error = error {
                onError(error)
            } else {
                onSuccess(data, response)
            }
        }
        
        // Creo el pedido
        let task = URLSession.shared.dataTask(with: url, completionHandler: closure)
        
        // Lanzo el pedido
        task.resume()
    }
    
    
    func fetchImageFromUrl(urlString:String, closure:@escaping (UIImage?)->Void){
        
        DispatchQueue.global(qos: .userInitiated).async {
            let urlNil = URL(string: urlString)
            guard let url = urlNil else {
                return
            }
            
            do {
                let data = try Data.init(contentsOf: url)
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    closure(image)
                }
            } catch {
                print("Fallo la carga de la imagen")
            }
            
        }
    }
}

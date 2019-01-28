//
//  MAOInitialService.swift
//  MyAppOneSwift
//
//  Created by Marcio Mortarino on 25/01/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//


import Foundation

func requestForUserDataWith(from partOfUrl: String, completionHandlerSucess: @escaping (_ result: jsonModel) -> Void, completionHandlerError: @escaping (_ error: Error) -> Void){
    let url = URL(string: String("https://itunes.apple.com/search?term=" + partOfUrl))!
    let urlRequest = URLRequest(url: url)
    let urlConfig = URLSessionConfiguration.default
    let session = URLSession(configuration: urlConfig)
    let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
        DispatchQueue.main.async {
            do {
                guard let response = try? JSONDecoder().decode(jsonModel.self, from: data!) else {
                    completionHandlerError(error!)
                    return
                }
                completionHandlerSucess(response)
            }
        }
    }
    dataTask.resume()
}

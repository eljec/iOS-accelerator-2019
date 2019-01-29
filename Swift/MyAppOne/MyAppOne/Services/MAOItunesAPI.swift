//
//  MAOItunesAPI.swift
//  MyAppOne
//
//  Created by Mayco Martin Barale on 25/01/2019.
//  Copyright © 2019 Mayco Martin Barale. All rights reserved.
//

import Foundation

class MAOItunesApi {
    
    func getResults(urlQuery: String, completionHandler: @escaping (Data) -> () ) -> Void {
        
        let url = URL(string: urlQuery)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                    error == nil
                else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
            }
            do {
                // data we are getting from network request
                completionHandler(data!)
            } catch { print(error) }
        }
        task.resume()
//        return response
    }
}

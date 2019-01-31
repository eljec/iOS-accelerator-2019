//
//  MARequestService.swift
//  MyAppOneSwift
//
//  Created by Roman Guarino on 25/01/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

import Foundation

class MARequestService {
    
    static func fetchData(url: String, success: @escaping (Data?) -> (), fail: @escaping (Error) -> ()) {
        let defaultSession = URLSession(configuration: .default)
        var dataTask: URLSessionDataTask
        if let urlComponents = URLComponents(string: url) {
            guard let url = urlComponents.url else { return }
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        fail(error)
                    } else {
                        success(data)
                    }
                }
            }
            dataTask.resume()
        }
    }
}

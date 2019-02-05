import Foundation

class MLServicesHelper {
    
    static func get(url: String, callback: @escaping (Data) -> ()) {
        
        guard let urlObject = URL(string: url) else{
            print("Error al crear el objeto URL")
            return
        }
        
        var request = URLRequest(url: urlObject)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async() {
                callback(data!)
            }
        })
        
        task.resume()
    }
    
    static func downloadImage(from url: URL, callback: @escaping (Data) -> ()) {
        print("Download Started")
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            
            DispatchQueue.main.async() {
                callback(data)
            }
        }
    }
    
    static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}

import Foundation

class MLServicesHelper {

    func get(url: String, callback: @escaping (Data, Int) -> ()) {
        
        guard let urlObject = URL(string: url) else{
            print("Error al crear el objeto URL")
            return
        }
        
        var request = URLRequest(url: urlObject)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            //TODO: Agregar manejo de errores
            callback(data!, 1)
        })
        
        task.resume()
    }
}

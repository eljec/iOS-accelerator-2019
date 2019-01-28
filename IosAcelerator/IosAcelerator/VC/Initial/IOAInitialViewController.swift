//
//  ViewController.swift
//  IosAcelerator
//
//  Created by Pedro Eduardo Waquim on 25/01/2019.
//  Copyright © 2019 Pedro Eduardo Waquim. All rights reserved.
//

import UIKit

struct Sort {
    static let track = 0
    static let releaseDate = 1
}

class IOAInitialViewController: UIViewController {
    
    @IBOutlet weak var orderChooser: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var orderRevertSwitch: UISwitch!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    private var selectedSortAlg: Int = 0
    private let baseUrl = "https://itunes.apple.com/search?term="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderRevertSwitch.setOn(false, animated: false)
        indicatorView.hidesWhenStopped = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onClickSelection(_ sender: UIButton) {
        // Lanzar Animacion
        indicatorView.startAnimating()
       
        // Formatear lo introducido
        var url = baseUrl + (self.searchTextField.text ?? "")
        url = String.formattedURLParams(params: url)
        
        
        // Obtengo si hay que invertir o no
        let switchIsOn = self.orderRevertSwitch.isOn
        // Evitar Retaining circles
        weak var weakSelf = self
        // Success Completion
        let onSuccess: (Data?, URLResponse?) -> Void = {
            (data, response) in
            
            // Chequeo los datos
            guard let data = data else { return }
            
            // Decodifico y Chequeo que se haga correctamente
            guard let model = try? JSONDecoder().decode(IOAModel.self, from: data) else {
                print("Error: Couldn't decode data into IOAModel")
                // Actualizo el estado en la UI
                OperationQueue.main.addOperation({
                    weakSelf?.indicatorView.stopAnimating()
                })
                return
            }
            
            // Obtener el algoritmo de ordenamiento deseado
            let sortedAlg: Int = weakSelf?.selectedSortAlg ?? 0
            // Obtener los datos
            var results: [Track] = model.results
            
            // Ordenar
            switch (sortedAlg) {
            case Sort.track:
                results = weakSelf?.ordenarPorTrack(array: results) ?? []
                break;
            case Sort.releaseDate:
                results = weakSelf?.ordenarPorFecha(array: results) ?? []
                break;
            default:
                break;
            }
            
            // Revertir si hace falta
            if switchIsOn {
                results = weakSelf?.ordenarInvertido(array: results) ?? []
            }
            
            // Actualizo la UI
            OperationQueue.main.addOperation({
                // Stop Indicator
                weakSelf?.indicatorView.stopAnimating()
                
                // Create Table Controller
                let tableViewController = IOATableViewController(model: results)
                
                weakSelf?.navigationController?.pushViewController(tableViewController, animated: true)
            })
        }
        
        // Error completion
        let onError: (Error?) -> Void = {
            error in
            let handlerError = IOAHandleError()
            handlerError.handleError(error: error!, controller: self)
        }
        
        let service = IOAService()
        service.fetchUrl(strUrl: url, onSuccess: onSuccess, onError: onError)
    }
    
    
    @IBAction func changeSearchOption(_ sender: UISegmentedControl) {
        selectedSortAlg = sender.selectedSegmentIndex
    }
    
    // MARK: Ordenamientos
    func ordenarPorTrack(array:[Track]) -> [Track] {
        var arrayToSort = array
        arrayToSort.sort(by: {
            (obj1, obj2) in
            let track1 = obj1 as Track
            let track2 = obj2 as Track
            return track1.trackName ?? "" < track2.trackName ?? ""
        })
        
        return arrayToSort
    }
    
    func ordenarPorFecha(array:[Track]) -> [Track] {
        var arrayToSort = array
        arrayToSort.sort(by: {
            (obj1, obj2) in
            let track1 = obj1 as Track
            let track2 = obj2 as Track
            
            let release1 = String.formattedDate(dateString: track1.releaseDate)
            let release2 = String.formattedDate(dateString: track2.releaseDate)
            
            
            guard let date1 = release1, let date2 = release2 else {
                return false
            }
            
            return date1 < date2
        })
        
        return arrayToSort
    }
    
    func ordenarInvertido(array:[Track]) -> [Track] {
        let reversedArray = array.reversed()
        return Array(reversedArray)
    }
    
}


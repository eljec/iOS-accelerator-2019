//
//  MAOInitialViewController.swift
//  MyAppOneSwift
//
//  Created by Marcio Mortarino on 25/01/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

import UIKit
import NetworkPod
import ProgressHUD

class MAOInitialViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var pickerData = [String?]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = ["Cargar datos ordenados asc", "Cargar datos ordenados desc",
                      "Cargar datos por fecha", "Cargar datos ordenados por ID"]
        pickerView.delegate = self
        pickerView.dataSource = self
        stopAndHiddenActivityIndicator()
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
 
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let service: NetworkPod = NetworkPod()
        var url: String = "https://itunes.apple.com/search?term="
        let strWithOutSpaces = (self.searchBar.text?.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: ""))!
        url.append(contentsOf: strWithOutSpaces)
        self.startAndShowActivityIndicator()
        let tableView = MAOCustomTableViewController(nibName: "MAOCustomTableViewController", bundle: nil)
        service.request(forUserData: { (data) in
            self.stopAndHiddenActivityIndicator()
            DispatchQueue.main.async {
                do {
                    guard let response = try? JSONDecoder().decode(jsonModel.self, from: data) else {
                        return
                    }
                    tableView.arrayItems = self.sortedArray(array: response.results, order: self.pickerData[row]!)
                    self.navigationController?.pushViewController(tableView, animated: true)
                }
            }
        }, with: { (error) in
            self.stopAndHiddenActivityIndicator()
            ProgressHUD.showError("Oh! Something went wrong, please press again")
        }, partOfUrl: url)
    }
    
    func startAndShowActivityIndicator() {
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
    }

    func stopAndHiddenActivityIndicator() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
    
    func sortedArray(array: [dateFromJson], order: String) -> ([dateFromJson]){
        let copyArray = array
        var result: [dateFromJson]? = nil
        
        if order == pickerData[0] {
            result = copyArray.sorted { $0.trackName!.compare($1.trackName!, options: .numeric)  == .orderedAscending }
        } else if order == pickerData[1] {
            result = copyArray.sorted { $0.trackName!.compare($1.trackName!, options: .numeric)  == .orderedDescending }
        } else if order == pickerData[2] {
            result = copyArray.sorted { $0.releaseDate!.compare($1.releaseDate!, options: .numeric)  == .orderedDescending }
        } else {
            result = copyArray.sorted { (obj1, obj2) -> Bool in
                return obj1.trackId! <= obj2.trackId!
            }
        }
        return result!
    }
    
    
}

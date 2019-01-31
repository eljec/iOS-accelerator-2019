//
//  InitialViewController.swift
//  practico-3-iswifttunes
//
//  Created by Gonzalo Alexis Quarin on 28/01/2019.
//  Copyright © 2019 Gonzalo Alexis Quarin. All rights reserved.
//

import UIKit
import MELINetworking
import ProgressHUD

class InitialViewController: UIViewController {
    let URL_SEARCH = "https://itunes.apple.com/search?term="
    
    @IBOutlet weak var txtSearch: UITextField!
    
    @IBAction func cargarDatos(_ sender: Any) {
        if let term = txtSearch.text {
            
            let url = URL_SEARCH + term.replacingOccurrences(of: " ", with: "+")
            
            DispatchQueue.main.async {
                ProgressHUD.show("Cargando... ")
                MELINetworking.callRequest(self.loadTracks(), toUrl: url)
            }            
        }
    }
    
    func loadTracks() -> (Data?) -> Void{
        return { (response) in
            
            guard let response = try? JSONDecoder().decode(SearchResponse.self, from: (response ?? nil)!) else {
                print("Error: Couldn't decode data into response")
                return
            }
            
            let nav = UINavigationController(rootViewController: self)
            UIApplication.shared.keyWindow?.rootViewController = nav
            
            let listTableViewController = ListTableViewController()
            
            listTableViewController.tracks = response.results.sorted{ $0.trackName!.compare($1.trackName!, options: .numeric) == .orderedAscending }
            
            nav.pushViewController(listTableViewController, animated: true)
            ProgressHUD.dismiss()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let atr: MELINetworking = MELINetworking()
        print(atr.testPOD())
    }

}

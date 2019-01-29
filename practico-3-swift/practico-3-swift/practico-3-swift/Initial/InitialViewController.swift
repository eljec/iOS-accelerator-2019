//
//  InitialViewController.swift
//  practico-3-swift
//
//  Created by Gonzalo Alexis Quarin on 25/01/2019.
//  Copyright © 2019 Gonzalo Alexis Quarin. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    let _customViewCellReuseIdentifierCell = "DetailCustomViewCell"
    let _customViewCellNibName = "DetailViewlCellTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var tracks: [Track] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        registerTableViewCell()
        
        let services = MLServicesHelper()
        services.get(url: "https://itunes.apple.com/search?term=jack+johnson",
                     callback: prueba())
    }
    
    func registerTableViewCell() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: _customViewCellNibName, bundle: bundle)
        
        tableView.register(nib, forCellReuseIdentifier: _customViewCellReuseIdentifierCell)
    }
    
    func prueba() -> (Data, Int) -> Void{
        return { (response, otra) in
            guard let response = try? JSONDecoder().decode(Result.self, from: response) else {
                print("Error: Couldn't decode data into response")
                return
            }
            
            self.tracks = response.results
            
            print("\(response) - \(otra)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.tracks.count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: _customViewCellReuseIdentifierCell, for: indexPath)as! DetailViewCellTableViewCell
        
       
        let track = Track(_trackName: "prueba")
        cell.setupCell(_track: track)
        
        print("Se creó la celda correctamente con el nombre: \(track.trackName)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    


}

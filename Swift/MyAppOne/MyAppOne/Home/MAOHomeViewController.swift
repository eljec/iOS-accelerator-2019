//
//  MAOHomeViewController.swift
//  MyAppOne
//
//  Created by Mayco Martin Barale on 25/01/2019.
//  Copyright © 2019 Mayco Martin Barale. All rights reserved.
//

import UIKit

class MAOHomeViewController: UIViewController {
    
    let url = "https://itunes.apple.com/search?term=the+beatles"
    // get temp response
    let data = MAOItunesApi()

//    @IBOutlet weak var loadDataBtn: UIButton!
    
    
    
    @IBAction func loadDataBtn(_ sender: UIButton) {
        data.getResults(urlQuery: url, completionHandler: { (data) in
            guard let response = try? JSONDecoder().decode(Songs.self, from: data) else {
                print("Error: Couldn't decode data into response")
                return
            }
            
//            let songs = response.results
//            print(<#T##items: Any...##Any#>)
            
            DispatchQueue.main.async {
//                let listViewController = MAOListViewController(nibName: "MAOListViewController", bundle: nil)
                
                // call second view
                let listViewController = MAOListViewController()
    
                listViewController.tracks = response.results
                self.navigationController?.pushViewController(listViewController, animated: true)
                
            }

        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // hide navigation bar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        

        
        // Ejemplo de closure en variable
//        var aParameterAndReturn: (String) ->(String) =  { "\($0)" + ", hey there" }
        
//        data.getResults(urlQuery: url, completionHandler: { (data) in
//            guard let response = try? JSONDecoder().decode(Songs.self, from: data) else {
//                print("Error: Couldn't decode data into response")
//                return
//            }
//             print(response.results[0].trackName)
//        })
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

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
    let listViewController = MAOListViewController()    // Table View instance

    
    @IBOutlet weak var OrderByID: UIButton!
    
    @IBAction func orderByID(_ sender: UIButton) {
        data.getResults(urlQuery: url, completionHandler: { (data) in
            guard let response = try? JSONDecoder().decode(Songs.self, from: data) else {
                print("Error: Couldn't decode data into response")
                return
            }
            let sortedArray = response.results.sorted(by: { Int($0.trackId!) > Int($1.trackId!) })
            self.callListView(tracks: sortedArray)
        })
    }
    
    @IBAction func loadDataBtn(_ sender: UIButton) {
        data.getResults(urlQuery: url, completionHandler: { (data) in
            guard let response = try? JSONDecoder().decode(Songs.self, from: data) else {
                print("Error: Couldn't decode data into response")
                return
            }
            self.callListView(tracks: response.results)
        })
    }
    
    @IBAction func OrderByReleaseDate(_ sender: UIButton) {
        data.getResults(urlQuery: url, completionHandler: { (data) in
            guard let response = try? JSONDecoder().decode(Songs.self, from: data) else {
                print("Error: Couldn't decode data into response")
                return
            }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let sortedArray = response.results.sorted(by: { $0.releaseDate! < $1.releaseDate! })
            self.callListView(tracks: sortedArray)
        })
    }
    
    @IBAction func OrderByReverse(_ sender: UIButton) {
        data.getResults(urlQuery: url, completionHandler: { (data) in
            guard let response = try? JSONDecoder().decode(Songs.self, from: data) else {
                print("Error: Couldn't decode data into response")
                return
            }
            var sortedArray = response.results
            sortedArray = sortedArray.reversed()
            self.callListView(tracks: sortedArray)
        })
    }
    
    // call second view
    func callListView(tracks: [Track]) -> Void {
        DispatchQueue.main.async {
            self.listViewController.tracks = tracks
            self.navigationController?.pushViewController(self.listViewController, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // hide navigation bar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
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

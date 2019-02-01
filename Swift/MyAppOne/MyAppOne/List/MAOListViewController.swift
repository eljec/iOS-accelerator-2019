//
//  MAOListViewController.swift
//  MyAppOne
//
//  Created by Mayco Martin Barale on 28/01/2019.
//  Copyright © 2019 Mayco Martin Barale. All rights reserved.
//

import UIKit

class MAOListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //    let songs : [Songs] = []
    var tracks = [Track]()
    @IBOutlet weak var tracksTableView: UITableView!
    
    // from protocol UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return songs.resultCount
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! trackTableViewCell   // casteamos
        cell.clean()
        // shorthand
        let _track = tracks[indexPath.row]
        cell.artistNameLabel.text = _track.artistName
        cell.trackNameLabel.text = _track.trackName
        cell.collectionNameLabel.text = _track.collectionName
        
        // load image
        DispatchQueue.global().async {
            if let url = _track.artworkUrl100 {
                if let urlObject = URL(string: url) {
                    if let data = try? Data(contentsOf: urlObject){
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                cell.albumImageUIImageView.image = image
                            }
                        }
                    }
                }
            }
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        //getting the index path of selected row
        let indexPath = tableView.indexPathForSelectedRow
        //getting the current cell from the index path
        let trackObject = tracks[(indexPath?.row)!]
        let detailView = DetailViewController(trackObject)
        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        // delegamos el datasource a el elemento mismo
        self.tracksTableView.dataSource = self
        self.tracksTableView.delegate = self
        self.tracksTableView.register(UINib(nibName: "trackTableViewCell", bundle: nil), forCellReuseIdentifier: "cellID")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // seteamos el reload data cada vez que la vista se muestra
//        self.tracksTableView.reloadData()
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

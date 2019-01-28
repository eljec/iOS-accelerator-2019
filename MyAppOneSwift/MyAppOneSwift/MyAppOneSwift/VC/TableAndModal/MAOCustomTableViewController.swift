//
//  MAOCustomTableViewController.swift
//  MyAppOneSwift
//
//  Created by Marcio Mortarino on 27/01/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

import UIKit

class MAOCustomTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var arrayItems = [dateFromJson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MAOCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CellID")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MAOCustomTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! MAOCustomTableViewCell
        cell.topLabelCell.text = arrayItems[indexPath.row].trackName
        cell.bottomLabelCell.text = arrayItems[indexPath.row].collectionName
        let url = URL(string: self.arrayItems[indexPath.row].artworkUrl100!)
        let session = URLSession(configuration: .default)
        let downloadPicTask = session.dataTask(with: url!) { (data, response, error) in
            DispatchQueue.main.async {
                cell.imageCell.image = UIImage(data: data!)
            }
        }
        downloadPicTask.resume()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172.5//UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modalView = MAOCustomModalViewController(nibName: "MAOCustomModalViewController", bundle: nil)
        modalView.arrayItemsModal = self.arrayItems[indexPath.row]
        modalView.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        modalView.modalTransitionStyle = UIModalTransitionStyle.crossDissolve;
        self.navigationController?.present(modalView, animated: true, completion: nil)
    }
}

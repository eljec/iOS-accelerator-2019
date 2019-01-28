//
//  PSSongListTableViewController.swift
//  PracticoSwift
//
//  Created by VICTOR ABEL CABEZA on 28/01/2019.
//  Copyright © 2019 Mercadolibre. All rights reserved.
//

import UIKit

class PSSongListTableViewController: UITableViewController {
    
    var songs: [PSSong]?
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PSSongTableViewCell", bundle: bundle)
        tableView.register(nib, forCellReuseIdentifier: "cellID")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.songs?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! PSSongTableViewCell
        cell.song = self.songs?[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

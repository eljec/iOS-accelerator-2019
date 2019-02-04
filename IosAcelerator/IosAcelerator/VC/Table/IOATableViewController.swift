//
//  IOATableViewController.swift
//  IosAcelerator
//
//  Created by Pedro Eduardo Waquim on 28/01/2019.
//  Copyright © 2019 Pedro Eduardo Waquim. All rights reserved.
//

import UIKit

class IOATableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var trackTableView: UITableView!
   
    private let tracks: [Track]
    private let CELL_ID = "cellID"
    
    init(model: [Track]){
        tracks = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.trackTableView.delegate = self
        self.trackTableView.dataSource = self
        self.trackTableView.register(UINib(nibName:"IOATableViewCell", bundle:nil), forCellReuseIdentifier: CELL_ID)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! IOATableViewCell
        cell.clear()
        cell.cargar(track: tracks[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 215
        return tableView.rowHeight
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modalVC = IOAModalViewController(track: tracks[indexPath.row])
        modalVC.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        modalVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(modalVC, animated: true, completion: {})
    }
    
}

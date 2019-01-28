//
//  MAOListViewController.swift
//  MyAppOneSwift
//
//  Created by Roman Guarino on 25/01/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

import UIKit

class MAOListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var resultTable: UITableView!
    private var arrayModels: Array<MAOListViewControllerModel> = []
    private let cellReuseIdentifier = "cellId"
    
    init(arrayModel: [MAOListViewControllerModel]){
        arrayModels = arrayModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTable.register(UINib(nibName: "MAOListTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        resultTable.delegate = self
        resultTable.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MAOListTableViewCell = self.resultTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! MAOListTableViewCell
    
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let data = arrayModels[indexPath.row]
        cell.setModel(model: data)
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = MAODetailViewController.init(model: arrayModels[indexPath.row])
        detailViewController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        detailViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(detailViewController, animated: true, completion: nil)
    }
}

//
//  PSSongListViewController.swift
//  PracticoSwift
//
//  Created by VICTOR ABEL CABEZA on 25/01/2019.
//  Copyright © 2019 Mercadolibre. All rights reserved.
//

import UIKit

class PSSongSearchViewController: UIViewController {

    @IBOutlet weak var songQueryText: UITextField!
    @IBOutlet weak var orderBySegment: UISegmentedControl!
    @IBOutlet weak var ascSwitch: UISwitch!
    @IBOutlet weak var spinnerIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinnerIndicator.hidesWhenStopped = true
    }

    @IBAction func searchButtonAction(_ sender: UIButton) {
        
        self.spinnerIndicator.startAnimating()
        
        let songService:PSSongService = PSItunesSongService()
        
        let completition = { (songs: [PSSong]) -> Void in
            
            DispatchQueue.main.async {
                self.initializeViewListWitSongs(songs:songs)
                self.spinnerIndicator.stopAnimating() 
            }
        }
        
        let errorCompletition = { (errorCause: NSError) -> Void in
            DispatchQueue.main.async {
                self.spinnerIndicator.stopAnimating()
                self.showToast(message: "Unexpected Error found. Code:\(errorCause.code)")
            }
        }
        
        let orderBy:OrderBy = OrderBy(rawValue: (self.orderBySegment?.selectedSegmentIndex)!)!
        
        songService.getSongsByQuery(query: self.songQueryText.text!, orderBy: orderBy, asc: self.ascSwitch.isOn,  completion: completition, errorCompletition:errorCompletition )
    }
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-500, width: 300, height: 64))
        toastLabel.backgroundColor = UIColor.red.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    /**
     Method to start the list view with model.
     
     @param songs List of Itunes songs
     */
    func initializeViewListWitSongs(songs: [PSSong]) {

        let psSongListViewController = PSSongListTableViewController()
        psSongListViewController.songs = songs
        self.navigationController?.pushViewController(psSongListViewController, animated: true)
    
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

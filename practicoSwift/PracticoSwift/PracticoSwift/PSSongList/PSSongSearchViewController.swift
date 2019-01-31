//
//  PSSongListViewController.swift
//  PracticoSwift
//
//  Created by VICTOR ABEL CABEZA on 25/01/2019.
//  Copyright © 2019 Mercadolibre. All rights reserved.
//

import UIKit
import PSSongApi
import ProgressHUD

class PSSongSearchViewController: UIViewController {

    @IBOutlet weak var songQueryText: UITextField!
    @IBOutlet weak var orderBySegment: UISegmentedControl!
    @IBOutlet weak var ascSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchButtonAction(_ sender: UIButton) {
        
        ProgressHUD.show("Please wait...")
        let songService:PSSongService = PSItunesSongService()
        
        let completition:SongCompletitionBlock = { (songs: [Any]?) -> Void in
            DispatchQueue.main.async {
                guard let songsArray:[PSSong] = songs as? [PSSong] else {
                    ProgressHUD.showError("Unexpected Error found.", interaction: true)
                    return
                }
                self.initializeViewListWitSongs(songs:songsArray)
            }
            ProgressHUD.dismiss()
        }
        
        let errorCompletition:SongErrorBlock = { (errorCause: Error?) -> Void in
            DispatchQueue.main.async {
                ProgressHUD.showError("Unexpected Error found. Code:\(errorCause?.localizedDescription ?? "")", interaction: true)
            }
        }
        
        let orderBy:PSSongOrderBy = getOrderBy()

        songService.getSongsByQuery(self.songQueryText.text!, andOrderBy: orderBy, andAsc: self.ascSwitch.isOn, andCompletition: completition, andError: errorCompletition)
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
    
    func getOrderBy() -> PSSongOrderBy{
        switch self.orderBySegment?.selectedSegmentIndex {
        case 0:
            return .trackName
        case 1:
            return .releaseDate
        case 2:
            return .trackId
        case .none:
            return .trackName
        case .some(_):
            return .trackName
        }
    }

}

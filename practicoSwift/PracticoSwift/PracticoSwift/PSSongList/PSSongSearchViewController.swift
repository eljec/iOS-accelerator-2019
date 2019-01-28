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
        
        songService.getSongsByQuery(query: self.songQueryText.text!, orderBy: getOrderBy(),  completion: completition)
    
        
        /*[[ItunesService instance] songsByQuery:weakSelf.songSarchText.text andCompletitionBlock:^(NSArray *songsArray, NSError *error) {
            if (!error) {
            [weakSelf initializeViewListWitSongs:[weakSelf orderArray:songsArray]];
            [weakSelf.spinner stopAnimating];
            }
            else
            {
            [weakSelf.spinner stopAnimating];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [weakSelf generalErrorToast: @"Error cargando canciones, consulte al alumno."];
            }];
            }
            }];*/
        
    }
    
    func getOrderBy() -> (PSSong, PSSong) -> Bool{

        let asc = self.ascSwitch.isOn
        var ret: ((PSSong, PSSong) -> Bool)
        
        switch self.orderBySegment.selectedSegmentIndex {
        case 0:
            if(asc){
                ret = { (s1: PSSong, s2: PSSong) -> Bool in
                    s1.trackName ?? "" < s2.trackName  ?? ""
                }
            } else {
                ret = { (s1: PSSong, s2: PSSong) -> Bool in
                    s1.trackName ?? "" > s2.trackName  ?? ""
                }
            }
        case 1:
            if(asc){
                ret = { (s1: PSSong, s2: PSSong) -> Bool in
                    s1.releaseDate! < s2.releaseDate!
                }
            } else {
                ret = { (s1: PSSong, s2: PSSong) -> Bool in
                    s1.releaseDate!  > s2.releaseDate!
                }
            }
        case 2:
            if(asc){
                ret = { (s1: PSSong, s2: PSSong) -> Bool in
                    s1.trackId ?? -1 < s2.trackId  ?? -1
                }
            } else {
                ret = { (s1: PSSong, s2: PSSong) -> Bool in
                    s1.trackId ?? -1 > s2.trackId  ?? -1
                }
            }
        default:
            if(asc){
                ret = { (s1: PSSong, s2: PSSong) -> Bool in
                    s1.trackName ?? "" > s2.trackName  ?? ""
                }
            } else {
                ret = { (s1: PSSong, s2: PSSong) -> Bool in
                    s1.trackName ?? "" < s2.trackName  ?? ""
                }
            }
        }
        return ret
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

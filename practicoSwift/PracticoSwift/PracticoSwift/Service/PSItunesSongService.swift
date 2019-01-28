//
//  ItunesSongService.swift
//  PracticoSwift
//
//  Created by VICTOR ABEL CABEZA on 25/01/2019.
//  Copyright © 2019 Mercadolibre. All rights reserved.
//

import Foundation

/**
 Itunes Service for songs queries
 */
class PSItunesSongService: PSSongService{
    let ITUNES_URL = "https://itunes.apple.com/search?term="
    
    /**
     Obtain the songs by query string.
     
     @param query the query string
     */
    func getSongsByQuery(query: String, orderBy: OrderBy, asc: Bool, completion: @escaping ([PSSong]) -> Void, errorCompletition: @escaping (_ errorCause:NSError) -> Void) {

        let escapedQuery = query.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)

        let url = URL(string: ITUNES_URL + escapedQuery!)!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            if(error == nil){
                do {
                    let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                    
                    var songArray: [PSSong] = []
                    
                    let songsJson:[AnyObject] = json["results"] as! [AnyObject]
                    
                    for songJson in songsJson {
                        if let song:PSSong = PSItunesSong(dictionary:songJson as! [String : AnyObject]){
                            songArray.append(song)
                        }
                    }
                    completion(songArray.sorted(by: self.getOrderBy(orderBy:orderBy, asc: asc)))
                } catch let error{
                    errorCompletition(error as NSError)
                }
            } else {
                errorCompletition(error! as NSError)
            }
        }
        task.resume()
    }
    
    /**
     Obtain the ordering method
     
     @param OrderBy enum
     @param Bool asc
     @return (PSSong, PSSong) -> Bool method to order
     */
    func getOrderBy(orderBy:OrderBy, asc:Bool) -> (PSSong, PSSong) -> Bool{
        
        var ret: ((PSSong, PSSong) -> Bool)
        switch orderBy {
        case .trackName:
            if(asc){
                ret = { (s1: PSSong, s2: PSSong) -> Bool in
                    s1.trackName ?? "" < s2.trackName  ?? ""
                }
            } else {
                ret = { (s1: PSSong, s2: PSSong) -> Bool in
                    s1.trackName ?? "" > s2.trackName  ?? ""
                }
            }
        case .releaseDate:
            if(asc){
                ret = { (s1: PSSong, s2: PSSong) -> Bool in
                    s1.releaseDate! < s2.releaseDate!
                }
            } else {
                ret = { (s1: PSSong, s2: PSSong) -> Bool in
                    s1.releaseDate!  > s2.releaseDate!
                }
            }
        case .trackId:
            if(asc){
                ret = { (s1: PSSong, s2: PSSong) -> Bool in
                    s1.trackId ?? -1 < s2.trackId  ?? -1
                }
            } else {
                ret = { (s1: PSSong, s2: PSSong) -> Bool in
                    s1.trackId ?? -1 > s2.trackId  ?? -1
                }
            }
        }
        return ret
    }
}

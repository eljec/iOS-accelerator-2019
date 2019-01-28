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
    func getSongsByQuery(query: String, orderBy: @escaping (PSSong, PSSong) -> Bool, completion: @escaping ([PSSong]) -> Void) {

        let escapedQuery = query.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)

        let url = URL(string: ITUNES_URL + escapedQuery!)!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                
                var songArray: [PSSong] = []
                
                let songsJson:[AnyObject] = json["results"] as! [AnyObject]
                
                for songJson in songsJson {
                    if let song:PSSong = PSItunesSong(dictionary:songJson as! [String : AnyObject]){
                        songArray.append(song)
                    }
                }
                completion(self.orderArray(songs: songArray, orderBy: orderBy))
            } catch {
                print("JSON Serialization error")
            }
            
        }
        task.resume()
    }
    
    private func orderArray(songs:[PSSong], orderBy: (PSSong, PSSong) -> Bool) -> [PSSong]{
        return songs.sorted(by: orderBy)
    }
    
}

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
class ItunesSongService: SongService{
    let ITUNES_URL = "https://itunes.apple.com/search?term="
    
    /**
     Obtain the songs by query string.
     
     @param query the query string
     */
    func getSongsByQuery(query: String, completion: @escaping ([Song]) -> Void) {

        let escapedQuery = query.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)

        let url = URL(string: ITUNES_URL + escapedQuery!)!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                
                var songArray: [Song] = []
                
                let songsJson:[AnyObject] = json["results"] as! [AnyObject]
                
                for songJson in songsJson {
                    if let song:Song = ItunesSong(dictionary:songJson as! [String : AnyObject]){
                        songArray.append(song)
                    }
                }
                completion(songArray)
            } catch {
                print("JSON Serialization error")
            }
            
        }
        task.resume()
    }
}

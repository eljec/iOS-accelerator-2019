//
//  SongService.swift
//  PracticoSwift
//
//  Created by VICTOR ABEL CABEZA on 25/01/2019.
//  Copyright © 2019 Mercadolibre. All rights reserved.
//

import Foundation


enum OrderBy: Int {
    case trackName = 0
    case releaseDate = 1
    case trackId = 2
}

/**
 Service protocol for songs queries
 */
protocol PSSongService {
    /**
     Obtain the songs by query string.
     
     @param request for a song call api
     @param completion for response call api
     */
    func getSongsByQuery(query: String, orderBy: OrderBy, asc: Bool, completion: @escaping ([PSSong]) -> Void, errorCompletition: @escaping (_ errorCause:NSError) -> Void)

}

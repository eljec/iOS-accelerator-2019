//
//  SongService.swift
//  PracticoSwift
//
//  Created by VICTOR ABEL CABEZA on 25/01/2019.
//  Copyright © 2019 Mercadolibre. All rights reserved.
//

import Foundation

/**
 Service protocol for songs queries
 */
protocol SongService {
    
    /**
     Obtain the songs by query string.
     
     @param request for a song call api
     @param completion for response call api
     */
    func getSongsByQuery(query: String, completion: @escaping (_ songs:[Song]) -> Void)

}

//
//  PracticoSwiftTests.swift
//  PracticoSwiftTests
//
//  Created by VICTOR ABEL CABEZA on 25/01/2019.
//  Copyright © 2019 Mercadolibre. All rights reserved.
//

import XCTest
import PSSongApi
@testable import PracticoSwift

class PracticoSwiftTests: XCTestCase {

    let itunesSongService: PSSongService = PSItunesSongService()
    
    override func setUp() {
    }

    override func tearDown() {
    }

    func testItunesGetSongsByQuery() {
        // given:
        let query = "soda stereo"
        let expectation = XCTestExpectation(description: "Should Return something")
        
        let completition = { (songs: [Any]?) -> Void in
            XCTAssertFalse(songs?.isEmpty ?? true)
            expectation.fulfill()
        }
        
        let errorCompletition = { (errorCause: Error?) -> Void in
            XCTAssertFalse(true, "Unexpected error")
            expectation.fulfill()
        }
        
        // while:
        
        itunesSongService.getSongsByQuery(query, andOrderBy: PSSongOrderBy.trackName, andAsc: true, andCompletition: completition, andError: errorCompletition)
        
        // then

        wait(for: [expectation], timeout: 5)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

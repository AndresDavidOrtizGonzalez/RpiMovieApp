//
//  TestRPIMovisStorage.swift
//  RpiMovieAppTests
//
//  Created by Andres Ortiz on 3/22/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import XCTest
@testable import RpiMovieApp
import OHHTTPStubs


class TestRPIMovisStorage: XCTestCase {

    var loader : RPIMovieLoader?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        loader = RPIMovieLoader.shared
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRPIMovieLoader() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
         let successExpectation = self.expectation(description: "success called")
        
        stub(condition: isHost("api.themoviedb.org")) { _ in
            // Stub it with our "wsresponse.json" stub file (which is in same bundle as self)
            let stubPath = OHPathForFile("wsresponse.json", type(of: self))
            return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
        }
        

        
        loader?.fetchMovies(kind: 1, page: 1, text: ""){
            (result: [Movie], success) in
            successExpectation.fulfill()
            XCTAssertEqual(20, result.count)
        }
        
        
        waitForExpectations(timeout: 10, handler: nil)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

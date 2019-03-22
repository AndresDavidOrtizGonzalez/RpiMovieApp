//
//  TestRPIMovisStorage.swift
//  RpiMovieAppTests
//
//  Created by Andres Ortiz on 3/22/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import XCTest
@testable import RpiMovieApp



class TestRPIMovisStorage: XCTestCase {

    var loader : RPIMovieLoader?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        loader = RPIMovieLoader.shared
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRPIMovieStorage() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        loader?.fetchMovies(kind: 1, page: 1, text: ""){
            (result: [Movie], success) in
            XCTAssertEqual(20, result.count)
        }
        
        loader?.fetchMovies(kind: 1, page: 2, text: ""){
            (result: [Movie], success) in
            XCTAssertEqual(40, result.count)
        }
        
        loader?.fetchMovies(kind: 1, page: 1, text: "Captain"){
            (result: [Movie], success) in
            XCTAssertNotNil(result)
        }
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

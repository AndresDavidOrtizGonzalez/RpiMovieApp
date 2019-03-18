//
//  RPISearch.swift
//  RpiMovieApp
//
//  Created by Andres Ortiz on 3/18/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import Foundation


struct Search: Decodable {
    var totalPages: Int64
    var results : [Movie]
    var totalResults: Int64
    var page: Int64
}

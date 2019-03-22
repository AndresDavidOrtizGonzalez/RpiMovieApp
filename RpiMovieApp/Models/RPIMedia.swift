//
//  RPIMedia.swift
//  RpiMovieApp
//
//  Created by Andres Ortiz on 3/20/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import Foundation

struct Media: Codable{
    var id : Int64
    var results: [Video]
}

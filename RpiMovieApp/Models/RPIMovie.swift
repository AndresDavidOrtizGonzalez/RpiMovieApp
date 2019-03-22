//
//  RPIMovie.swift
//  RpiMovieApp
//
//  Created by Andres Ortiz on 5/10/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import Foundation
import CoreLocation



struct Movie: Codable {
    var adult: Bool?
    var backdropPath : String?
    var genreIds: [Int64]?
    var id: Int64
    var originalLanguage : String?
    var originalTitle : String?
    var overview : String?
    var popularity: Double
    var posterPath: String?
    var releaseDate: String?
    var title: String
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int64?
}

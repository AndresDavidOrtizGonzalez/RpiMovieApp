//
//  RPIMovieLoader.swift
//  RpiMovieApp
//
//  Created by Andres Ortiz on 3/17/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import UIKit

class RPIMovieLoader {
    static let shared = RPIMovieLoader()
    init() {}
    
    var movie : Movie? = nil
    
    func fetchMovies(kind: Int, completion: @escaping (_ result: [Movie], _ success: Bool) -> Void) {

        //let defaults = UserDefaults.standard
        let isConnected = true //defaults.bool(forKey: "connected")
        
        if isConnected
        {
            var url = NSURL(string: "https://api.themoviedb.org/3/movie/popular?api_key=30f03a109d382c80fe5ef86868633ff7")
            
            switch kind {
            case 2:
                url = NSURL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=30f03a109d382c80fe5ef86868633ff7")
            case 3:
                url = NSURL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=30f03a109d382c80fe5ef86868633ff7")
            default:
                url = NSURL(string: "https://api.themoviedb.org/3/movie/popular?api_key=30f03a109d382c80fe5ef86868633ff7")
            }
            
            
            let request = URLRequest(url: url! as URL)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        print("error=\(error)")
                        return
                    }
                    
                    
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let search = try decoder.decode(Search.self, from: data!)
                        let movies = search.results
                        completion(movies, true)

                    }catch let jsonError {
                        print("Failed to decode ", jsonError)
                        completion([], false)
                    }
                }
                }.resume()
        }
        else
        {
            //aiLoader.isHidden = true
            //self.fetchFromDataBase(kind: kind)
        }
        
    }
    
}

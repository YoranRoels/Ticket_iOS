//
//  Search.swift
//  MyApp
//
//  Created by Yoran Roels on 23/12/2016.
//  Copyright © 2016 Yoran Roels. All rights reserved.
//

class Search {
    let movies:[[String:Any]]
    let totalResults:Int
    let response:Bool
    init(movies: [[String:Any]], totalResults: Int, response: Bool) {
        self.movies = movies
        self.totalResults = totalResults
        self.response = response
    }
}

/*extension Search {
    
    convenience init(jsonSearch: [String:Any]) throws {
        guard let movies = jsonSearch["Search"] as? [[String:Any]] else {
            throw Service.Error.missingJsonProperty(name: "Search")
        }
        guard let totalResults = jsonSearch["totalResults"] as? Int else {
            throw Service.Error.missingJsonProperty(name: "totalResults")
        }
        guard let response = jsonSearch["Response"] as? Bool else {
            throw Service.Error.missingJsonProperty(name: "Response")
        }
        
        self.init(movies: movies, totalResults: totalResults, response: response)
    }
}*/


//
//  Movie.swift
//  MyApp
//
//  Created by Yoran Roels on 06/12/2016.
//  Copyright © 2016 Yoran Roels. All rights reserved.
//

class Movie {
    let title:String
    let year:String
//    let rated:String
//    let released:String
//    let runtime:String
//    let genre:String
//    let director:String
//    let writer:String
//    let actors:String
//    let plot:String
//    let language:String
//    let country:String
//    let awards:String
    let poster:String
//    let metascore:String
//    let imdbRating:String
//    let imdbVotes:String
    let imdbID:String
    let type:String
//    let response:String
    
//    init(title: String, year:String, rated:String, released:String, runtime:String, genre:String, director:String, writer:String, actors:String, plot:String, language:String, country:String, awards:String, poster:String, metascore:String, imdbRating:String, imdbVotes:String, imdbID:String, type:String, response:String) {
    init(title: String, year:String, poster:String, imdbID: String, type:String) {
        self.title = title
        self.year = year
//        self.rated = rated
//        self.released = released
//        self.runtime = runtime
//        self.genre = genre
//        self.director = director
//        self.writer = writer
//        self.actors = actors
//        self.plot = plot
//        self.language = language
//        self.country = country
//        self.awards = awards
        self.poster = poster
//        self.metascore = metascore
//        self.imdbRating = imdbRating
//        self.imdbVotes = imdbVotes
        self.imdbID = imdbID
        self.type = type
//        self.response = response
    }
    
    /* VOORBEELD:
        {"Title":"X-Men: First Class",
        "Year":"2011",
        "imdbID":"tt1270798",
        "Type":"movie",
        "Poster":"https://images-na.ssl-images-amazon.com/images/M/MV5BMTg5OTMxNzk4Nl5BMl5BanBnXkFtZTcwOTk1MjAwNQ@@._V1_SX300.jpg"}
    */
}

/*extension Movie {
    
    convenience init(jsonMovie: [String: Any]) throws {
        guard let title = jsonMovie["Title"] as? String else {
            throw Service.Error.missingJsonProperty(name: "Title")
        }
        guard let year = jsonMovie["Year"] as? String else {
            throw Service.Error.missingJsonProperty(name: "Year")
        }
        guard let poster = jsonMovie["Poster"] as? String else {
            throw Service.Error.missingJsonProperty(name: "Poster")
        }
        guard let imdbID = jsonMovie["imdbID"] as? String else {
            throw Service.Error.missingJsonProperty(name: "imdbID")
        }
        guard let type = jsonMovie["Type"] as? String else {
            throw Service.Error.missingJsonProperty(name: "Type")
        }
        
        self.init(title: title,
                  year: year,
                  poster: poster,
                  imdbID: imdbID,
                  type: type)
    }
}*/

//
//  Review.swift
//  MyApp
//
//  Created by Yoran Roels on 21/01/2017.
//  Copyright © 2017 Yoran Roels. All rights reserved.
//

import Foundation

class Review {
    let mediaTitle: String
    let year: String
    let type: String
    let rating: Double
    
    init(mediaTitle: String, year:String, type:String, rating: Double)
    {
        self.mediaTitle = mediaTitle
        self.year = year
        self.type = type
        self.rating = rating
    }
}

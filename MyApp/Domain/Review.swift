//
//  Review.swift
//  MyApp
//
//  Created by Yoran Roels on 21/01/2017.
//  Copyright © 2017 Yoran Roels. All rights reserved.
//

import Foundation
import os.log

class Review: NSObject, NSCoding {
    let poster: String
    let mediaTitle: String
    let year: String
    let type: String
    let rating: Double
    
    // Persistence
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("reviews")
    
    init(poster: String, mediaTitle: String, year:String, type:String, rating: Double)
    {
        self.poster = poster
        self.mediaTitle = mediaTitle
        self.year = year
        self.type = type
        self.rating = rating
    }
    
    struct PropertyKey {
        static let poster = "poster"
        static let mediaTitle = "mediaTitle"
        static let year = "year"
        static let type = "type"
        static let rating = "rating"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(poster, forKey: PropertyKey.poster)
        aCoder.encode(mediaTitle, forKey: PropertyKey.mediaTitle)
        aCoder.encode(year, forKey: PropertyKey.year)
        aCoder.encode(type, forKey: PropertyKey.type)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // Poster is optional
        let poster = aDecoder.decodeObject(forKey: PropertyKey.poster) as? String
        
        // Title is required.
        guard let mediaTitle = aDecoder.decodeObject(forKey: PropertyKey.mediaTitle) as? String else {
            os_log("Unable to decode the title for a Review object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Year is required.
        guard let year = aDecoder.decodeObject(forKey: PropertyKey.year) as? String else {
            os_log("Unable to decode the year for a Review object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Type is required.
        guard let type = aDecoder.decodeObject(forKey: PropertyKey.type) as? String else {
            os_log("Unable to decode the type for a Review object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Rating is required.
        guard let rating = aDecoder.decodeDouble(forKey: PropertyKey.rating) as? Double else {
            os_log("Unable to decode the rating for a Review object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // initialize.
        self.init(poster: poster!, mediaTitle: mediaTitle, year: year, type: type, rating: rating)
        
    }
}

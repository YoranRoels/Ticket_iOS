//
//  ReviewModel.swift
//  MyApp
//
//  Created by Yoran Roels on 20/01/2017.
//  Copyright © 2017 Yoran Roels. All rights reserved.
//

import Foundation

class ReviewModel {
    var reviews: [Review] = []
    
    init(reviews: [Review])
    {
        self.reviews = reviews;
    }
    init(){}
}

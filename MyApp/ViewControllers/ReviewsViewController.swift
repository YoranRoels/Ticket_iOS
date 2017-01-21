//
//  ReviewsViewController.swift
//  MyApp
//
//  Created by Yoran Roels on 21/01/2017.
//  Copyright © 2017 Yoran Roels. All rights reserved.
//

//
//  ExploreViewController.swift
//  MyApp
//
//  Created by Yoran Roels on 21/01/2017.
//  Copyright © 2017 Yoran Roels. All rights reserved.
//

import UIKit

class ReviewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var reviews:[Review] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Setup delegates */
        tableView.delegate = self
        
        reviews = [Review(mediaTitle: "X-Men", year: "2003", type: "movie", rating: 4.0), Review(mediaTitle: "Breaking Bad", year: "2010-2013", type: "series", rating: 4.6), Review(mediaTitle:"Inception", year: "2010", type: "movie", rating: 3.8)]
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewMovieCell", for: indexPath as IndexPath) as! ReviewMovieCell
        cell.mediaTitle?.text = reviews[indexPath.row].mediaTitle
        cell.type?.text = reviews[indexPath.row].type
        cell.year?.text = reviews[indexPath.row].year
        let rating = reviews[indexPath.row].rating
        switch rating {
        case 0.0..<0.5:
            cell.rating?.text = "(\(rating))"
        case 0.5..<1.5:
            cell.rating?.text = "⭐️" + "(\(rating))"
        case 1.5..<2.5:
            cell.rating?.text = "⭐️⭐️" + "(\(rating))"
        case 2.5..<3.5:
            cell.rating?.text = "⭐️⭐️⭐️" + "(\(rating))"
        case 3.5..<4.5:
            cell.rating?.text = "⭐️⭐️⭐️⭐️" + "(\(rating))"
        case 4.5..<5.1:
            cell.rating?.text = "⭐️⭐️⭐️⭐️⭐️" + "(\(rating))"
        default:
            cell.rating?.text = "Rating not found"
        }
        return cell

    }
}


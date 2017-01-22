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
import os.log

class ReviewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var reviews: [Review] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Setup delegates */
        tableView.delegate = self
        tableView.dataSource = self
        
        /*reviews = [Review(poster: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTg5OTMxNzk4Nl5BMl5BanBnXkFtZTcwOTk1MjAwNQ@@._V1_SX300.jpg", mediaTitle: "X-Men", year: "2003", type: "Movie", rating: 2.4), Review(poster: "http://ia.media-imdb.com/images/M/MV5BMTcwMjExNTY3M15BMl5BanBnXkFtZTgwMjEzNzE4MDE@._V1_SX300.jpg", mediaTitle: "Dark Souls", year: "2011", type: "Game", rating: 4.3), Review(poster: "http://ia.media-imdb.com/images/M/MV5BOTEwNDZlNGQtNjVjOS00MWNkLWE0MjctMWIxYTRhODZiNzc2XkEyXkFqcGdeQXVyMjcyNzc1NTg@._V1_SX300.jpg", mediaTitle:"Dota 2", year: "2013", type: "Game", rating: 3.4), Review(poster: "http://ia.media-imdb.com/images/M/MV5BNTY4NjQxNDcxNl5BMl5BanBnXkFtZTgwMjEwMjE4MDE@._V1_SX300.jpg", mediaTitle:"The Legend of Zelda: Ocarina of Time", year: "1998", type: "Game", rating: 4.9)]*/
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if loadReviews() != nil {
            reviews = loadReviews()!
            self.tableView.reloadData()
        } else {
            print("loadReviews() is NIL")
        }
    }
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviews.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            reviews.remove(at: indexPath.row)
            self.tableView.reloadData()
            saveReviews()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewMovieCell", for: indexPath as IndexPath) as! ReviewMovieCell
        let posterURL = reviews[indexPath.row].poster
        let url = URL(string: reviews[indexPath.row].poster)
        if !(posterURL == "N/A")
        {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!) //make sure image exists
                DispatchQueue.main.async {
                    cell.poster.image = UIImage(data: data!)
                }
            }
        } else {
            cell.poster.image = #imageLiteral(resourceName: "noImage.png") // noImage.png
        }
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
    
    private func loadReviews() -> [Review]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Review.ArchiveURL.path) as? [Review]
    }
    
    private func saveReviews() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(reviews, toFile: Review.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Reviews saved locally.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save reviews locally!", log: OSLog.default, type: .error)
        }
    }
}


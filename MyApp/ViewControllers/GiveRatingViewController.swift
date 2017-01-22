//
//  GiveRatingViewController.swift
//  MyApp
//
//  Created by Yoran Roels on 20/01/2017.
//  Copyright © 2017 Yoran Roels. All rights reserved.
//

import UIKit
import os.log

class GiveRatingViewController: UITableViewController {
    
    var ratingDouble = 0.0
    
    var reviews: [Review] = []
    
    //var reviewModel: ReviewModel = ReviewModel()
    @IBAction func cancel(send: UIBarButtonItem) {
        self.performSegue(withIdentifier: "unwindToChooseMovie", sender: self)
    }
    
    @IBAction func addReview(sender: UIBarButtonItem) {
        if loadReviews() != nil {
        reviews = loadReviews()!
        }
        reviews.append(Review(poster: movie.poster, mediaTitle: movie.title, year: movie.year, type: movie.type, rating: ratingDouble))
        saveReviews()
        self.performSegue(withIdentifier: "unwindToChooseMovie", sender: self)
    }
    @IBOutlet weak var mediaTitle: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBAction func sliderValueChanged(sender: UISlider) {
        let currentValue = Double(round(sender.value*1000)/1000)
        
        rating.text  = String(format: "%.1f", (currentValue / 100) * 100)
        ratingDouble = Double(rating.text!)!
    }
    @IBOutlet weak var rating: UILabel!

    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        mediaTitle.text = movie.title
        type.text = movie.type
        year.text = movie.year
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

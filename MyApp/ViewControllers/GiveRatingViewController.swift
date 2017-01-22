//
//  GiveRatingViewController.swift
//  MyApp
//
//  Created by Yoran Roels on 20/01/2017.
//  Copyright © 2017 Yoran Roels. All rights reserved.
//

import UIKit

class GiveRatingViewController: UITableViewController {
    
    var ratingDouble = 0.0
    
    //var reviewModel: ReviewModel = ReviewModel()
    @IBAction func cancel(send: UIBarButtonItem) {
        self.performSegue(withIdentifier: "unwindToChooseMovie", sender: self)
    }
    
    @IBAction func addReview(sender: UIBarButtonItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let reviewModel = appDelegate.reviewModel
        reviewModel.reviews.append(Review(mediaTitle: movie.type, year: movie.year, type: movie.type, rating: ratingDouble))
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
        mediaTitle.text = movie.title
        type.text = movie.type
        year.text = movie.year
    }
    
    
}

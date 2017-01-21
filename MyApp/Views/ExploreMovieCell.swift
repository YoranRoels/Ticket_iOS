//
//  ExploreMovieCell.swift
//  MyApp
//
//  Created by Yoran Roels on 21/01/2017.
//  Copyright © 2017 Yoran Roels. All rights reserved.
//

import UIKit

class ExploreMovieCell: UITableViewCell {
   
    var delegate: ExploreMovieCellDelegate?
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBAction func imdbButtonTapped(_ sender: UIButton) {
        delegate?.imdbButtonTapped(cell: self)
    }
}
protocol ExploreMovieCellDelegate {
    func imdbButtonTapped(cell: ExploreMovieCell)
}



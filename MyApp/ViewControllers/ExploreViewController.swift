//
//  ExploreViewController.swift
//  MyApp
//
//  Created by Yoran Roels on 21/01/2017.
//  Copyright © 2017 Yoran Roels. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ExploreMovieCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies:[Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Setup delegates */
        tableView.delegate = self
        tableView.dataSource = self
        
        movies = [Movie(title: "X-Men", year: "2003", poster: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTg5OTMxNzk4Nl5BMl5BanBnXkFtZTcwOTk1MjAwNQ@@._V1_SX300.jpg", imdbID: "tt0120903", type: "movie"),Movie(title: "Breaking Bad", year: "2008-2013", poster: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ0ODYzODc0OV5BMl5BanBnXkFtZTgwMDk3OTcyMDE@._V1_SX300.jpg", imdbID: "tt0903747", type: "series"),Movie(title:"Inception", year: "2010", poster: "https://images-na.ssl-images-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg", imdbID: "tt1375666", type: "movie"), Movie(title:"Interstellar", year: "2014", poster: "https://images-na.ssl-images-amazon.com/images/M/MV5BMjIxNTU4MzY4MF5BMl5BanBnXkFtZTgwMzM4ODI3MjE@._V1_SX300.jpg", imdbID: "tt0816692", type: "movie")]
    
        self.tableView.reloadData()
    }
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "exploreMovieCell", for: indexPath) as! ExploreMovieCell;
        
        cell.delegate = self
        
        cell.nameLabel?.text = movies[indexPath.row].title
        cell.typeLabel?.text = movies[indexPath.row].type
        cell.yearLabel?.text = movies[indexPath.row].year
        let url = URL(string: movies[indexPath.row].poster)
            
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure image exists
            DispatchQueue.main.async {
            cell.poster.image = UIImage(data: data!)
            }
        }
        
        return cell;
    }
    
    //    private func showErrorView() {
    //        tableView.separatorStyle = .none
    //        errorView.isHidden = false
    //        tableView.reloadData()
    //
    //    }
    
    func imdbButtonTapped(cell: ExploreMovieCell) {
        let indexPath = self.tableView.indexPathForRow(at: cell.center)!
        let imdbID = movies[indexPath.row].imdbID
        if let url = NSURL(string: "http://www.imdb.com/title/"+imdbID+"/"){ UIApplication.shared.open(url as URL, options: [:], completionHandler: nil) }
        
        /* http://www.imdb.com/title/tt0120903/ */
    }
}


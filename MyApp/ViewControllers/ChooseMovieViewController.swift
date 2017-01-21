//
//  ChooseMovieViewController.swift
//  MyApp
//
//  Created by Yoran Roels on 20/12/2016.
//  Copyright © 2016 Yoran Roels. All rights reserved.
//

//
//  OverviewViewController.swift
//  NavigationController
//
//  Created by Yoran Roels on 09/11/2016.
//  Copyright © 2016 Yoran Roels. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit

class ChooseMovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let url = URL(string: "https://www.omdbapi.com/?s=")!
    private var currentTask: URLSessionTask?
    
    var movies:[Movie] = []
    
    //var reviewModel: ReviewModel = ReviewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Setup delegates */
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        //searchBar.barStyle = UIBarStyle.black
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
//        filtered = data.filter({ (text) -> Bool in
//            let tmp: NSString = text as NSString
//            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
//            return range.location != NSNotFound
//        })
        if(movies.count>=1)
        {
            movies.removeLast()
        }
        if(searchText.characters.count >= 2)
        {
            /*currentTask = Service.shared.loadDataTask(searchFilter: searchText) {
                result in
                switch result {
                case .success(let movies):
                    self.movies = movies
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                    //self.showErrorView()
                    self.tableView.reloadData()
                }
            }
            currentTask!.resume()*/
            
            searchForMovies(searchFilter: searchText)
 
            
            /*movies = [Movie(title: "X-Men", year: "2003", poster: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTg5OTMxNzk4Nl5BMl5BanBnXkFtZTcwOTk1MjAwNQ@@._V1_SX300.jpg", imdbID: "ABC123", type: "movie"),Movie(title: "Breaking Bad", year: "2010-2013", poster: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTg5OTMxNzk4Nl5BMl5BanBnXkFtZTcwOTk1MjAwNQ@@._V1_SX300.jpg", imdbID: "ABC124", type: "series"),Movie(title:"Inception", year: "2010", poster: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTg5OTMxNzk4Nl5BMl5BanBnXkFtZTcwOTk1MjAwNQ@@._V1_SX300.jpg", imdbID: "ABC125", type: "movie")] */
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "previewMovieCell", for: indexPath) as! PreviewMovieCell;
        cell.nameLabel?.text = movies[indexPath.row].title
        cell.typeLabel?.text = movies[indexPath.row].type
        cell.yearLabel?.text = movies[indexPath.row].year
        let posterURL = movies[indexPath.row].poster
        let url = URL(string: posterURL)
        
        if !(posterURL == "N/A")
        {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    cell.poster.image = UIImage(data: data!)
                }
            }
        } else {
            cell.poster.image = #imageLiteral(resourceName: "noImage.png") //noImage.png
        }
        return cell;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let giveRatingViewController = navigationController.topViewController as! GiveRatingViewController
        let selectedIndex = tableView.indexPathForSelectedRow!.row
        giveRatingViewController.movie = movies[selectedIndex]
        //giveRatingViewController.reviewModel = reviewModel
    }
    
//    private func showErrorView() {
//        tableView.separatorStyle = .none
//        errorView.isHidden = false
//        tableView.reloadData()
//        
//    }
    
    func searchForMovies(searchFilter: String)
    {
        var counter = 0
        
        let specialSearchFilter = String(searchFilter.characters.map {
            $0 == " " ? "+" : $0
        })
        
        let tempURL = URL(string:url.absoluteString+specialSearchFilter)!
        Alamofire.request(tempURL).responseJSON {
            response in
            var temporaryMovies: [Movie] = []
            if response.result.isSuccess {
                
                let resJson = JSON(response.result.value!)
                let search = resJson["Search"]
                for (_, searchElement) in search {
                    if counter == 5 {
                        break;
                    }
                    let title = searchElement["Title"].string!
                    let year = searchElement["Year"].string!
                    let imdbID = searchElement["imdbID"].string!
                    let type = searchElement["Type"].string!
                    let poster = searchElement["Poster"].string!
                    temporaryMovies.append(Movie.init(title: title, year: year, poster: poster, imdbID: imdbID, type: type))
                    counter=counter+1
                }
                self.movies = temporaryMovies
                self.tableView.reloadData()
            }
            if response.result.isFailure {
                print("failure")
            }
        }
    }
    
    @IBAction func unwindToChooseMovieTab(segue: UIStoryboardSegue) {}
}


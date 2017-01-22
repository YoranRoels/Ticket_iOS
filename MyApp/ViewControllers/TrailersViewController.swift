//
//  TrailersViewController.swift
//  MyApp
//
//  Created by Yoran Roels on 22/01/2017.
//  Copyright © 2017 Yoran Roels. All rights reserved.
//

import UIKit

class TrailersViewController: UIViewController {
    
    @IBOutlet weak var webView1: UIWebView!
    @IBOutlet weak var webView2: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadYoutubeVideo(id: "YoHD9XEInc0", webView: 1) // Inception Trailer
        loadYoutubeVideo(id: "zSWdZVtXT7E", webView: 2) // Interstellar Trailer
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadYoutubeVideo(id:String, webView:Int) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(id)")
        else {
            return
        }
        if webView == 1 {
            webView1.loadRequest(URLRequest(url: youtubeURL))
        } else { // else if in case of expansion
            webView2.loadRequest(URLRequest(url: youtubeURL))
        }
    }
}

//
//  CinemaViewController.swift
//  MyApp
//
//  Created by Yoran Roels on 22/01/2017.
//  Copyright © 2017 Yoran Roels. All rights reserved.
//

import UIKit
import MapKit

class CinemaViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    //51.018709, 4.111618 (Cinema Albert, Dendermonde)
    let initialLocation = CLLocation(latitude: 51.018709, longitude: 4.111618)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerMapOnLocation(location: initialLocation)
        
        let pinLocation = PinLocation(pinTitle: "Cinema Nearby",
                              locationName: "Cinema Albert",
                              discipline: "Cinema",
                              coordinate: CLLocationCoordinate2D(latitude: 51.018709, longitude: 4.111618))
        
        mapView.addAnnotation(pinLocation)
        
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

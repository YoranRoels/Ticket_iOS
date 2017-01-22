//
//  PinLocation.swift
//  MyApp
//
//  Created by Yoran Roels on 22/01/2017.
//  Copyright © 2017 Yoran Roels. All rights reserved.
//

import MapKit

class PinLocation: NSObject, MKAnnotation {
    let pinTitle: String
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(pinTitle: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.pinTitle = pinTitle
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
}

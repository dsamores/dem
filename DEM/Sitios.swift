//
//  Sitios.swift
//  DEM
//
//  Created by Macintosh on 10/7/16.
//  Copyright © 2016 Laboratorios Cantuña. All rights reserved.
//

import Foundation
import MapKit

class Sitios: NSObject, MKAnnotation {
    let center: String
    let location_Name: String
    let type: String
    let coordinate: CLLocationCoordinate2D
    
    init(center: String, location_Name: String, type: String, coordinate: CLLocationCoordinate2D) {
        self.center = center
        self.location_Name = location_Name
        self.type = type
        self.coordinate = coordinate
        super.init()
    }
    
}

//
//  MapView.swift
//  DEM
//
//  Created by Macintosh on 10/7/16.
//  Copyright © 2016 Laboratorios Cantuña. All rights reserved.
//

import Foundation
import MapKit

extension ViewControllerMap: MKMapViewDelegate {
    
    
    private func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if let annotation = annotation as? Sitios {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                let button = UIButton(type: UIButtonType.detailDisclosure)
                view.rightCalloutAccessoryView = button as UIView
            
            }
            return view
        
        }
        return nil
    }
}

//
//  ViewControllerMap.swift
//  DEM
//
//  Created by Macintosh on 10/7/16.
//  Copyright © 2016 Laboratorios Cantuña. All rights reserved.
//


import UIKit
import MapKit
class ViewControllerMap: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableCentros: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableCentros.dataSource = self
        
                let initialLocation = CLLocation(latitude: -0.1763008, longitude: -78.4794254)
        // set initial location in Quito
    
        centerMapOnLocation(location: initialLocation)
        // center view map in Quito
    mapView.delegate = self
        
        
    
    let sitios = Sitios(center: "Servipagos NNUU",
                          location_Name: "Centro Norte NNUU",
                          type: "Institucion Financiera",
                          coordinate: CLLocationCoordinate2D(latitude: -0.175585, longitude: -78.484453))
    
        
        let sitios1 = Sitios(center: "Sana Sana Shyris",
                            location_Name: "Centro Norte Shyris",
                            type: "Centro Autorizado",
                            coordinate: CLLocationCoordinate2D(latitude: -0.173685, longitude: -78.480379))
        let sitios2 = Sitios(center: "Banco del Pacifico",
                             location_Name: "Centro Norte NNUU y Shyris",
                             type: "Institucion Financiera",
                             coordinate: CLLocationCoordinate2D(latitude: -0.176108, longitude: -78.481716))
        
        let sitios3 = Sitios(center: "Banco Amazonas",
                             location_Name: "Centro Norte Amazonas",
                             type: "Institucion Financiera",
                             coordinate: CLLocationCoordinate2D(latitude: -0.172694, longitude: -78.485289))
        
        let sitios4 = Sitios(center: "Food Truck Amazonas",
                             location_Name: "Centro Norte NNUU y Amazonas",
                             type: "Establecimientos",
                             coordinate: CLLocationCoordinate2D(latitude: -0.192073, longitude: -78.488332))
        
        mapView.addAnnotation(sitios)
        mapView.addAnnotation(sitios1)
        mapView.addAnnotation(sitios2)
        mapView.addAnnotation(sitios3)
        mapView.addAnnotation(sitios4)
        
    
    }

    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
    var centros = ["Servipagos NNUU", "Sana Sana Shyris", "Banco del Pacifico", "Banco Amazonas"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        return self.centros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        let centrosName = self.centros[indexPath.row]
        cell.textLabel?.text = centrosName
        
        return cell
    }

}

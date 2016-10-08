//
//  ViewControllerVC.swift
//  DEM
//
//  Created by Jobsity on 10/8/16.
//  Copyright © 2016 Laboratorios Cantuña. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerVC: UIViewController, UITableViewDataSource {
    @IBOutlet weak var currentVC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    var VC = ["Tarjeta N. 5345 2456 1293", "Tarjeta N. 3452 2345 0098"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        return self.VC.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activevc", for: indexPath)
        
        let VCName = self.VC[indexPath.row]
        cell.textLabel?.text = VCName
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
}


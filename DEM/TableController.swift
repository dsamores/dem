//
//  TableController.swift
//  DEM
//
//  Created by Jobsity on 10/8/16.
//  Copyright © 2016 Laboratorios Cantuña. All rights reserved.
//

import Foundation
import UIKit

class TableController : UITableViewController {
    
    var centros = ["Servipagos NNUU", "Sana Sana Shyris", "Banco del Pacifico", "Banco Amazonas"]
    
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
            return centros.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Reuse Identifier", for: indexPath)
        
        let centrosName = centros[indexPath.row]
        cell.textLabel?.text = centrosName
        
        return cell
    }
}


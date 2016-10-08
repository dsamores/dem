//
//  ViewController.swift
//  DEM
//
//  Created by David Amores A. on 3/10/2016.
//  Copyright © 2016 Laboratorios Cantuña. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {
    
    @IBOutlet weak var labeCardNUm: UILabel!
    var cardInfo = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labeCardNUm.text = cardInfo[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


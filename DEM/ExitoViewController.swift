//
//  ViewController.swift
//  DEM
//
//  Created by David Amores A. on 3/10/2016.
//  Copyright © 2016 Laboratorios Cantuña. All rights reserved.
//

import UIKit

class ExitoViewController: UIViewController {
    
    @IBAction func goHome(_ sender: AnyObject) {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


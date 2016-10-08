//
//  ViewController.swift
//  DEM
//
//  Created by David Amores A. on 3/10/2016.
//  Copyright © 2016 Laboratorios Cantuña. All rights reserved.
//

import UIKit

class PagosViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var telefonoTextField: UITextField!
    @IBOutlet weak var montoTextField: UITextField!
    
    @IBAction func pagar(_ sender: AnyObject) {
        let url = NSURL(string: "http://127.0.0.1:8888/dem/rest.php?task=pago&telefono=" + self.telefonoTextField.text! + "&monto=" + self.montoTextField.text!)
        
        let task = URLSession.shared.dataTask(with: url! as URL) {(data, response, error) in
            print(response)
        }
        
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.telefonoTextField.delegate = self;
        self.montoTextField.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
}


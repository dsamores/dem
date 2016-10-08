//
//  CreateCardViewController.swift
//  DEM
//
//  Created by David Amores A. on 5/10/16.
//  Copyright © 2016 Laboratorios Cantuña. All rights reserved.
//

import Foundation
import UIKit

class CreateCardViewController: UIViewController {
    
    // Mark: Properties
    @IBOutlet weak var createCard: UIButton!
    
    var cardNumber = ""
    var cardCVV = ""
    
    @IBAction func createCardAction(_ sender: UIButton) {
        let url = NSURL(string: "http://172.141.20.181:8888/dem/rest.php?task=tarjeta")
        
        let task = URLSession.shared.dataTask(with: url! as URL) {(data, response, error) in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    if let number = json??["pan"] as? String {
                        self.cardNumber = number
                    }
                    if let cvv = json??["cvv_number"] as? String {
                        self.cardCVV = cvv
                    }
                    self.performSegue(withIdentifier: "createCardSegue", sender: nil)
                } else {
                    print(json)
                }
            }
        }
        
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a variable that you want to send
        let cardInfo : [String] = [self.cardNumber, self.cardCVV]
        
        // Create a new variable to store the instance of PlayerTableViewController
        let destinationVC = segue.destination as! SuccessViewController
        destinationVC.cardInfo = cardInfo
    }
    
    
}


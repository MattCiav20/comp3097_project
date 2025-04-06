//
//  ViewController2.swift
//  COMP3097_Project
//
//  Created by Henry Wagner on 2025-03-16.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var ShoppingText: UILabel!
    
    var list = [String]()
    let values = ["Hat" : 12.00, "Jacket" : 10.00, "T-Shirt" : 8.00, "Underwear" : 7.00, "Jeans" : 9.00]
    var totalValue = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for y in list {
            if y == "Hat, Cost: $12.00"{
                totalValue += values["Hat"]!
            }
            else if y == "Jacket, Cost: $10.00"{
                totalValue += values["Jacket"]!
            }
            else if y == "T-Shirt, Cost: $8.00"{
                totalValue += values["T-Shirt"]!
            }
            else if y == "Underwear, Cost: $7.00"{
                totalValue += values["Underwear"]!
            }
            else{
                totalValue += values["Jeans"]!
            }
        }
        
        guard list == list else {return}
        ShoppingText.text = "Your total order will cost $" + String(totalValue) + ". Would you like to process the order?"
    }
    

    

}

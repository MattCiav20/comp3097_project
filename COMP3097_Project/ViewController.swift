//
//  ViewController.swift
//  COMP3097_Project
//
//  Created by Henry Wagner on 2025-03-01.
//

import UIKit

class ViewController: UIViewController{
    
    
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    let products = ["Hat, Cost: $12.00", "Jacket, Cost: $10.00", "T-Shirt, Cost: $8.00", "Underwear, Cost: $7.00", "Jeans, Cost: $9.00"]
    
    var itemList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    
    @IBAction func Button1(_ sender: Any) {
        print("Hello There")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        let destination = segue.destination as! ViewController2
        destination.list = itemList
    }
}
    
    


    extension ViewController: UITableViewDelegate{
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("You Tapped Me")
            let value = products[indexPath.row]
            itemList.append(value)
        }
    }
    
    extension ViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return products.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)
            cell.textLabel?.text = products[indexPath.row]
            return cell
        }
    }


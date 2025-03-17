//
//  ContentView.swift
//  screen 3 (checkout2)
//
//  Created by Jacques Antoine Vidjanagni on 2025-03-01.
//

import UIKit

class CheckoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var checkoutButton: UIButton!
    
    var selectedItems: [String] = []  
    let prices: [String: Double] = ["Hat": 12.00, "Jacket": 10.00, "T-Shirt": 8.00, "Jeans": 9.00]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        updateTotal()
    }
    
    // MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutCell", for: indexPath)
        let item = selectedItems[indexPath.row]
        cell.textLabel?.text = "\(item) - $\(prices[item] ?? 0.00)"
        return cell
    }
    
    
    func updateTotal() {
        let total = selectedItems.reduce(0) { (sum, item) in
            sum + (prices[item] ?? 0.00)
        }
        totalLabel.text = "Total: $\(String(format: "%.2f", total))"
    }
    
    
    @IBAction func checkoutTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Order Placed", message: "Thank you for your purchase!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popToRootViewController(animated: true)  
        })
        present(alert, animated: true)
    }
}

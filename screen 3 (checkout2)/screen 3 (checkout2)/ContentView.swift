//
//  ContentView.swift
//  screen 3 (checkout2)
//
//  Created by Jacques Antoine Vidjanagni on 2025-03-01.
//

import UIKit

class CheckoutViewController: UIViewController, UITableViewDataSource {

    // 
    @IBOutlet weak var tableView: UITableView!           // Table view for shopping items
    @IBOutlet weak var totalLabel: UILabel!              // Label to show the total cost
    @IBOutlet weak var promoCodeTextField: UITextField!  // Text field for promo code
    @IBOutlet weak var applyPromoButton: UIButton!       // Button to apply promo code
    @IBOutlet weak var payButton: UIButton!              // Button to proceed to payment
    
    var items: [Item] = []                               // Array of items in the cart
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self           // Set the table view data source
        loadItems()                          // Load items into the cart
        updateTotalLabel()                   // Update the total amount when screen loads
    }

    // MARK: -
    
    // This function will load the items into the cart (you can replace this with API or data model)
    func loadItems() {
        items = [
            Item(name: "T-Shirt", price: 20.0, quantity: 2),
            Item(name: "Jeans", price: 40.0, quantity: 1)
        ]
    }

    // This function calculates the total cost of the cart
    func calculateTotal() -> Double {
        var total = 0.0
        for item in items {
            total += item.price * Double(item.quantity)
        }
        return total
    }

    // Update the total label with the calculated total amount
    func updateTotalLabel() {
        let total = calculateTotal()
        totalLabel.text = String(format: "Total: $%.2f", total) // Format the total as a currency value
    }

    //
    
    // Action for applying the promo code (you can add more logic here)
    @IBAction func applyPromoCode(_ sender: UIButton) {
        // Simple demo: print the promo code entered
        print("Promo Code Applied: \(promoCodeTextField.text ?? "")")
        // Example: If promo code is "DISCOUNT", apply a 10% discount
        if promoCodeTextField.text == "DISCOUNT" {
            let discount = 0.1 // 10% discount
            let newTotal = calculateTotal() * (1 - discount)
            totalLabel.text = String(format: "Total: $%.2f", newTotal)
        }
    }
    
    // Action for the pay button to proceed with the payment (you can trigger the payment flow here)
    @IBAction func proceedToPayment(_ sender: UIButton) {
        // Here you would proceed to the payment screen (use your actual payment logic)
        print("Proceeding to payment...")
    }

    // MARK: -
    
    // Number of rows in the table view (one row per item in the cart)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    // Configuring each row in the table view to display item details
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.price) x \(item.quantity)" // Item price and quantity
        return cell
    }
}

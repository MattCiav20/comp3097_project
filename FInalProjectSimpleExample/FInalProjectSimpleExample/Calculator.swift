import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var totalAmount: Double = 0.0
    var cart: [(name: String, price: Double, quantity: Int)] = []
    
    func calculateTotal() -> Double {
        return cart.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    @IBAction func confirmPurchase(_ sender: UIButton) {
        totalAmount = calculateTotal()
        label.text = "Total: $\(String(format: "%.2f", totalAmount))\nConfirm Purchase?"
    }
    
    @IBAction func addItem(_ sender: UIButton) {
        let newItem = (name: "Item", price: 5.0, quantity: 1) // Placeholder item
        cart.append(newItem)
        label.text = "Item added to cart."
    }
    
    @IBAction func cancelPurchase(_ sender: UIButton) {
        cart.removeAll()
        totalAmount = 0.0
        label.text = "Purchase canceled."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Welcome to Shopping List App"
    }
}

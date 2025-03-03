//
//  ViewController.swift
//  FInalProjectSimpleExample
//
//  Created by Matthew L Ciavarella on 2025-02-16.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let category: String
}

class CartViewModel: ObservableObject {
    @Published var cart: [Product: Int] = [:]
    
    var totalPrice: Double {
        cart.reduce(0) { $0 + ($1.key.price * Double($1.value)) }
    }
    
    func addToCart(product: Product, quantity: Int) {
        cart[product, default: 0] += quantity
    }
    
    func clearCart() {
        cart.removeAll()
    }
}

struct ProductListView: View {
    let products = [
        Product(name: "Apple", price: 1.00, category: "Food"),
        Product(name: "Aspirin", price: 5.00, category: "Medication"),
        Product(name: "Bread", price: 2.50, category: "Food")
    ]
    @StateObject var cartViewModel = CartViewModel()
    
    var body: some View {
        NavigationView {
            List(products) { product in
                ProductRow(product: product, cartViewModel: cartViewModel)
            }
            .navigationTitle("Products")
            .toolbar {
                NavigationLink(destination: CartView(cartViewModel: cartViewModel)) {
                    Text("🛒")
                }
            }
        }
    }
}

struct ProductRow: View {
    let product: Product
    @ObservedObject var cartViewModel: CartViewModel
    @State private var quantity: Int = 1
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.name).font(.headline)
                Text("$\(product.price, specifier: "%.2f") - \(product.category)")
                    .font(.subheadline)
            }
            Spacer()
            Stepper(value: $quantity, in: 1...10) {
                Text("Qty: \(quantity)")
            }
            Button("Add") {
                cartViewModel.addToCart(product: product, quantity: quantity)
            }
            .buttonStyle(.bordered)
        }
    }
}

struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(cartViewModel.cart.keys.sorted(by: { $0.name < $1.name }), id: \..id) { product in
                    let quantity = cartViewModel.cart[product] ?? 0
                    HStack {
                        Text("\(product.name) x\(quantity)")
                        Spacer()
                        Text("$\(product.price * Double(quantity), specifier: "%.2f")")
                    }
                }
            }
            Text("Total: $\(cartViewModel.totalPrice, specifier: "%.2f")")
                .font(.title)
                .padding()
            NavigationLink("Proceed to Checkout", destination: CheckoutView(cartViewModel: cartViewModel))
                .buttonStyle(.borderedProminent)
                .padding()
        }
        .navigationTitle("Cart")
    }
}

struct CheckoutView: View {
    @ObservedObject var cartViewModel: CartViewModel
    @State private var showConfirmation = false
    
    var body: some View {
        VStack {
            Text("Total Amount: $\(cartViewModel.totalPrice, specifier: "%.2f")")
                .font(.largeTitle)
                .padding()
            HStack {
                Button("Confirm Purchase") {
                    showConfirmation = true
                    cartViewModel.clearCart()
                }
                .buttonStyle(.borderedProminent)
                .alert("Thank you for shopping!", isPresented: $showConfirmation) {
                    Button("OK", role: .cancel) {}
                }
                Button("Cancel") {
                    showConfirmation = false
                }
                .buttonStyle(.bordered)
            }
        }
        .navigationTitle("Checkout")
    }
}

@main
struct ShoppingListApp: App {
    var body: some Scene {
        WindowGroup {
            ProductListView()
        }
    }
}

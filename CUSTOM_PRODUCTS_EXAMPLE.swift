//
//  ProductDataManager.swift
//  giftem
//
//  Modified to use CUSTOM PRODUCTS with images
//

import Foundation
import Combine

@MainActor
class ProductDataManager: ObservableObject {
    @Published var products: [Product] = []
    private var hasAddedCustomProduct = false
    
    init() {
        createMockProducts()
    }
    
    // ADD YOUR CUSTOM PRODUCTS HERE!
    // Make sure to add images to Assets.xcassets first
    private func createMockProducts() {
        products = [
            // ========================================
            // EXAMPLE PRODUCT 1
            // ========================================
            Product(
                name: "Classic White Sneakers",
                description: "Premium leather sneakers with comfortable cushioned sole. Perfect for everyday wear and light athletic activities.",
                price: 89.99,
                originalPrice: 129.99,  // Shows 31% discount
                imageURLs: ["white-sneakers"],  // ← ADD IMAGE NAMED "white-sneakers" TO ASSETS
                category: .fashion,
                sellerId: "shoe-store",
                rating: 4.8,
                reviewCount: 234,
                tags: ["shoes", "sneakers", "fashion", "casual"]
            ),
            
            // ========================================
            // EXAMPLE PRODUCT 2
            // ========================================
            Product(
                name: "Smart Fitness Watch",
                description: "Track your health with heart rate monitoring, GPS tracking, and 7-day battery life. Water resistant and stylish.",
                price: 199.99,
                originalPrice: 249.99,
                imageURLs: ["smart-watch"],  // ← ADD IMAGE NAMED "smart-watch" TO ASSETS
                category: .electronics,
                sellerId: "tech-store",
                rating: 4.9,
                reviewCount: 567,
                tags: ["watch", "fitness", "tech", "wearable"]
            ),
            
            // ========================================
            // EXAMPLE PRODUCT 3
            // ========================================
            Product(
                name: "Organic Coffee Beans",
                description: "Premium arabica coffee beans sourced from sustainable farms. Rich flavor with notes of chocolate and caramel.",
                price: 24.99,
                imageURLs: ["coffee-beans"],  // ← ADD IMAGE NAMED "coffee-beans" TO ASSETS
                category: .food,
                sellerId: "coffee-shop",
                rating: 5.0,
                reviewCount: 89,
                tags: ["coffee", "organic", "beans"]
            ),
            
            // ========================================
            // ADD YOUR OWN PRODUCTS BELOW!
            // Copy the template above and modify
            // ========================================
            
            // Uncomment and edit this template:
            /*
            Product(
                name: "Your Product Name",
                description: "Your detailed product description here",
                price: 00.00,
                originalPrice: 00.00,  // Optional - delete if no discount
                imageURLs: ["your-image-name"],  // Add image to Assets first!
                category: .electronics,  // .electronics, .fashion, .home, .beauty, .sports, .books, .toys, .food, .other
                sellerId: "your-store",
                rating: 5.0,  // 1.0 to 5.0
                reviewCount: 0,
                tags: ["tag1", "tag2", "tag3"]
            ),
            */
        ]
    }
    
    func getProduct(by id: String) -> Product? {
        return products.first { $0.id == id }
    }
    
    func searchProducts(query: String) -> [Product] {
        guard !query.isEmpty else { return products }
        return products.filter { product in
            product.name.localizedCaseInsensitiveContains(query) ||
            product.description.localizedCaseInsensitiveContains(query) ||
            product.tags.contains { $0.localizedCaseInsensitiveContains(query) }
        }
    }
    
    func getProductsByCategory(_ category: ProductCategory) -> [Product] {
        return products.filter { $0.category == category }
    }
    
    // Add custom product via the + button
    func addCustomProduct(
        name: String,
        description: String,
        price: Double,
        category: ProductCategory,
        originalPrice: Double? = nil
    ) {
        // Clear mock products when adding first custom product
        if !hasAddedCustomProduct {
            products.removeAll()
            hasAddedCustomProduct = true
        }
        
        let newProduct = Product(
            name: name,
            description: description,
            price: price,
            originalPrice: originalPrice,
            imageURLs: ["custom"],
            category: category,
            sellerId: "custom-seller",
            rating: 5.0,
            reviewCount: 0,
            tags: ["custom", "new"]
        )
        
        products.insert(newProduct, at: 0)
    }
    
    // Clear all products
    func clearAllProducts() {
        products.removeAll()
        hasAddedCustomProduct = false
    }
    
    // Reset to these custom products
    func resetToMockProducts() {
        hasAddedCustomProduct = false
        createMockProducts()
    }
}


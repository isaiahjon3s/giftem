//
//  ProductDataManager.swift
//  giftem
//
//  Created by Isaiah Jones on 9/21/25.
//

import Foundation
import Combine

@MainActor
class ProductDataManager: ObservableObject {
    @Published var products: [Product] = []
    private var hasAddedCustomProduct = false  // Track if user added custom products
    
    init() {
        createMockProducts()
    }
    
    private func createMockProducts() {
        products = [
            // ============================================
            // YOUR PRODUCTS - Edit the values below!
            // ============================================
            
            // Product 1: Broken Lamp
            Product(
                name: "Broken Lamp",
                description: "Does not work but if fixed it could be a very nice lamp.",
                price: 1.99,
                originalPrice: 3.00,
                imageURLs: ["brokenlamp"],
                category: .home,
                sellerId: "my-store",
                rating: 1.8,
                reviewCount: 67,
                tags: ["lamp", "broken", "light", "vintage"]
            ),
            
            // Product 2: Rubber Duck
            Product(
                name: "Rubber Duck",
                description: "Nice rubber duck. Perfect for bath time. It was my mother's favorite.",
                price: 4.99,
                originalPrice: 7.99,
                imageURLs: ["duck"],
                category: .toys,
                sellerId: "my-store",
                rating: 4.8,
                reviewCount: 234,
                tags: ["duck", "rubber", "bath", "toy", "yellow"]
            ),
            
            // Product 3: Magic 8 Ball
            Product(
                name: "Magic 8 Ball",
                description: "Ask it any yes or no question and shake for your answer. The fortune telling toy!",
                price: 5.99,
                originalPrice: 10.09,
                imageURLs: ["8ball"],
                category: .toys,
                sellerId: "my-store",
                rating: 4.5,
                reviewCount: 156,
                tags: ["8ball", "magic", "fortune", "toy", "game"]
            ),
            
            // ============================================
            // ADD MORE PRODUCTS BELOW using this template:
            // ============================================
            /*
            Product(
                name: "Your Product Name",
                description: "Your product description",
                price: 9.99,
                originalPrice: 14.99,  // Optional - remove for no discount
                imageURLs: ["your-image-name"],  // Must match Assets name exactly
                category: .home,  // Options: .electronics, .fashion, .home, .beauty, .sports, .books, .toys, .food, .other
                sellerId: "my-store",
                rating: 5.0,
                reviewCount: 10,
                tags: ["tag1", "tag2"]
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
    
    // Add custom product to the feed
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
        
        // Add to beginning of products array so it appears at top
        products.insert(newProduct, at: 0)
    }
    
    // Optional: Clear all products and start fresh
    func clearAllProducts() {
        products.removeAll()
        hasAddedCustomProduct = false
    }
    
    // Optional: Reset to mock products
    func resetToMockProducts() {
        hasAddedCustomProduct = false
        createMockProducts()
    }
}


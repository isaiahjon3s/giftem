//
//  FeedDataManager.swift
//  giftem
//
//  Created by Isaiah Jones on 9/21/25.
//

import Foundation
import Combine

@MainActor
class FeedDataManager: ObservableObject {
    @Published var posts: [Post] = []
    
    private let productManager: ProductDataManager
    private let userManager: UserDataManager
    
    init(productManager: ProductDataManager, userManager: UserDataManager) {
        self.productManager = productManager
        self.userManager = userManager
        createMockPosts()
    }
    
    private func createMockPosts() {
        let products = productManager.products
        let users = userManager.users
        
        // Only create posts if we have products and users
        guard !products.isEmpty && !users.isEmpty else {
            posts = []
            return
        }
        
        // Create one post for each product you have
        posts = products.enumerated().map { (index, product) in
            let userIndex = index % users.count  // Cycle through users
            let timeOffset = TimeInterval(-3600 * (index + 1))  // Space out posts
            
            return Post(
                productId: product.id,
                userId: users[userIndex].id,
                caption: product.description,  // Use product description as caption
                createdAt: Date().addingTimeInterval(timeOffset),
                likeCount: Int.random(in: 10...500),
                commentCount: Int.random(in: 5...100),
                isLiked: false
            )
        }
    }
    
    func toggleLike(for postId: String) {
        guard let index = posts.firstIndex(where: { $0.id == postId }) else { return }
        let post = posts[index]
        posts[index] = Post(
            id: post.id,
            productId: post.productId,
            userId: post.userId,
            caption: post.caption,
            createdAt: post.createdAt,
            likeCount: post.isLiked ? post.likeCount - 1 : post.likeCount + 1,
            commentCount: post.commentCount,
            isLiked: !post.isLiked
        )
    }
    
    func getPostsForUser(_ userId: String) -> [Post] {
        return posts.filter { $0.userId == userId }
    }
    
    func getPost(by id: String) -> Post? {
        return posts.first { $0.id == id }
    }
}


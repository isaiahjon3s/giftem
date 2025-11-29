//
//  ContentView.swift
//  giftem
//
//  Created by Isaiah Jones on 9/21/25.
//

import SwiftUI

// Tab enum for navigation
enum AppTab: String, CaseIterable {
    case feed = "house.fill"
    case search = "magnifyingglass"
    case cart = "cart.fill"
    case messages = "message.fill"
    case profile = "person.fill"
    
    var title: String {
        switch self {
        case .feed: return "Feed"
        case .search: return "Search"
        case .cart: return "Cart"
        case .messages: return "Messages"
        case .profile: return "Profile"
        }
    }
}

struct ContentView: View {
    @StateObject private var userManager = UserDataManager()
    @StateObject private var productManager = ProductDataManager()
    @StateObject private var messageManager: MessageDataManager
    @StateObject private var notificationManager = NotificationManager()
    @State private var selectedTab: AppTab = .feed
    
    init() {
        let userMgr = UserDataManager()
        let prodMgr = ProductDataManager()
        let msgMgr = MessageDataManager(userManager: userMgr)
        
        _userManager = StateObject(wrappedValue: userMgr)
        _productManager = StateObject(wrappedValue: prodMgr)
        _messageManager = StateObject(wrappedValue: msgMgr)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Main content area
            Group {
                switch selectedTab {
                case .feed:
                    NavigationView {
                        FeedView()
                            .environmentObject(userManager)
                            .environmentObject(productManager)
                    }
                case .search:
                    NavigationView {
                        SearchView()
                            .environmentObject(userManager)
                            .environmentObject(productManager)
                    }
                case .cart:
                    NavigationView {
                        CartView()
                            .environmentObject(productManager)
                    }
                case .messages:
                    NavigationView {
                        MessagesView(
                            messageManager: messageManager,
                            userManager: userManager
                        )
                    }
                case .profile:
                    NavigationView {
                        if let currentUser = userManager.currentUser {
                            ProfileView(
                                user: currentUser,
                                userManager: userManager,
                                productManager: productManager,
                                messageManager: messageManager
                            )
                        } else {
                            Text("No user found")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(edges: .bottom)
            
            // Liquid Glass Tab Bar
            LiquidGlassTabBar(selectedTab: $selectedTab, unreadCount: messageManager.getTotalUnreadCount())
        }
    }
}

// MARK: - Liquid Glass Tab Bar with .glassEffect()
struct LiquidGlassTabBar: View {
    @Binding var selectedTab: AppTab
    let unreadCount: Int
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(AppTab.allCases, id: \.self) { tab in
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selectedTab = tab
                        
                        // Haptic feedback
                        #if canImport(UIKit)
                        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                        #endif
                    }
                }) {
                    VStack(spacing: 4) {
                        ZStack {
                            Image(systemName: tab.rawValue)
                                .font(.system(size: 24, weight: selectedTab == tab ? .semibold : .regular))
                                .symbolEffect(.bounce, value: selectedTab == tab)
                            
                            // Badge for messages
                            if tab == .messages && unreadCount > 0 {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 8, height: 8)
                                    .offset(x: 12, y: -12)
                            }
                        }
                    }
                    .foregroundColor(selectedTab == tab ? .primary : .secondary)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(.ultraThinMaterial)
        )
        .glassEffect() // ← Apple's True Liquid Glass Effect (iOS 26)
        .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 10)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        .padding(.horizontal, 24)
        .padding(.bottom, 20)
    }
}

#Preview {
    ContentView()
}

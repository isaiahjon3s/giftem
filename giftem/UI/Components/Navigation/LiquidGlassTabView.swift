//
//  LiquidGlassTabView.swift
//  firstapp
//
//  Created by Isaiah Jones on 9/21/25.
//

import SwiftUI

// MARK: - Liquid Glass Tab Item
// This defines the properties of a single tab in the tab view

struct LiquidGlassTabItem: Hashable {
    let title: String    // Text to display on the tab
    let icon: String     // SF Symbol icon name
    let accent: Color    // Accent color for the tab
    
    /// Creates a new tab item
    /// - Parameters:
    ///   - title: Text to display on the tab
    ///   - icon: SF Symbol icon name
    ///   - accent: Accent color for the tab (default: .accentColor)
    init(title: String, icon: String, accent: Color = .accentColor) {
        self.title = title
        self.icon = icon
        self.accent = accent
    }
}

// MARK: - Liquid Glass Tab View
// This is a customizable tab view that uses the Liquid Glass design system.
// It provides a bottom tab bar with smooth animations and haptic feedback.

struct LiquidGlassTabView<Content: View>: View {
    // MARK: - Properties
    let content: Content                 // The content to display
    let selectedTab: Int                 // Currently selected tab index
    let onTabSelected: (Int) -> Void     // Callback when tab is selected
    let tabs: [LiquidGlassTabItem]       // Array of tab items
    let blur: CGFloat                    // Liquid Glass blur intensity
    let reflection: CGFloat              // Liquid Glass reflection intensity
    let motionSensitivity: CGFloat       // Liquid Glass motion sensitivity
    
    // MARK: - State
    @Namespace private var indicatorNamespace  // For smooth indicator animation
    
    // MARK: - Initializer
    /// Creates a new Liquid Glass Tab View
    /// - Parameters:
    ///   - selectedTab: Currently selected tab index
    ///   - onTabSelected: Callback when tab is selected
    ///   - tabs: Array of tab items
    ///   - blur: Liquid Glass blur intensity (default: 0.55)
    ///   - reflection: Liquid Glass reflection intensity (default: 0.45)
    ///   - motionSensitivity: Liquid Glass motion sensitivity (default: 0.7)
    ///   - content: The content to display
    init(
        selectedTab: Int,
        onTabSelected: @escaping (Int) -> Void,
        tabs: [LiquidGlassTabItem],
        blur: CGFloat = 0.55,
        reflection: CGFloat = 0.45,
        motionSensitivity: CGFloat = 0.7,
        @ViewBuilder content: () -> Content
    ) {
        self.selectedTab = selectedTab
        self.onTabSelected = onTabSelected
        self.tabs = tabs
        self.blur = blur
        self.reflection = reflection
        self.motionSensitivity = motionSensitivity
        self.content = content()
    }
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            // Main content area
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(edges: .bottom)
            
            // Tab bar at the bottom
            tabBar
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    // MARK: - Tab Bar
    private var tabBar: some View {
        HStack(spacing: 0) {
            ForEach(Array(tabs.enumerated()), id: \.offset) { index, tab in
                Button {
                    // Don't trigger if already selected
                    guard selectedTab != index else { return }
                    
                    // Provide haptic feedback
                    triggerSelectionFeedback()
                    
                    // Animate tab selection
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0.1)) {
                        onTabSelected(index)
                    }
                } label: {
                    // Icon-only tab button
                    Image(systemName: tab.icon)
                        .font(.system(size: 24, weight: selectedTab == index ? .semibold : .regular))
                        .symbolEffect(.bounce, value: selectedTab == index)
                        .foregroundStyle(selectedTab == index ? tab.accent : Color.primary.opacity(0.5))
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(
                            // Selection pill background
                            ZStack {
                                if selectedTab == index {
                                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                                        .fill(tab.accent.opacity(0.15))
                                        .matchedGeometryEffect(id: "selectedTab", in: indicatorNamespace)
                                }
                            }
                        )
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .background(
            // Liquid Glass tab bar background
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .strokeBorder(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.5),
                                    Color.white.opacity(0.1)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 0.5
                        )
                )
                .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 10)
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
    
    // MARK: - Haptic Feedback
    /// Provides haptic feedback when a tab is selected
    private func triggerSelectionFeedback() {
        #if canImport(UIKit)
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        #endif
    }
}

// MARK: - Usage Examples
/*
 HOW TO USE LiquidGlassTabView:
 
 1. Basic Tab View:
    @State private var selectedTab = 0
    let tabs = [
        LiquidGlassTabItem(title: "Home", icon: "house", accent: .blue),
        LiquidGlassTabItem(title: "Search", icon: "magnifyingglass", accent: .green),
        LiquidGlassTabItem(title: "Profile", icon: "person", accent: .purple)
    ]
    
    LiquidGlassTabView(
        selectedTab: selectedTab,
        onTabSelected: { selectedTab = $0 },
        tabs: tabs
    ) {
        // Content based on selected tab
        switch selectedTab {
        case 0: HomeView()
        case 1: SearchView()
        case 2: ProfileView()
        default: HomeView()
        }
    }
 
 2. Custom Styling:
    LiquidGlassTabView(
        selectedTab: selectedTab,
        onTabSelected: { selectedTab = $0 },
        tabs: tabs,
        blur: 0.7,
        reflection: 0.5,
        motionSensitivity: 0.8
    ) {
        // Content
    }
 
 3. With Navigation:
    NavigationView {
        LiquidGlassTabView(
            selectedTab: selectedTab,
            onTabSelected: { selectedTab = $0 },
            tabs: tabs
        ) {
            // Content with navigation
        }
    }
*/

// MARK: - Design Notes
/*
 TAB VIEW DESIGN PRINCIPLES:
 
 1. VISUAL HIERARCHY:
    - Clear icons and labels
    - Selected state is obvious
    - Smooth transitions between tabs
    - Consistent spacing and sizing
 
 2. INTERACTION:
    - Haptic feedback on selection
    - Smooth animations
    - Clear touch targets
    - Visual feedback for all states
 
 3. ACCESSIBILITY:
    - Clear labels for VoiceOver
    - Appropriate contrast ratios
    - Large enough touch targets
    - Semantic information
 
 4. CUSTOMIZATION:
    - Flexible tab configuration
    - Customizable colors
    - Liquid Glass parameters
    - Smooth indicator animation
 
 5. LIQUID GLASS EFFECT:
    - Translucent background
    - Gradient borders
    - Colored shadows
    - Glass-like appearance
*/

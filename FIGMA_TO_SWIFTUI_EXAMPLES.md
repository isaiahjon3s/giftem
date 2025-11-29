# Figma to SwiftUI Translation Examples

Real-world examples of translating Figma designs into SwiftUI code for your Giftem app.

---

## 📚 Table of Contents

1. [Basic Elements](#basic-elements)
2. [Layout Translation](#layout-translation)
3. [Liquid Glass Components](#liquid-glass-components)
4. [Complete Screen Example](#complete-screen-example)
5. [Common Patterns](#common-patterns)

---

## Basic Elements

### Example 1: Simple Button

**Figma Design:**
```
Frame: 343 × 50pt
Corner Radius: 12pt
Fill: Linear Gradient (#007AFF → #00C7FF, 135°)
Shadow: (0, 4, 8, #000 30%)
Text: "Continue", SF Pro Text, Bold, 17pt, White
```

**SwiftUI Code:**

```swift
Button(action: {
    // Action
}) {
    Text("Continue")
        .font(.system(size: 17, weight: .bold))
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(
            LinearGradient(
                colors: [Color(hex: "#007AFF"), Color(hex: "#00C7FF")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.3), radius: 8, y: 4)
}
.buttonStyle(ScaleButtonStyle())
```

---

### Example 2: Glass Card

**Figma Design:**
```
Frame: 343 × 200pt
Fill: White 10%
Background Blur: 40
Border: 1pt White 20%
Corner Radius: 14pt
Shadow: (0, 4, 8, #000 30%)
```

**SwiftUI Code:**

```swift
VStack(alignment: .leading, spacing: 12) {
    // Your content here
    Text("Card Title")
        .font(.title2)
        .fontWeight(.semibold)
    
    Text("Card description goes here")
        .font(.body)
        .foregroundColor(.secondary)
}
.frame(maxWidth: .infinity)
.frame(height: 200)
.padding(16)
.background(
    RoundedRectangle(cornerRadius: 14)
        .fill(.ultraThinMaterial)
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
        )
)
.shadow(color: .black.opacity(0.3), radius: 8, y: 4)
```

---

### Example 3: Avatar with Gradient Border

**Figma Design:**
```
Circle: 100 × 100pt
Fill: Image
Border: 3pt, Linear Gradient (#007AFF → #00C7FF)
Shadow: (0, 6, 12, #000 25%)
```

**SwiftUI Code:**

```swift
ZStack {
    // Gradient border
    Circle()
        .fill(
            LinearGradient(
                colors: [Color(hex: "#007AFF"), Color(hex: "#00C7FF")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .frame(width: 106, height: 106) // 100 + (3 * 2) for border
    
    // Image
    AsyncImage(url: URL(string: user.profileImage)) { image in
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
    } placeholder: {
        Color.gray.opacity(0.3)
    }
    .frame(width: 100, height: 100)
    .clipShape(Circle())
}
.shadow(color: .black.opacity(0.25), radius: 12, y: 6)
```

---

## Layout Translation

### Example 4: Auto Layout → VStack/HStack

**Figma Auto Layout:**
```
Direction: Vertical
Spacing: 12pt
Padding: 16pt all sides
Alignment: Leading
```

**SwiftUI Code:**

```swift
VStack(alignment: .leading, spacing: 12) {
    Text("First Item")
    Text("Second Item")
    Text("Third Item")
}
.padding(16)
```

**Figma Auto Layout (Horizontal):**
```
Direction: Horizontal
Spacing: 8pt
Padding: 12pt horizontal, 8pt vertical
Alignment: Center
```

**SwiftUI Code:**

```swift
HStack(spacing: 8) {
    Image(systemName: "star.fill")
    Text("Label")
    Spacer()
}
.padding(.horizontal, 12)
.padding(.vertical, 8)
```

---

### Example 5: Grid Layout

**Figma Grid:**
```
Columns: 2
Spacing: 12pt
Item Size: 165.5 × 220pt (calculated from screen width)
```

**SwiftUI Code:**

```swift
let columns = [
    GridItem(.flexible(), spacing: 12),
    GridItem(.flexible(), spacing: 12)
]

ScrollView {
    LazyVGrid(columns: columns, spacing: 12) {
        ForEach(products) { product in
            ProductCard(product: product)
                .frame(height: 220)
        }
    }
    .padding(.horizontal, 16)
}
```

---

## Liquid Glass Components

### Example 6: Liquid Glass Search Field

**Figma Design:**
```
Frame: 343 × 44pt
Fill: White 8%
Background Blur: 30
Border: 1pt White 15%
Corner Radius: 12pt
Leading Icon: magnifyingglass, 18pt
Placeholder: "Search...", Body, Secondary
```

**SwiftUI Code:**

```swift
struct LiquidGlassSearchField: View {
    @Binding var text: String
    var placeholder: String = "Search..."
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 18))
                .foregroundColor(.secondary)
            
            TextField(placeholder, text: $text)
                .font(.body)
            
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 44)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.15), lineWidth: 1)
                )
        )
    }
}

// Usage
LiquidGlassSearchField(text: $searchText)
    .padding(.horizontal, 16)
```

---

### Example 7: Category Chip (Pill)

**Figma Design (Selected):**
```
Auto Layout: Horizontal, 12pt padding horizontal
Height: 32pt
Corner Radius: 20pt (full pill)
Fill: Linear Gradient (#007AFF → #00C7FF)
Shadow: (0, 4, 8, #000 30%)
Icon: 16pt SF Symbol
Text: Footnote, Semibold, White
```

**Figma Design (Unselected):**
```
Same layout
Fill: White 10%
Border: 1pt White 20%
No Shadow
Text Color: Primary
```

**SwiftUI Code:**

```swift
struct CategoryChip: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let gradient: LinearGradient
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 16, weight: .semibold))
                
                Text(title)
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 12)
            .frame(height: 32)
            .foregroundColor(isSelected ? .white : .primary)
            .background(
                Group {
                    if isSelected {
                        Capsule()
                            .fill(gradient)
                    } else {
                        Capsule()
                            .fill(.ultraThinMaterial)
                            .overlay(
                                Capsule()
                                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
                            )
                    }
                }
            )
            .shadow(
                color: isSelected ? .black.opacity(0.3) : .clear,
                radius: isSelected ? 8 : 0,
                y: isSelected ? 4 : 0
            )
        }
        .buttonStyle(ScaleButtonStyle(scale: 0.97))
    }
}

// Usage
CategoryChip(
    title: "Electronics",
    icon: "bolt.fill",
    isSelected: selectedCategory == "Electronics",
    gradient: LinearGradient(
        colors: [Color(hex: "#007AFF"), Color(hex: "#00C7FF")],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    ),
    action: { selectedCategory = "Electronics" }
)
```

---

### Example 8: Message Bubble

**Figma Design (Sent):**
```
Max Width: 75% screen
Auto Layout: Vertical, 8pt spacing
Padding: 12pt all sides
Corner Radius: 18pt (custom per corner)
Fill: Linear Gradient (#007AFF → #00C7FF)
Alignment: Trailing
```

**SwiftUI Code:**

```swift
struct MessageBubble: View {
    let message: Message
    let isSent: Bool
    
    var body: some View {
        HStack {
            if isSent { Spacer(minLength: 60) }
            
            VStack(alignment: isSent ? .trailing : .leading, spacing: 4) {
                Text(message.text)
                    .font(.body)
                    .foregroundColor(isSent ? .white : .primary)
                    .padding(12)
                    .background(
                        bubbleBackground
                    )
                
                Text(message.timestamp, style: .time)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 4)
            }
            
            if !isSent { Spacer(minLength: 60) }
        }
    }
    
    @ViewBuilder
    private var bubbleBackground: some View {
        if isSent {
            UnevenRoundedRectangle(
                topLeadingRadius: 18,
                bottomLeadingRadius: 18,
                bottomTrailingRadius: 4,
                topTrailingRadius: 18
            )
            .fill(
                LinearGradient(
                    colors: [Color(hex: "#007AFF"), Color(hex: "#00C7FF")],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
        } else {
            UnevenRoundedRectangle(
                topLeadingRadius: 18,
                bottomLeadingRadius: 4,
                bottomTrailingRadius: 18,
                topTrailingRadius: 18
            )
            .fill(.ultraThinMaterial)
            .overlay(
                UnevenRoundedRectangle(
                    topLeadingRadius: 18,
                    bottomLeadingRadius: 4,
                    bottomTrailingRadius: 18,
                    topTrailingRadius: 18
                )
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
            )
        }
    }
}
```

---

## Complete Screen Example

### Example 9: Quote Card Screen

**Figma Design:**
```
iPhone 15 Pro Frame (393 × 852)
├─ Navigation Bar (44pt)
│  ├─ Title: "Quotes", Title 2, Bold
│  └─ Add Button: plus.circle.fill, 22pt
├─ ScrollView
│  └─ Quote Cards (343 × 280pt each)
│     ├─ Glass background
│     ├─ Quote text (center, large)
│     ├─ Author (bottom, small)
│     └─ Action buttons
└─ Tab Bar (83pt)
```

**SwiftUI Code:**

```swift
struct QuoteFeedView: View {
    @StateObject private var quoteManager = QuoteDataManager()
    @State private var showAddQuote = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(quoteManager.quotes) { quote in
                        QuoteCard(quote: quote)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 100) // Tab bar clearance
            }
            .background(
                LinearGradient(
                    colors: [
                        Color(hex: "#007AFF").opacity(0.1),
                        Color(hex: "#00C7FF").opacity(0.1)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
            .navigationTitle("Quotes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddQuote = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 22))
                    }
                }
            }
            .sheet(isPresented: $showAddQuote) {
                AddQuoteView()
            }
        }
    }
}

struct QuoteCard: View {
    let quote: Quote
    @State private var isLiked = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Quote text
            Text("\"\(quote.text)\"")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
            
            Spacer()
            
            // Author
            VStack(spacing: 8) {
                HStack(spacing: 12) {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.blue, Color.cyan],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 40, height: 40)
                        .overlay(
                            Text(quote.author.prefix(1))
                                .font(.headline)
                                .foregroundColor(.white)
                        )
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(quote.author)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text(quote.timestamp, style: .relative)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                
                // Action buttons
                HStack(spacing: 24) {
                    Button(action: { 
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            isLiked.toggle()
                        }
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .symbolEffect(.bounce, value: isLiked)
                            Text("\(quote.likes + (isLiked ? 1 : 0))")
                                .font(.subheadline)
                        }
                        .foregroundColor(isLiked ? .pink : .secondary)
                    }
                    
                    Button(action: {}) {
                        HStack(spacing: 6) {
                            Image(systemName: "bubble.left")
                            Text("\(quote.comments)")
                                .font(.subheadline)
                        }
                        .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.secondary)
                    }
                }
                .font(.system(size: 18))
            }
        }
        .padding(20)
        .frame(height: 280)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
        )
        .shadow(color: .black.opacity(0.3), radius: 8, y: 4)
    }
}
```

---

## Common Patterns

### Pattern 1: Responsive Sizing

**Figma:** Fixed width (343pt)
**SwiftUI:** Use `.frame(maxWidth: .infinity)` for flexibility

```swift
// Instead of:
.frame(width: 343)

// Use:
.frame(maxWidth: .infinity)
.padding(.horizontal, 16) // Provides margins
```

---

### Pattern 2: Dynamic Color (Dark Mode)

**Figma:** Create separate light/dark variants
**SwiftUI:** Use semantic colors for automatic adaptation

```swift
// Adapts automatically
.foregroundColor(.primary) // Label color
.background(.ultraThinMaterial) // Adaptive blur
```

---

### Pattern 3: Spacing Systems

**Figma:** Manual spacing between elements
**SwiftUI:** Use spacing parameter

```swift
// Instead of adding spacers:
VStack {
    Text("One")
    Spacer().frame(height: 12)
    Text("Two")
}

// Use spacing:
VStack(spacing: 12) {
    Text("One")
    Text("Two")
}
```

---

### Pattern 4: Reusable Gradient Styles

**Create once, use everywhere:**

```swift
// In a separate file: Gradients.swift
extension LinearGradient {
    static let electronics = LinearGradient(
        colors: [Color(hex: "#007AFF"), Color(hex: "#00C7FF")],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let fashion = LinearGradient(
        colors: [Color(hex: "#FF2D55"), Color(hex: "#FF6B9D")],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    // ... more gradients
}

// Usage:
.fill(LinearGradient.electronics)
```

---

### Pattern 5: Press Animation (from Figma Prototypes)

**Figma:** On Tap → Scale to 95%
**SwiftUI:** Custom ButtonStyle

```swift
struct ScaleButtonStyle: ButtonStyle {
    var scale: CGFloat = 0.95
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scale : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}

// Apply to any button:
Button("Press Me") { }
    .buttonStyle(ScaleButtonStyle())
```

---

## 🎓 Translation Rules

### Always:
- ✅ Use semantic colors (`.primary`, `.secondary`)
- ✅ Use SF Symbols for icons
- ✅ Apply `.buttonStyle()` for press effects
- ✅ Use `.padding()` instead of fixed frames when possible
- ✅ Test in both light and dark mode

### Never:
- ❌ Hardcode absolute sizes for text
- ❌ Use exact pixel values (use pt)
- ❌ Forget accessibility (VoiceOver labels)
- ❌ Skip animation on interactive elements
- ❌ Use pure white/black (use semantic colors)

---

## 📖 Quick Reference

| Figma | SwiftUI |
|-------|---------|
| Frame with Auto Layout → Vertical | `VStack` |
| Frame with Auto Layout → Horizontal | `HStack` |
| Frame with Stack | `ZStack` |
| Spacing between items | `.spacing()` |
| Padding | `.padding()` |
| Fill color | `.background()` or `.foregroundColor()` |
| Stroke | `.border()` or `.overlay()` |
| Corner Radius | `.cornerRadius()` |
| Drop Shadow | `.shadow()` |
| Background Blur | `.background(.ultraThinMaterial)` |
| Layer Blur | `.blur(radius:)` |
| Opacity | `.opacity()` |
| On Click | `.onTapGesture()` or `Button` |
| Prototype animation | `withAnimation()` |

---

**Now you can translate any Figma design to SwiftUI! 🎨➡️📱**


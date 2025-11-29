# Figma → SwiftUI Design Workflow

A comprehensive guide to designing your Giftem app in Figma and implementing those designs in SwiftUI.

---

## 📋 Table of Contents
1. [Current App → Figma (Documentation)](#step-1-document-current-app)
2. [Setting Up Figma for iOS](#step-2-set-up-figma)
3. [Creating Your Design System](#step-3-create-design-system)
4. [Designing New Features](#step-4-design-new-features)
5. [Figma → SwiftUI (Implementation)](#step-5-implement-in-swiftui)
6. [Tools & Plugins](#step-6-tools--plugins)
7. [Best Practices](#best-practices)

---

## Step 1: Document Current App

### 1.1 Take Screenshots

**Run your app and capture all screens:**

```bash
# Run the app in simulator
# Press ⌘ + S to take screenshots
# Screenshots save to Desktop by default
```

**Screenshot checklist:**
- [ ] Feed View (all tabs/states)
- [ ] Search View (empty, with results)
- [ ] Messages View (inbox, conversation)
- [ ] Cart View (empty, with items)
- [ ] Profile View (own profile, other user's profile)
- [ ] Quote Feed
- [ ] Workout Views (list, detail, session)
- [ ] Product Detail View
- [ ] Comments View
- [ ] All modal/sheet presentations

**Pro tip:** Take screenshots in both light and dark mode!

### 1.2 Document Design Tokens

Create a spreadsheet or document with your current design system:

#### **Colors**
```swift
// Current Liquid Glass colors from your app
Primary Blue: #007AFF
Pink: #FF2D55
Green: #34C759
Orange: #FF9500
Purple: #AF52DE

// Gradients (document all color stops)
Electronics: [#007AFF → #00C7FF]
Fashion: [#FF2D55 → #FF6B9D]
Home: [#34C759 → #30D158]
// etc...
```

#### **Typography**
```swift
Headline: SF Pro Display, Bold, 28pt
Title: SF Pro Display, Semibold, 22pt
Body: SF Pro Text, Regular, 17pt
Caption: SF Pro Text, Regular, 12pt
```

#### **Spacing**
```swift
XXS: 4pt
XS: 8pt
S: 12pt
M: 16pt
L: 24pt
XL: 32pt
XXL: 48pt
```

#### **Corner Radius**
```swift
Small (chips): 20pt
Medium (cards): 12-14pt
Large (buttons): 12pt
Circle: 50% (half height/width)
```

#### **Shadows**
```swift
Card Shadow: opacity(0.3), radius: 8, y: 4
Button Shadow: opacity(0.2), radius: 6, y: 3
Avatar Shadow: opacity(0.25), radius: 12, y: 6
```

#### **Effects**
```swift
Blur: Ultra Thin Material
Glassmorphism: .ultraThinMaterial + border
Press Scale: 0.95-0.97
Spring Animation: response(0.3), damping(0.6)
```

---

## Step 2: Set Up Figma

### 2.1 Create New Figma File

1. **Go to Figma** → New Design File
2. **Name it:** "Giftem App Design"
3. **Set up pages:**
   - 📱 Screens
   - 🎨 Design System
   - 🧩 Components
   - 📐 Wireframes
   - ✅ Archive

### 2.2 Set Up Frames (Artboards)

**Add iPhone frames:**

1. Press `F` (Frame tool)
2. Choose from the right panel:
   - **iPhone 15 Pro** (393 × 852)
   - **iPhone 15 Pro Max** (430 × 932)

**Or use the iOS UI Kit:**

Go to Community → Search "iOS 18 UI Kit" → Duplicate to your files

### 2.3 Install Essential Plugins

**In Figma:**
1. Menu → Plugins → Browse plugins in Community

**Must-have plugins:**
- **iOS 18 Design Kit** - Official Apple components
- **SF Symbols** - All Apple icons
- **Stark** - Accessibility checker
- **Able** - Color contrast checker
- **AutoFlow** - Flow arrows for prototypes
- **Content Reel** - Generate fake data
- **Remove BG** - Background removal
- **Iconify** - Icon library

---

## Step 3: Create Design System

### 3.1 Set Up Color Styles

**In Figma:**

1. **Create a "Design System" page**

2. **Create color swatches:**
   - Draw rectangles for each color
   - Select the fill
   - Click the 4-dot icon → Create Style
   - Name with prefix: `Colors/Primary/Blue`

**Naming convention:**
```
Colors/Primary/Blue
Colors/Primary/Pink
Colors/Primary/Green
Colors/Gradient/Electronics Start
Colors/Gradient/Electronics End
Colors/Background/Primary
Colors/Background/Secondary
Colors/Text/Primary
Colors/Text/Secondary
Colors/Glass/Blur
```

### 3.2 Set Up Text Styles

**Typography setup:**

1. **Draw text boxes with your styles:**
   ```
   Headline (SF Pro Display, Bold, 28)
   Title 1 (SF Pro Display, Semibold, 22)
   Title 2 (SF Pro Display, Semibold, 20)
   Body (SF Pro Text, Regular, 17)
   Callout (SF Pro Text, Regular, 16)
   Caption (SF Pro Text, Regular, 12)
   ```

2. **For each text style:**
   - Select text → Properties panel
   - Click 4-dot icon next to Text → Create style
   - Name: `Text/Headline`, `Text/Body`, etc.

### 3.3 Create Effect Styles (Shadows & Blur)

**Card Shadow:**
1. Draw rectangle → Add Drop Shadow
2. Set: X=0, Y=4, Blur=8, Color=#000 at 30%
3. Effects → 4-dot icon → Create style → `Shadows/Card`

**Glassmorphism:**
1. Rectangle → Fill: White at 10%
2. Add Background Blur: 40
3. Add Border: 1px, White at 20%
4. Effects → Create style → `Effects/Glass`

### 3.4 Create Grid Layout

**Set up iOS safe area grid:**

1. Select iPhone frame
2. Layout Grid (Shift + G)
3. Add multiple grids:
   - **Columns:** 2 columns, margin 16, gutter 16
   - **Rows:** 8pt baseline grid
   - **Safe Area Guides:** Top 59, Bottom 34 (for iPhone with notch)

---

## Step 4: Design New Features

### 4.1 Import Current Screens

**Method 1: Import Screenshots**
1. Drag screenshots into Figma
2. Place on artboards as reference
3. Lock layer (⌘ + Shift + L)
4. Set opacity to 50%
5. Design on top

**Method 2: Recreate from Scratch**
1. Use your screenshots as reference
2. Rebuild using Figma components
3. This gives you full editability

### 4.2 Build Component Library

**Create reusable components:**

#### **Liquid Glass Card**
1. Create rectangle (rounded 12pt)
2. Fill: Colors/Glass/Blur
3. Border: 1pt white at 20%
4. Shadow: Shadows/Card
5. Right-click → Create Component (⌘ + Option + K)
6. Name: `Cards/Liquid Glass Card`

#### **Gradient Button**
1. Rectangle with rounded corners
2. Fill: Linear gradient
3. Shadow: Shadows/Button
4. Add text layer
5. Create Component → `Buttons/Primary`

#### **Tab Bar**
1. Create 5 icons with SF Symbols plugin
2. Add labels below
3. Create selected/unselected states
4. Create Component Set (variants)

#### **Message Bubble**
1. Create sent bubble (right aligned)
2. Create received bubble (left aligned)
3. Use Component Variants

### 4.3 Design New Screens

**Create variants for each screen:**

1. **Empty States**
2. **Loading States**
3. **Error States**
4. **Success States**
5. **Light Mode**
6. **Dark Mode**

**Naming convention:**
```
Feed/Default/Light
Feed/Default/Dark
Feed/Loading/Light
Feed/Empty/Light
Messages/Inbox/Light
Messages/Conversation/Light
```

---

## Step 5: Implement in SwiftUI

### 5.1 Export Design Specs

**Using Figma Inspect:**

1. Select any element in Figma
2. Click "Inspect" tab (right panel)
3. Switch to **iOS** mode (top of panel)
4. Copy the SwiftUI-like specs

**Example:**
```swift
// Figma shows:
Width: 343pt
Height: 200pt
Corner Radius: 12pt
Padding: 16pt
```

### 5.2 Export Assets

#### **Export Icons/Images**

1. Select asset in Figma
2. Export settings (bottom right):
   - **1x** (PNG/PDF)
   - **2x** (PNG/PDF) 
   - **3x** (PNG/PDF)
3. Click Export

**For iOS:** Use PDF for vector icons (best quality)

#### **Add to Xcode:**

```bash
# Drag exported assets into:
giftem/Assets.xcassets/
```

### 5.3 Translate Design to Code

**Figma → SwiftUI Translation:**

| Figma | SwiftUI |
|-------|---------|
| Frame (Auto Layout) | `VStack`, `HStack`, `ZStack` |
| Spacing | `.padding()` or `.spacing()` |
| Fill | `.background()`, `.foregroundColor()` |
| Stroke | `.border()`, `.overlay()` |
| Corner Radius | `.cornerRadius()` |
| Shadow | `.shadow()` |
| Blur | `.blur()` or `.background(.ultraThinMaterial)` |
| Opacity | `.opacity()` |

#### **Example: Liquid Glass Card**

**Figma specs:**
```
Frame: 343 × 200
Fill: White 10% opacity
Background Blur: 40
Border: 1px White 20%
Corner Radius: 12
Shadow: 0, 4, 8, Black 30%
```

**SwiftUI implementation:**

```swift
VStack {
    // Your content
}
.frame(width: 343, height: 200)
.background(
    RoundedRectangle(cornerRadius: 12)
        .fill(.ultraThinMaterial)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
        )
)
.shadow(color: .black.opacity(0.3), radius: 8, y: 4)
```

### 5.4 Extract Colors

**From Figma:**
1. Select colored element
2. Inspect panel → Copy hex color
3. Convert to SwiftUI

**Add to your app:**

```swift
// Create: giftem/UI/Theme/Colors.swift
import SwiftUI

extension Color {
    // From Figma
    static let customBlue = Color(hex: "#007AFF")
    static let customPink = Color(hex: "#FF2D55")
    
    // Gradients
    static let electronicsGradient = LinearGradient(
        colors: [Color(hex: "#007AFF"), Color(hex: "#00C7FF")],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
```

### 5.5 Extract Typography

**From Figma:**
```
Font: SF Pro Display
Weight: Bold
Size: 28pt
Line Height: 34pt (120%)
Letter Spacing: 0
```

**SwiftUI implementation:**

```swift
// Create: giftem/UI/Theme/Typography.swift
import SwiftUI

extension Font {
    static let headline = Font.system(size: 28, weight: .bold, design: .default)
    static let title1 = Font.system(size: 22, weight: .semibold, design: .default)
    static let title2 = Font.system(size: 20, weight: .semibold, design: .default)
    static let body = Font.system(size: 17, weight: .regular, design: .default)
    static let callout = Font.system(size: 16, weight: .regular, design: .default)
    static let caption = Font.system(size: 12, weight: .regular, design: .default)
}

// Usage:
Text("Welcome")
    .font(.headline)
```

---

## Step 6: Tools & Plugins

### 6.1 Figma to Code Tools

**Figma Plugins:**

1. **Figma to SwiftUI**
   - Auto-generates SwiftUI code
   - Select component → Plugins → Figma to SwiftUI
   - Copy generated code
   - ⚠️ Requires manual cleanup

2. **Anima**
   - Exports to SwiftUI code
   - Better for complex layouts
   - Premium plugin

3. **Locofy**
   - AI-powered Figma to code
   - Supports SwiftUI
   - Good for rapid prototyping

### 6.2 Design Handoff

**Use Figma's Dev Mode:**

1. Share Figma file with yourself
2. Switch to Dev Mode (top right)
3. Select any element
4. Get CSS/iOS/Swift specs
5. Copy values directly

**Export design specs as PDF:**
1. Select all screens
2. Export → PDF
3. Use as reference document

---

## Best Practices

### ✅ Design Best Practices

1. **Use Auto Layout** (Shift + A) for everything
   - Makes designs responsive
   - Easier to translate to SwiftUI stacks

2. **Create Component Variants**
   - Different states (normal, pressed, disabled)
   - Light/dark mode variants

3. **Use Constraints**
   - Pin elements to safe areas
   - Match iOS behavior

4. **Name Layers Clearly**
   ```
   ✅ Button/Primary/Default
   ✅ Card/Product/Large
   ❌ Rectangle 123
   ❌ Frame 45
   ```

5. **Use Real Content**
   - Don't use Lorem Ipsum
   - Use actual app data
   - Test with long/short text

6. **Design for All States**
   - Empty states
   - Loading states
   - Error states
   - Success states

### ✅ Development Best Practices

1. **Don't Copy Code Blindly**
   - Generated code is a starting point
   - Refactor for your architecture
   - Follow your app's patterns

2. **Use Design Tokens**
   - Create centralized theme files
   - Don't hardcode values
   - Makes updates easier

3. **Build Reusable Components**
   - Extract common UI into components
   - Match your Figma component library

4. **Iterate Together**
   - Design → Build → Test → Refine
   - Keep Figma and code in sync

5. **Document Differences**
   - Note what can't be replicated exactly
   - Document platform limitations
   - Explain compromises to designers

---

## 🔄 Recommended Workflow

### Week-by-Week Process

**Week 1: Setup & Documentation**
- [ ] Take screenshots of all current screens
- [ ] Document design system in spreadsheet
- [ ] Set up Figma file with proper structure
- [ ] Install plugins

**Week 2: Design System**
- [ ] Create color styles
- [ ] Create text styles
- [ ] Create effect styles (shadows, blur)
- [ ] Build component library

**Week 3: Screen Designs**
- [ ] Design new screens
- [ ] Create all variants (states, modes)
- [ ] Add interactions/prototyping
- [ ] Get feedback

**Week 4: Implementation**
- [ ] Extract design specs
- [ ] Export assets
- [ ] Implement in SwiftUI
- [ ] Compare with design
- [ ] Iterate

---

## 📚 Resources

### Figma Resources
- [Figma iOS UI Kit](https://www.figma.com/community/file/1248375255495415511)
- [Apple Design Resources](https://developer.apple.com/design/resources/)
- [SF Symbols App](https://developer.apple.com/sf-symbols/)
- [iOS Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios)

### SwiftUI Resources
- [Apple SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- [Hacking with Swift](https://www.hackingwithswift.com/quick-start/swiftui)
- [SwiftUI Lab](https://swiftui-lab.com)

### Design-to-Code Tools
- [Figma Dev Mode](https://www.figma.com/dev-mode/)
- [Anima](https://www.animaapp.com)
- [Locofy](https://www.locofy.ai)

---

## 🎯 Quick Reference: Figma → SwiftUI

### Layout
```
Frame (Vertical)     → VStack
Frame (Horizontal)   → HStack
Frame (Stack)        → ZStack
Auto Layout Spacing  → .spacing() or .padding()
```

### Styling
```
Fill                 → .background() or .foregroundColor()
Stroke               → .border() or .overlay()
Corner Radius        → .cornerRadius() or RoundedRectangle
Shadow               → .shadow()
Opacity              → .opacity()
```

### Effects
```
Background Blur      → .background(.ultraThinMaterial)
Layer Blur           → .blur(radius:)
Gaussian Blur        → .blur(radius:)
```

### Interactions
```
On Click             → .onTapGesture()
While Pressing       → .simultaneousGesture(DragGesture())
Prototype Transition → withAnimation()
```

---

## 💡 Pro Tips

1. **Use Figma Variables** (new feature)
   - Create variables for colors, spacing
   - Change once, updates everywhere
   - Similar to SwiftUI design tokens

2. **Create a Shared Library**
   - Team Library in Figma
   - Share components across files
   - Keep designs consistent

3. **Version Control**
   - Use Figma's version history
   - Name versions clearly: "v1.0 - Initial Design"
   - Create branches for experiments

4. **Collaborate with Comments**
   - Add comments in Figma
   - Tag team members
   - Track design decisions

5. **Build Prototypes**
   - Connect screens with interactions
   - Test user flows
   - Share with stakeholders before coding

---

**Ready to start designing? Open Figma and let's go! 🎨**


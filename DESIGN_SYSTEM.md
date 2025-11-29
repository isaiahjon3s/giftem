# Giftem Design System Reference

This document contains all the design tokens, components, and specifications from your current app. Use this as a reference when setting up Figma.

---

## 🎨 Colors

### Primary Colors
```swift
Blue:     #007AFF
Pink:     #FF2D55
Green:    #34C759
Orange:   #FF9500
Purple:   #AF52DE
Red:      #FF3B30
Teal:     #5AC8FA
Indigo:   #5856D6
Yellow:   #FFCC00
```

### Category Gradients

#### Electronics - Blue
```
Start: #007AFF
End:   #00C7FF
Angle: 135° (topLeading → bottomTrailing)
```

#### Fashion - Pink
```
Start: #FF2D55
End:   #FF6B9D
Angle: 135°
```

#### Home - Green
```
Start: #34C759
End:   #30D158
Angle: 135°
```

#### Beauty - Rose
```
Start: #FF2D55
End:   #FF69B4
Angle: 135°
```

#### Sports - Cyan
```
Start: #5AC8FA
End:   #00D4FF
Angle: 135°
```

#### Books - Brown
```
Start: #A0522D
End:   #D2691E
Angle: 135°
```

#### Toys - Yellow
```
Start: #FFCC00
End:   #FFD700
Angle: 135°
```

#### Food - Orange
```
Start: #FF9500
End:   #FFAA00
Angle: 135°
```

### Semantic Colors
```swift
Background Primary:   System Background
Background Secondary: Secondary System Background
Text Primary:         Label
Text Secondary:       Secondary Label
Separator:            Separator
```

### Glass Effect
```swift
Fill:    White at 10% opacity
Border:  White at 20% opacity, 1pt
Blur:    Ultra Thin Material (40-50pt blur)
```

---

## 📐 Typography

### Font Family
- **Display/Headings:** SF Pro Display
- **Body Text:** SF Pro Text
- **Rounded (Optional):** SF Pro Rounded

### Text Styles

#### Headline
```
Font:          SF Pro Display
Weight:        Bold
Size:          28pt
Line Height:   34pt (121%)
Letter Space:  0
Color:         Label (Primary)
```

#### Title 1
```
Font:          SF Pro Display
Weight:        Semibold
Size:          22pt
Line Height:   28pt (127%)
Letter Space:  0
Color:         Label
```

#### Title 2
```
Font:          SF Pro Display
Weight:        Semibold
Size:          20pt
Line Height:   25pt (125%)
Letter Space:  0
Color:         Label
```

#### Title 3
```
Font:          SF Pro Display
Weight:        Semibold
Size:          18pt
Line Height:   22pt (122%)
Letter Space:  0
Color:         Label
```

#### Body
```
Font:          SF Pro Text
Weight:        Regular
Size:          17pt
Line Height:   22pt (129%)
Letter Space:  0
Color:         Label
```

#### Callout
```
Font:          SF Pro Text
Weight:        Regular
Size:          16pt
Line Height:   21pt (131%)
Letter Space:  0
Color:         Label
```

#### Subheadline
```
Font:          SF Pro Text
Weight:        Regular
Size:          15pt
Line Height:   20pt (133%)
Letter Space:  0
Color:         Secondary Label
```

#### Footnote
```
Font:          SF Pro Text
Weight:        Regular
Size:          13pt
Line Height:   18pt (138%)
Letter Space:  0
Color:         Secondary Label
```

#### Caption 1
```
Font:          SF Pro Text
Weight:        Regular
Size:          12pt
Line Height:   16pt (133%)
Letter Space:  0
Color:         Secondary Label
```

#### Caption 2
```
Font:          SF Pro Text
Weight:        Regular
Size:          11pt
Line Height:   13pt (118%)
Letter Space:  0
Color:         Secondary Label
```

---

## 📏 Spacing System

### Spacing Scale
```swift
4pt   (XXS)  - Tight spacing, icon padding
8pt   (XS)   - Compact spacing
12pt  (S)    - Small spacing
16pt  (M)    - Default spacing (most common)
24pt  (L)    - Large spacing
32pt  (XL)   - Section spacing
48pt  (XXL)  - Major section breaks
64pt  (3XL)  - Screen top/bottom padding
```

### Common Usage
```
Card Padding:        16pt all sides
Button Padding:      12pt horizontal, 10pt vertical
List Item Padding:   16pt horizontal, 12pt vertical
Screen Padding:      16pt horizontal
Section Spacing:     32pt vertical
Element Spacing:     8-12pt between related items
Group Spacing:       24pt between groups
```

---

## 🔲 Corner Radius

### Radius Scale
```swift
4pt   - Tiny (small chips, badges)
8pt   - Small (small buttons)
12pt  - Medium (cards, most buttons)
14pt  - Large cards
20pt  - Pills (category chips, tags)
28pt  - Large pills
50%   - Circle (avatars, round buttons)
```

### Component-Specific
```
Cards:           12-14pt
Buttons:         12pt
Input Fields:    10pt
Category Chips:  20pt (full pill)
Product Images:  12pt
Avatars:         50% (circle)
Modals:          16pt (top corners)
Tab Bar:         0pt (straight edges)
```

---

## 🌑 Shadows

### Shadow Styles

#### Card Shadow
```
Color:    Black
Opacity:  30%
X:        0
Y:        4pt
Blur:     8pt
Spread:   0
```

#### Button Shadow (Pressed)
```
Color:    Black
Opacity:  20%
X:        0
Y:        2pt
Blur:     4pt
Spread:   0
```

#### Elevated Shadow
```
Color:    Black
Opacity:  25%
X:        0
Y:        8pt
Blur:     16pt
Spread:   0
```

#### Avatar Shadow
```
Color:    Black
Opacity:  25%
X:        0
Y:        6pt
Blur:     12pt
Spread:   0
```

#### Floating Shadow (FAB)
```
Color:    Primary Color
Opacity:  40%
X:        0
Y:        8pt
Blur:     24pt
Spread:   0
```

---

## ⚡ Animations

### Spring Animation (Default)
```swift
Response:        0.3 seconds
Damping:         0.6
Blend Duration:  0
```

### Timing Curves
```
Ease In Out:  Default for most transitions
Ease Out:     For appearing elements
Ease In:      For disappearing elements
Spring:       For interactive elements
```

### Duration Scale
```
Fast:    0.2s  - Immediate feedback (hover, press)
Medium:  0.3s  - Default transitions
Slow:    0.5s  - Significant changes
Custom:  0.6s  - Spring damping
```

### Common Animations
```
Button Press:     Scale 0.95, duration 0.2s
Icon Bounce:      Scale 1.0 → 1.2 → 1.0, spring
Sheet Present:    Slide up, duration 0.3s
Modal Dismiss:    Fade + slide down, duration 0.3s
Loading:          Rotating, continuous
Skeleton:         Shimmer, 1.5s loop
```

---

## 🧩 Component Library

### Buttons

#### Primary Button
```
Height:          50pt
Padding:         16pt horizontal
Corner Radius:   12pt
Background:      Linear gradient (category colors)
Text:            Body weight Bold, White
Shadow:          Button shadow
Press Effect:    Scale to 0.95
```

#### Secondary Button
```
Height:          50pt
Padding:         16pt horizontal
Corner Radius:   12pt
Background:      Glass effect
Border:          1pt white 20%
Text:            Body weight Semibold, Primary
Press Effect:    Scale to 0.95
```

#### Icon Button
```
Size:            44 × 44pt
Corner Radius:   12pt
Background:      Glass effect
Icon:            SF Symbol, 20pt
Press Effect:    Scale to 0.95
```

### Cards

#### Product Card
```
Width:           Fill available
Height:          Auto (min 200pt)
Corner Radius:   14pt
Background:      Glass effect
Padding:         16pt
Shadow:          Card shadow
Image Height:    200pt with gradient overlay
```

#### Message Card
```
Max Width:       75% of screen
Padding:         12pt
Corner Radius:   18pt (left/right varies)
Background:      Gradient (sent) or Glass (received)
Shadow:          None
```

#### Profile Card
```
Width:           Fill
Height:          Auto
Corner Radius:   12pt
Padding:         16pt
Background:      Glass effect
Shadow:          Card shadow
```

### Inputs

#### Text Field
```
Height:          50pt
Padding:         16pt horizontal
Corner Radius:   10pt
Background:      Glass effect
Border:          1pt separator color
Placeholder:     Secondary label color
Text:            Body, Primary
Focus Border:    2pt, Primary color
```

#### Search Field
```
Height:          44pt
Padding:         12pt horizontal, 8pt vertical
Corner Radius:   12pt
Background:      Secondary system background
Icon:            Leading magnifying glass, 18pt
Clear Button:    Trailing, when typing
```

### Navigation

#### Tab Bar
```
Height:          83pt (49pt bar + 34pt safe area)
Background:      Ultra thin material + blur
Border Top:      0.5pt separator
Icon Size:       24pt
Label:           Caption 2
Spacing:         4pt (icon to label)
Selected:        Primary color
Unselected:      Secondary label
```

#### Navigation Bar
```
Height:          44pt (+ status bar)
Background:      Ultra thin material
Title:           Title 2, Bold
Buttons:         Body, Primary color
Shadow:          None (uses material)
```

### Avatars

#### Small (32pt)
```
Size:            32 × 32pt
Corner Radius:   50%
Border:          1pt white 30%
Shadow:          None
```

#### Medium (48pt)
```
Size:            48 × 48pt
Corner Radius:   50%
Border:          2pt white 30%
Gradient:        Optional overlay
Shadow:          Light avatar shadow
```

#### Large (80-100pt)
```
Size:            80-100 × 80-100pt
Corner Radius:   50%
Border:          3pt white 40%
Gradient:        Multi-layer overlay
Shadow:          Avatar shadow
```

### Chips/Tags

#### Category Chip
```
Height:          32pt
Padding:         12pt horizontal
Corner Radius:   20pt (full pill)
Background:      Gradient (selected) or Glass (unselected)
Text:            Footnote, Semibold
Icon:            16pt SF Symbol (leading)
Press Effect:    Scale 0.97
Selected Shadow: Card shadow
```

#### Status Badge
```
Height:          24pt
Padding:         8pt horizontal
Corner Radius:   12pt
Background:      Semantic color
Text:            Caption 1, Semibold, White
```

---

## 📱 Screen Specifications

### iPhone Safe Areas
```
Status Bar:      59pt (with Dynamic Island)
Top Safe Area:   59pt
Bottom Safe Area: 34pt (with gesture bar)
Side Margins:    16pt (default)
```

### Common Layouts

#### List Item
```
Height:          Min 60pt
Padding:         16pt horizontal, 12pt vertical
Divider:         Full width, 0.5pt separator
Leading Icon:    40pt circle
Trailing Icon:   24pt icon or chevron
```

#### Grid Item (2 columns)
```
Columns:         2
Spacing:         12pt
Aspect Ratio:    1:1 or 3:4
Card Style:      Product card specs
```

#### Form Section
```
Spacing:         8pt between inputs
Section Gap:     24pt
Label:           Footnote, Secondary
Input:           Text field specs
Helper Text:     Caption 1, Secondary
```

---

## 🎯 iOS-Specific Guidelines

### Touch Targets
```
Minimum:         44 × 44pt (Apple HIG)
Comfortable:     50 × 50pt
Icon Buttons:    44 × 44pt
Large Buttons:   50-60pt height
```

### Gestures
```
Tap:            Primary action
Long Press:     Context menu (0.5s)
Swipe:          Navigation or delete
Pan:            Scroll
Pinch:          Zoom
Edge Swipe:     Back navigation
```

### Accessibility
```
Dynamic Type:    Support all sizes
Min Contrast:    4.5:1 for text
Touch Target:    Min 44pt
VoiceOver:       All interactive elements labeled
Color:           Don't rely solely on color
```

---

## 🔍 Component States

### All Interactive Components Should Have:

#### Default State
- Normal appearance
- No interaction

#### Hover State (iPad)
- Subtle highlight
- Cursor changes

#### Pressed State
- Scale to 0.95-0.97
- Slight opacity change
- Immediate feedback

#### Disabled State
- 40% opacity
- No interaction
- Cursor default

#### Loading State
- Progress indicator
- Disabled interaction
- Loading text/animation

#### Error State
- Red accent color
- Error icon
- Helper text in red

#### Success State
- Green accent color
- Checkmark icon
- Success message

---

## 📊 Grid System

### Layout Grid
```
Columns:        2-4 (depends on content)
Gutter:         12-16pt
Margin:         16pt (sides)
Baseline:       8pt
```

### Breakpoints
```
iPhone SE:      375pt width
iPhone 15:      393pt width
iPhone 15 Pro:  393pt width
iPhone 15 Max:  430pt width
```

---

## 🎨 Dark Mode Adaptations

### Automatic Adjustments
- Use semantic colors (Label, Background, etc.)
- Reduce pure white/black
- Adjust shadows for visibility
- Increase border opacity slightly

### Glass Effect in Dark Mode
```
Fill:       White at 8% opacity (vs 10%)
Border:     White at 25% opacity (vs 20%)
Blur:       Same (Ultra Thin Material adapts)
```

---

## 📝 Usage Notes

### When Designing in Figma:

1. **Use these exact values** for consistency
2. **Create styles** for all colors, text, effects
3. **Build components** that match these specs
4. **Test in dark mode** by duplicating screens
5. **Consider all states** for interactive elements
6. **Use SF Symbols** for all icons
7. **Apply constraints** for responsive behavior

### When Implementing in SwiftUI:

1. **Reference this document** for exact values
2. **Use semantic colors** when possible
3. **Build reusable components** that match Figma
4. **Test on multiple devices** and sizes
5. **Support dark mode** automatically
6. **Add haptic feedback** where appropriate
7. **Follow iOS HIG** for platform-specific behavior

---

**This is your single source of truth for design tokens! 🎨**

Keep this synced between Figma and SwiftUI for a consistent design system.


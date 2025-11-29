# Figma Quick Start Checklist

Get your Giftem app into Figma in 30 minutes! Follow this checklist step-by-step.

---

## ⏱️ 30-Minute Setup

### Part 1: Capture Current App (5 mins)

- [ ] **Open your app in Xcode**
  ```bash
  cd /Users/isaiahjones/Desktop/giftem
  open giftem.xcodeproj
  ```

- [ ] **Run on iPhone 15 Pro simulator** (⌘ + R)

- [ ] **Take screenshots** (⌘ + S in simulator)
  - [ ] Feed View
  - [ ] Search View
  - [ ] Messages View (inbox)
  - [ ] Messages View (conversation)
  - [ ] Cart View
  - [ ] Profile View
  - [ ] Quote Feed
  - [ ] Workout List
  - [ ] Product Detail

- [ ] **Find screenshots** (they're on your Desktop)
  - Create a folder: `Giftem Screenshots`
  - Move all screenshots there

---

### Part 2: Create Figma File (5 mins)

- [ ] **Go to** [figma.com](https://figma.com)

- [ ] **Create new design file**
  - Click "New design file"
  - Name it: "Giftem App Design"

- [ ] **Set up pages** (left sidebar)
  - Rename "Page 1" to "📱 Screens"
  - Add new page: "🎨 Design System"
  - Add new page: "🧩 Components"

- [ ] **Add iPhone frames**
  - Press `F` for Frame tool
  - Choose "iPhone 15 Pro" from right panel
  - Create 5 frames (one for each tab)
  - Name them: Feed, Search, Messages, Cart, Profile

---

### Part 3: Import Screenshots (3 mins)

- [ ] **Drag screenshots into Figma**
  - Select first frame (Feed)
  - Drag corresponding screenshot into it
  - Resize to fit frame exactly
  - Lock layer (⌘ + Shift + L)
  - Set opacity to 50%

- [ ] **Repeat for all screens**
  - This gives you a reference to design over

---

### Part 4: Install Essential Plugins (2 mins)

- [ ] **Open Plugins menu**
  - Menu → Plugins → Browse plugins in Community

- [ ] **Install these plugins:**
  - [ ] "SF Symbols" by Brian Lovin
  - [ ] "iOS 18 Design Kit" (search in Community)
  - [ ] "Stark" (accessibility checker)

---

### Part 5: Create Design System (15 mins)

#### Colors (5 mins)

- [ ] **Go to "🎨 Design System" page**

- [ ] **Create color swatches**
  - Press `R` for Rectangle
  - Draw 8 squares (100×100pt each)
  - Fill with your app colors:
    ```
    Blue:   #007AFF
    Pink:   #FF2D55
    Green:  #34C759
    Orange: #FF9500
    Purple: #AF52DE
    Red:    #FF3B30
    Teal:   #5AC8FA
    Yellow: #FFCC00
    ```

- [ ] **Create color styles**
  - Select first rectangle
  - Click fill color → 4-dot icon → Create style
  - Name: "Colors/Primary/Blue"
  - Repeat for all colors

#### Typography (5 mins)

- [ ] **Create text samples**
  - Press `T` for Text
  - Type: "Headline Text"
  - Font: SF Pro Display
  - Weight: Bold
  - Size: 28pt

- [ ] **Create text style**
  - Select text → Properties
  - Click 4-dot icon next to "Text" → Create style
  - Name: "Text/Headline"

- [ ] **Create more text styles:**
  - [ ] Title (22pt, Semibold)
  - [ ] Body (17pt, Regular)
  - [ ] Caption (12pt, Regular)

#### Effects (5 mins)

- [ ] **Create glassmorphism effect**
  - Draw rectangle
  - Fill: White at 10%
  - Effects → + → Background Blur (40)
  - Stroke: 1pt, White at 20%
  - Select Effects → 4-dot icon → Create style
  - Name: "Effects/Glass"

- [ ] **Create card shadow**
  - Draw rectangle
  - Effects → + → Drop Shadow
  - Set: X=0, Y=4, Blur=8, Color=Black 30%
  - Create style: "Shadows/Card"

---

## 🎯 You're Ready!

You now have:
- ✅ Figma file set up
- ✅ Screenshots imported
- ✅ Basic design system
- ✅ Essential plugins

---

## 🚀 Next Steps (Do Later)

### Build Your First Component (20 mins)

**Create a Liquid Glass Card:**

1. **Draw the card**
   - Press `R` for Rectangle
   - Size: 343 × 200pt
   - Corner radius: 12pt
   - Apply "Effects/Glass" style
   - Apply "Shadows/Card" style

2. **Add content**
   - Add image placeholder (160×160pt)
   - Add title using "Text/Title" style
   - Add description using "Text/Body" style
   - Add icon using SF Symbols plugin

3. **Make it a component**
   - Select all layers
   - Right-click → Create Component (⌘ + Option + K)
   - Name: "Cards/Product Card"

4. **Use it!**
   - Press `Option` and drag to duplicate
   - Or find it in Assets panel (left sidebar)

---

### Design Your First New Screen (30 mins)

Pick one screen to redesign:

**Example: Enhanced Quote Feed**

1. **Create new frame**
   - Press `F` → iPhone 15 Pro
   - Name: "Quote Feed - New Design"

2. **Design the header**
   - Add navigation bar (44pt height)
   - Title: "Quotes"
   - Add button with SF Symbol

3. **Design a quote card**
   - Glass effect background
   - Quote text (large, centered)
   - Author name (small, bottom)
   - Action buttons (like, share)

4. **Add to your screens**
   - Duplicate card several times
   - Create scrolling list effect

5. **Add interactions** (optional)
   - Select a card
   - Prototype tab (right panel)
   - Drag to another screen
   - Set transition: "Smart Animate"

---

## 💡 Pro Tips

### Keyboard Shortcuts

```
V - Move tool
R - Rectangle
O - Ellipse (circle)
T - Text
F - Frame
K - Scale
⌘ + D - Duplicate
⌘ + G - Group
⌘ + Shift + K - Place image
⌘ + / - Search (most useful!)
```

### Quick Actions

- **Copy CSS/iOS specs:**
  - Select element → Inspect tab → Copy values

- **Create components fast:**
  - Select layers → ⌘ + Option + K

- **Apply multiple fills:**
  - Fill → + icon → Add gradient over color

- **Auto Layout:**
  - Select layers → Shift + A
  - Makes responsive designs

### Resources at Your Fingertips

**Everything is documented here:**
- `DESIGN_SYSTEM.md` - All your current design tokens
- `FIGMA_WORKFLOW.md` - Complete workflow guide

**Need inspiration?**
- Browse Community files (search "iOS app")
- Check "iOS 18 Design Kit"
- Look at Apple's own apps

---

## ❓ Common Questions

**Q: I don't see SF Pro font in Figma?**
- A: Install SF Pro on your Mac first
- Download: [Apple Fonts](https://developer.apple.com/fonts/)
- Restart Figma

**Q: How do I make gradients?**
- A: Click fill → Solid → Linear
- Adjust color stops by clicking on gradient bar

**Q: Can I export designs back to Xcode?**
- A: Not directly, but you can:
  - Export images/icons
  - Copy specs manually
  - Use plugins like "Figma to SwiftUI"

**Q: How do I prototype?**
- A: Switch to Prototype tab (top right)
- Connect screens with blue connectors
- Set transition type
- Press Play (▶️) to test

**Q: Is there a mobile app?**
- A: Yes! Figma has iOS/iPad apps
- Great for reviewing designs on device
- Can't edit as easily as desktop

---

## 📞 Need Help?

- [Figma Help Center](https://help.figma.com)
- [Figma YouTube Channel](https://www.youtube.com/c/Figmadesign)
- [Figma Community Forum](https://forum.figma.com)

---

## ✅ Checklist Complete?

If you've finished the 30-minute setup, you're ready to start designing!

**What to do next:**
1. Play around with your screens
2. Try recreating one component
3. Watch a Figma tutorial (optional)
4. Start designing new features!

**Remember:** Design is iterative. Start simple, iterate, and improve! 🎨

---

**Happy designing! 🚀**


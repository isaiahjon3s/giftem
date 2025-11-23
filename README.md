# Giftem 🎁

A beautiful iOS social shopping and quotes app built with SwiftUI, featuring Apple's latest **Liquid Glass** design principles.

<div align="center">

![iOS](https://img.shields.io/badge/iOS-18.0+-000000?style=flat&logo=apple&logoColor=white)
![Swift](https://img.shields.io/badge/Swift-6.0+-F05138?style=flat&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-3.0+-0066CC?style=flat&logo=swift&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-17.0+-147EFB?style=flat&logo=xcode&logoColor=white)

</div>

## ✨ Features

### 📱 Core Features
- **Quote Sharing** - Share inspirational quotes and view quotes from other users
- **Social Feed** - Browse products and posts in a beautiful feed interface
- **Direct Messaging** - Complete DM system with real-time chat
- **E-Commerce** - Shop products with cart and checkout functionality
- **Fitness Tracking** - Create and track workout routines
- **User Profiles** - View and customize user profiles

### 🎨 Premium UI/UX
- **Liquid Glass Design** - Apple's latest translucent, depth-rich design language
- **Smooth Animations** - Physics-based spring animations throughout
- **Glassmorphism** - Beautiful ultra-thin material backgrounds
- **Rich Gradients** - Multi-color gradients on cards and buttons
- **Interactive Feedback** - Scale effects and haptic feedback on all interactions

### 💬 Messaging System
- One-on-one conversations
- Unread badges and indicators
- Message search functionality
- Auto-scroll chat interface
- Profile integration - message from any user profile

### 🔔 Notifications
- Local push notifications
- Multiple notification types (messages, followers, comments, likes)
- Badge counts
- Notification history

### 🏋️ Workout Features
- Create custom workouts
- Add exercises with sets and reps
- Track workout sessions
- View workout history
- Edit and manage routines

## 🏗️ Architecture

### Project Structure
```
giftem/
├── giftem/
│   ├── giftemApp.swift          # App entry point
│   ├── ContentView.swift        # Main tab navigation
│   ├── Models/                  # Data models
│   │   ├── UserModel.swift
│   │   ├── ProductModel.swift
│   │   ├── PostModel.swift
│   │   ├── MessageModel.swift
│   │   ├── QuoteModels.swift
│   │   └── WorkoutModels.swift
│   ├── Managers/               # Business logic & data management
│   │   ├── UserDataManager.swift
│   │   ├── ProductDataManager.swift
│   │   ├── MessageDataManager.swift
│   │   ├── NotificationManager.swift
│   │   ├── QuoteDataManager.swift
│   │   └── WorkoutDataManager.swift
│   ├── Views/                  # SwiftUI views
│   │   ├── FeedView.swift
│   │   ├── SearchView.swift
│   │   ├── MessagesView.swift
│   │   ├── CartView.swift
│   │   ├── ProfileView.swift
│   │   ├── QuoteFeedView.swift
│   │   ├── WorkoutListView.swift
│   │   └── ...
│   └── UI/                     # Reusable UI components
│       └── Components/
│           ├── Backgrounds/
│           ├── Buttons/
│           ├── Cards/
│           ├── Inputs/
│           ├── Modifiers/
│           └── Navigation/
└── giftem.xcodeproj/
```

### Design Pattern
- **Architecture**: MVVM (Model-View-ViewModel)
- **State Management**: ObservableObject, @Published, @StateObject
- **Navigation**: NavigationView with sheet presentations
- **Data Flow**: Environment objects for shared state

## 🚀 Getting Started

### Prerequisites
- macOS Ventura (13.0) or later
- Xcode 17.0 or later
- iOS 18.0+ deployment target
- Swift 6.0+

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/giftem.git
   cd giftem
   ```

2. **Open in Xcode**
   ```bash
   open giftem.xcodeproj
   ```

3. **Select a simulator**
   - Choose any iPhone simulator (iPhone 15 or later recommended)
   - Or connect your physical iOS device

4. **Build and Run**
   - Press `⌘ + R` or click the Run button
   - Wait for the build to complete
   - The app will launch on your selected device

### Development Setup

For the best development experience in Cursor or VS Code:

1. **Install SweetPad** (VS Code extension for iOS development)
   
2. **Configuration files are already set up:**
   - `.sweetpad.toml` - Build configuration
   - `buildServer.json` - Build server settings
   - `.vscode/settings.json` - VS Code settings

## 📱 App Navigation

The app features 5 main tabs:

1. **🏠 Feed** - Browse products and posts with liquid glass cards
2. **🔍 Search** - Find products and users
3. **💬 Messages** - Direct messaging with unread badges
4. **🛒 Cart** - Shopping cart and checkout
5. **👤 Profile** - User profile and settings

## 🎨 Liquid Glass Design System

### Core Design Principles
- **Translucency**: Ultra-thin material backgrounds
- **Depth**: Multiple layers with strategic shadows
- **Fluidity**: Smooth, physics-based animations
- **Clarity**: Clear visual hierarchy
- **Motion**: Spring animations (response: 0.3, damping: 0.6)

### Color Gradients
Each feature category has a unique gradient:
- 🔵 Electronics: Blue gradient
- 💗 Fashion: Pink gradient
- 🟢 Home: Green gradient
- 🌸 Beauty: Rose gradient
- 🔷 Sports: Cyan gradient
- 🟤 Books: Brown gradient
- 🟡 Toys: Yellow gradient
- 🟠 Food: Orange gradient

### Reusable Components
- `LiquidGlassCard` - Glassmorphic card container
- `LiquidGlassButton` - Gradient button with press effects
- `LiquidGlassTextField` - Beautiful input fields
- `LiquidGlassBackground` - Animated gradient backgrounds
- `LiquidGlassTabView` - Custom tab bar
- `LiquidGlassFAB` - Floating action button
- `LiquidGlassSlider` - Custom slider component

## 🛠️ Technical Details

### Technologies
- **Language**: Swift 6.0
- **Framework**: SwiftUI 3.0
- **Architecture**: MVVM
- **State Management**: Combine
- **Notifications**: UserNotifications framework
- **Icons**: SF Symbols 5.0

### Key Features Implementation
- **Lazy Loading**: `LazyVStack` and `LazyVGrid` for performance
- **Dark Mode**: Full support with adaptive colors
- **Dynamic Type**: Accessibility-ready text scaling
- **Animations**: `withAnimation(.spring())` throughout
- **Async/Await**: Modern concurrency for future API integration

### Best Practices
- ✅ Protocol-oriented programming
- ✅ Value types (structs) over classes
- ✅ Proper optionals handling
- ✅ Separation of concerns
- ✅ Reusable components
- ✅ Clean code with MARK comments
- ✅ No force unwrapping

## 🧪 Testing

### Run Tests
```bash
# Unit Tests
⌘ + U in Xcode

# UI Tests
Select giftemUITests scheme and press ⌘ + U
```

### Test Coverage
- `giftemTests/` - Unit tests
- `giftemUITests/` - UI automation tests

## 📦 Dependencies

This project uses no external dependencies - pure SwiftUI and native iOS frameworks:
- SwiftUI
- Combine
- UserNotifications
- Foundation

## 🎯 Future Enhancements

Potential features for future development:
- [ ] Backend API integration
- [ ] User authentication (Sign in/Sign up)
- [ ] Image upload and storage
- [ ] Push notifications (APNs)
- [ ] Payment integration
- [ ] Social features (follow/unfollow, likes)
- [ ] Advanced search filters
- [ ] Wishlist functionality
- [ ] User reviews and ratings
- [ ] Real-time messaging with WebSockets

## 📄 License

This project is available for personal and educational use.

## 👨‍💻 Author

Created by Isaiah Jones

## 🙏 Acknowledgments

- Design inspired by Apple's Human Interface Guidelines
- Liquid Glass design principles from Apple's latest UI paradigms
- SF Symbols for beautiful, consistent iconography

---

<div align="center">

**Built with ❤️ using SwiftUI**

</div>


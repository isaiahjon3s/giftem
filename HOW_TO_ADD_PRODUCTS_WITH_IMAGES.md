# 📸 Quick Guide: Add Products with Images in Xcode

## 🎯 Simple 4-Step Process

---

## Step 1: Get Your Product Images Ready

**What you need:**
- Product photos (any size, preferably 800×800px or larger)
- Square images work best
- PNG or JPG format

**Example:**
```
my-product1.png
my-product2.jpg
cool-shoes.png
```

---

## Step 2: Add Images to Xcode Assets

### Visual Steps:

1. **Open Xcode**
   ```bash
   open giftem.xcodeproj
   ```

2. **Navigate to Assets**
   ```
   Left Sidebar → giftem folder → Assets.xcassets
   ```

3. **Add Your Images**
   - **Drag and drop** your images into the Assets window
   - OR right-click in Assets → "New Image Set" → drag image in

4. **Name Each Image**
   - Click on the image set
   - Look at the name below (in Inspector on right)
   - Rename to something simple:
     - `product1`
     - `my-shoes`
     - `cool-watch`
   - **Write down these names!** ✍️

### Example:
```
Assets.xcassets/
├── product1        ← Your first product image
├── product2        ← Your second product image
├── product3        ← Your third product image
└── giftem-logo     ← Your logo (already there)
```

---

## Step 3: Edit ProductDataManager.swift

### Open the File:

**In Xcode Navigator:**
```
giftem → Managers → ProductDataManager.swift
```

### Find This Function (around line 19):

```swift
private func createMockProducts() {
    products = [
```

### Replace Everything Inside with Your Products:

```swift
private func createMockProducts() {
    products = [
        // Product 1
        Product(
            name: "My First Product",
            description: "This is an amazing product that everyone needs!",
            price: 99.99,
            originalPrice: 149.99,  // Optional: shows discount
            imageURLs: ["product1"],  // ← YOUR IMAGE NAME
            category: .electronics,
            sellerId: "my-store",
            rating: 5.0,
            reviewCount: 10,
            tags: ["awesome", "new", "trending"]
        ),
        
        // Product 2 - Copy and edit!
        Product(
            name: "Another Cool Item",
            description: "Second product description here",
            price: 49.99,
            imageURLs: ["product2"],  // ← DIFFERENT IMAGE
            category: .fashion,
            sellerId: "my-store",
            rating: 4.8,
            reviewCount: 25,
            tags: ["cool", "style"]
        ),
        
        // Add more by copying the pattern above!
    ]
}
```

---

## Step 4: Build and Run!

```bash
Press ⌘ + R in Xcode
```

**Your products with images appear in the feed! 🎉**

---

## 📋 Quick Reference: Product Properties

### Required Fields:
```swift
name: "Product Name"              // What it's called
description: "Product details"    // Full description
price: 99.99                      // Current price (decimal)
imageURLs: ["image-name"]         // From Assets (in quotes)
category: .electronics            // See categories below
sellerId: "store-name"            // Your store name
rating: 4.5                       // 1.0 to 5.0
reviewCount: 100                  // Number of reviews
tags: ["tag1", "tag2"]           // Search keywords
```

### Optional Fields:
```swift
originalPrice: 129.99  // Shows discount if higher than price
```

---

## 🏷️ Available Categories

Choose ONE for each product:

```swift
.electronics  // 📱 Tech, gadgets, phones, laptops
.fashion      // 👕 Clothes, shoes, accessories  
.home         // 🏠 Furniture, decor, appliances
.beauty       // 💄 Makeup, skincare, cosmetics
.sports       // ⚽ Fitness, equipment, activewear
.books        // 📚 Books, magazines, media
.toys         // 🎮 Games, toys, kids items
.food         // 🍕 Food, drinks, snacks
.other        // 📦 Everything else
```

---

## 🎨 What Each Category Looks Like in Feed

Each category has a unique color:

- **Electronics**: Blue gradient
- **Fashion**: Pink gradient  
- **Home**: Green gradient
- **Beauty**: Rose gradient
- **Sports**: Cyan gradient
- **Books**: Brown gradient
- **Toys**: Yellow gradient
- **Food**: Orange gradient

---

## ✏️ Product Template (Copy This!)

```swift
Product(
    name: "PRODUCT NAME HERE",
    description: "DETAILED DESCRIPTION OF YOUR PRODUCT",
    price: 00.00,
    originalPrice: 00.00,  // DELETE THIS LINE IF NO DISCOUNT
    imageURLs: ["your-image-name-from-assets"],
    category: .electronics,  // CHANGE TO YOUR CATEGORY
    sellerId: "your-store-name",
    rating: 5.0,
    reviewCount: 0,
    tags: ["keyword1", "keyword2"]
),
```

---

## 🔍 Example: Complete Product

```swift
Product(
    name: "Classic White Sneakers",
    description: "Comfortable all-day wear sneakers with premium leather upper and cushioned sole. Perfect for casual or light athletic use.",
    price: 89.99,
    originalPrice: 129.99,  // Shows as 31% off!
    imageURLs: ["white-sneakers"],  // Image in Assets
    category: .fashion,
    sellerId: "shoe-store",
    rating: 4.8,
    reviewCount: 234,
    tags: ["shoes", "sneakers", "white", "casual", "comfort"]
),
```

---

## 🐛 Common Issues

### Image Not Showing?

**Check:**
1. ✅ Image is in Assets.xcassets
2. ✅ Image name matches exactly (case-sensitive!)
3. ✅ Name is in quotes: `["image-name"]`
4. ✅ No file extension in code: `["product1"]` not `["product1.png"]`

**If still broken:**
- Clean build: Product → Clean Build Folder (⌘ + Shift + K)
- Rebuild: ⌘ + R

### Product Not Appearing?

**Check:**
1. ✅ Comma after each product (except last one)
2. ✅ All quotes are matching
3. ✅ parentheses are balanced
4. ✅ Saved the file (⌘ + S)

---

## 💡 Pro Tips

### 1. Start Simple
Begin with 2-3 products, then add more!

### 2. Use Descriptive Names
```swift
imageURLs: ["nike-shoe"]  // ✅ Clear
imageURLs: ["img1"]       // ❌ Confusing later
```

### 3. Test Categories
Each category looks different in the feed. Try a few to see what you like!

### 4. Add Tags
Tags help with search:
```swift
tags: ["sneakers", "nike", "white", "running", "sport"]
```

### 5. Realistic Ratings
Use ratings between 4.0-5.0 for best products:
```swift
rating: 4.8,  // Looks realistic and high quality
```

---

## 🎯 Your Action Plan

- [ ] **Step 1:** Prepare 2-3 product images
- [ ] **Step 2:** Add images to Assets.xcassets
- [ ] **Step 3:** Name images simply (product1, product2, etc.)
- [ ] **Step 4:** Open ProductDataManager.swift
- [ ] **Step 5:** Copy the template
- [ ] **Step 6:** Fill in your product details
- [ ] **Step 7:** Save (⌘ + S)
- [ ] **Step 8:** Build and run (⌘ + R)
- [ ] **Step 9:** See your products in the feed! 🎉

---

## 📝 Need More Help?

Check the example file I created:
**CUSTOM_PRODUCTS_EXAMPLE.swift**

It has:
- ✅ 3 complete example products
- ✅ Commented template to copy
- ✅ All the code you need

Just copy what you need and paste into ProductDataManager.swift!

---

**You're ready to add products with images! 🚀**

Start with 2-3 products and build from there!


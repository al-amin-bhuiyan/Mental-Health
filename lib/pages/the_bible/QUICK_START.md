# Quick Start Guide - The Bible Page

## 🚀 Quick Setup

### Step 1: Add Route (Optional - if not already added)
```dart
// In app_path.dart
static const String theBible = '/the-bible';
```

### Step 2: Import in Your Route File
```dart
import 'package:mental_health/pages/the_bible/bible_front/bible_front.dart';
```

### Step 3: Add GoRouter Route
```dart
// In your go_router configuration
GoRoute(
  path: 'the-bible',
  builder: (context, state) => const BibleFrontPage(),
),
```

### Step 4: Navigate to Page
```dart
context.push(AppPath.theBible); // Or direct path
context.push('/the-bible');      // Using path directly
```

## 📱 UI Layout

```
┌─────────────────────────────────┐
│  [Background Image]             │
│  ┌───────────────────────────┐  │
│  │  SafeArea                 │  │
│  │  ┌─────────────────────┐  │  │
│  │  │  The Bible (Header) │  │  │
│  │  └─────────────────────┘  │  │
│  │                           │  │
│  │  ┌─────────────────────┐  │  │
│  │  │ [📖] Genesis      → │  │  │ 120h
│  │  └─────────────────────┘  │  │
│  │  SizedBox(16.h)           │  │
│  │  ┌─────────────────────┐  │  │
│  │  │ [📖] Exodus       → │  │  │ 120h
│  │  └─────────────────────┘  │  │
│  │  SizedBox(16.h)           │  │
│  │  ┌─────────────────────┐  │  │
│  │  │ [📖] Leviticus    → │  │  │ 120h
│  │  └─────────────────────┘  │  │
│  │  SizedBox(16.h)           │  │
│  │  ┌─────────────────────┐  │  │
│  │  │ [📖] Numbers      → │  │  │ 120h
│  │  └─────────────────────┘  │  │
│  │  SizedBox(16.h)           │  │
│  │  ┌─────────────────────┐  │  │
│  │  │ [📖] Joshua       → │  │  │ 120h
│  │  └─────────────────────┘  │  │
│  │  SizedBox(16.h)           │  │
│  │  ┌─────────────────────┐  │  │
│  │  │ [📖] Judges       → │  │  │ 120h
│  │  └─────────────────────┘  │  │
│  │  SizedBox(16.h)           │  │
│  │  ┌─────────────────────┐  │  │
│  │  │ [📖] Ruth         → │  │  │ 120h
│  │  └─────────────────────┘  │  │
│  │  SizedBox(100.h)          │  │
│  └───────────────────────────┘  │
│  [Navigation Bar]               │
└─────────────────────────────────┘
```

## 🎨 Card Detail Structure

```
┌────────────────────────────────────┐
│ [BG Image with Gradient Overlay]   │
│ ┌─────────────────────────────────┐│
│ │ [Icon] Title................... →││
│ │ [Box]  Genesis                   ││
│ └─────────────────────────────────┘│
│ 120h height, 16r radius           │
└────────────────────────────────────┘

Icon Box: 50x50
Icon: 28x28 white SVG
Title: White, Urbanist Bold, 20sp
Arrow: Material chevron_right
```

## 📦 File Components

### Generic Card Widget
- **File**: `lib/core/widgets/generic_card_widget.dart`
- **Type**: `GenericCardWidget<T>`
- **Properties**: 
  - `item`: Generic data
  - `backgroundImage`: Image path
  - `iconPath`: SVG icon path
  - `title`: Display text
  - `onTap`: Click callback
  - `height`, `cornerRadius`, `iconSize`, `titleFontSize`: Customization

### Bible Book Model
- **File**: `lib/pages/the_bible/models/bible_book_model.dart`
- **Class**: `BibleBook`
- **Properties**:
  - `title`: String (book name)
  - `backgroundImage`: String (asset path)
  - `bookIcon`: String (icon asset path)

### Bible Front Controller
- **File**: `lib/pages/the_bible/bible_front/bible_front_controller.dart`
- **Class**: `BibleFrontController extends GetxController`
- **Methods**:
  - `onInit()`: Initialize controller
  - `_initializeBibleBooks()`: Setup 7 books
  - `navigateToBibleBook()`: Navigate to book detail

### Bible Front Page
- **File**: `lib/pages/the_bible/bible_front/bible_front.dart`
- **Class**: `BibleFrontPage extends StatelessWidget`
- **Components**:
  - Header with "The Bible" title
  - List of books using GenericCardWidget
  - CustomNavBar at bottom

## 🔄 Data Flow

```
BibleFrontPage
    ↓
Gets BibleFrontController
    ↓
Controller initializes BibleBooks list
    ↓
Build method loops through books
    ↓
GenericCardWidget renders each book
    ↓
User taps card
    ↓
onTap callback triggers navigation
```

## 🎯 Assets Mapping

```
Bible Book → Background Image → Icon
Genesis    → genesis_background → book_title_icon
Exodus     → exodus_background  → book_title_icon
Leviticus  → leviticus_background → book_title_icon
Numbers    → numbers_background → book_title_icon
Joshua     → joshua_background  → book_title_icon
Judges     → judges_background  → book_title_icon
Ruth       → ruth_background    → book_title_icon
```

## 🎨 Color & Typography

### Colors
- **Background**: onBoardingImage
- **Text**: White (#FFFFFF)
- **Icon Container**: White with 0.15 alpha
- **Gradient Overlay**: Black 0.3 to 0.5 alpha

### Typography
- **Header**: Urbanist Bold, 24sp, White
- **Card Title**: Urbanist Bold, 20sp, White
- **Font Family**: Urbanist (Custom from assets/fonts)

## 📐 Spacing & Sizing

| Element | Size |
|---------|------|
| Card Height | 120.h |
| Card Radius | 16.r |
| Icon Box | 50x50 |
| Icon | 28x28 |
| Spacing Between Cards | 16.h |
| Card Padding | 16.w all |
| Header Padding | 20.w horizontal, 16.h vertical |
| Page Padding | 20.w horizontal |

## ✅ Testing Checklist

- [ ] Page loads without errors
- [ ] All 7 books display
- [ ] Cards have correct images
- [ ] Icons display properly
- [ ] Text is properly sized and colored
- [ ] Navigation bar appears at bottom
- [ ] Tapping card triggers callback
- [ ] Responsive on different screen sizes
- [ ] Background image shows correctly
- [ ] Gradient overlay is visible
- [ ] No compilation errors
- [ ] No warnings

## 🚨 Troubleshooting

### Cards not showing images?
- Check that image files exist in `assets/images/`
- Verify asset paths in `CustomAssets` class
- Check `pubspec.yaml` has assets listed

### Icons not appearing?
- Ensure SVG file exists at `assets/icons/book_title_icon.svg`
- Verify flutter_svg dependency is added
- Check SVG file is valid

### Navigation not working?
- Implement the navigation method in controller
- Add route in GoRouter configuration
- Verify AppPath constants are correct

### Text overflow?
- Wrapped in `Expanded` widget
- Set `maxLines: 1` with `overflow: TextOverflow.ellipsis`

## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [GetX Documentation](https://github.com/jonataslaw/getx)
- [GoRouter Documentation](https://pub.dev/packages/go_router)
- [ScreenUtil Documentation](https://pub.dev/packages/flutter_screenutil)

---

**Status**: ✅ Ready to Use
**Test Coverage**: Ready for QA
**Documentation**: Complete


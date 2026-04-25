# 🧠 Quiz Master - Flutter Quiz App

A beautiful, multi-screen Flutter quiz app with dark theme, grid layouts, animations, and more.

## 📱 Screens

1. **Splash Screen** — Animated logo + loading on launch
2. **Home Screen** — Grid of 4 quiz categories with animated cards
3. **Quiz Screen** — Question display with 2×2 grid options, timer, and explanations
4. **Result Screen** — Score breakdown with grade, stats grid, and performance bars
5. **Leaderboard Screen** — Podium view + ranked list

## 🚀 Getting Started

### Prerequisites
- Flutter SDK ≥ 3.0.0 (https://flutter.dev/docs/get-started/install)
- Dart SDK ≥ 3.0.0
- Android Studio / VS Code with Flutter plugin

### Run the App

```bash
# 1. Navigate to project
cd quiz_app

# 2. Get dependencies
flutter pub get

# 3. Run on connected device or emulator
flutter run

# 4. Build APK
flutter build apk --release
```

## 🗂️ Project Structure

```
quiz_app/
├── lib/
│   ├── main.dart                  # App entry + Splash screen
│   ├── models/
│   │   ├── app_theme.dart         # Dark theme & color constants
│   │   ├── quiz_model.dart        # Data models (Category, Question, Result)
│   │   └── quiz_data.dart         # All quiz questions & categories
│   └── screens/
│       ├── home_screen.dart       # Category grid (Home)
│       ├── quiz_screen.dart       # Quiz gameplay
│       ├── result_screen.dart     # Results & score
│       └── leaderboard_screen.dart # Leaderboard
├── assets/
│   └── images/                    # Category images
│       ├── science.png
│       ├── history.png
│       ├── technology.png
│       ├── geography.png
│       ├── logo.png
│       └── banner.png
└── pubspec.yaml
```

## 🎯 Features

- ✅ Multi-screen navigation with page transitions
- ✅ Grid layout for categories (2×2) and answer options (2×2)
- ✅ Countdown timer per question (20 seconds)
- ✅ Animated cards with entrance animations
- ✅ Correct/Wrong answer feedback with explanations
- ✅ Score, grade, and performance summary
- ✅ Leaderboard with podium view
- ✅ Dark gradient theme throughout
- ✅ setState-based dynamic UI updates
- ✅ 4 categories × 5 questions = 20 total questions

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
```

No third-party packages needed — pure Flutter!

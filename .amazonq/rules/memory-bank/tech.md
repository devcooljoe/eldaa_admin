# ELDAA Technology Stack

## Core Framework
- **Flutter 3.29.3** - Cross-platform mobile development framework
- **Dart SDK ^3.7.0** - Programming language for Flutter applications

## State Management & Architecture
- **hooks_riverpod ^2.6.1** - Reactive state management and dependency injection
- **flutter_hooks ^0.21.2** - React-like hooks for Flutter widgets

## UI & Design
- **flutter_screenutil ^5.9.3** - Responsive screen adaptation
- **flutter_svg ^2.1.0** - SVG rendering support
- **lottie ^3.3.1** - Animation support for Lottie files
- **cached_network_image ^3.4.1** - Optimized network image loading
- **cupertino_icons ^1.0.8** - iOS-style icons

## User Input & Forms
- **pin_code_fields ^8.0.1** - PIN code input fields
- **syncfusion_flutter_datepicker ^29.2.4** - Advanced date picker component

## Utilities
- **intl ^0.20.2** - Internationalization and localization support

## Development Tools
- **flutter_lints ^5.0.0** - Dart linting rules for code quality
- **flutter_test** - Testing framework for unit and widget tests

## Version Management
- **FVM (Flutter Version Management)** - Flutter version control
  - Configured for Flutter 3.29.3
  - Ensures consistent development environment

## Build Systems

### Android
- **Gradle 8.10.2** with Kotlin DSL
- **Android Gradle Plugin** for build automation
- **Kotlin** for native Android components
- **CMake** for native C/C++ code compilation

### iOS
- **Xcode** project configuration
- **CocoaPods** for dependency management
- **Swift** for native iOS components
- **Objective-C** bridging support

## Asset Management
- **Custom Fonts**: Urbanist font family (9 weight variants)
- **SVG Icons**: Scalable vector graphics for UI elements
- **Images**: PNG assets for illustrations and branding
- **Animations**: Lottie JSON files for loading states

## Development Commands

### Setup
```bash
# Install dependencies
flutter pub get

# Generate platform-specific files
flutter pub run build_runner build
```

### Development
```bash
# Run in debug mode
flutter run

# Run with specific device
flutter run -d <device_id>

# Hot reload during development
# Press 'r' in terminal or use IDE hot reload
```

### Building
```bash
# Build Android APK
flutter build apk

# Build Android App Bundle
flutter build appbundle

# Build iOS (requires macOS and Xcode)
flutter build ios
```

### Testing
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Code Quality
```bash
# Analyze code
flutter analyze

# Format code
dart format .
```

## Platform Requirements

### Development Environment
- **Flutter SDK 3.29.3** (managed via FVM)
- **Dart SDK ^3.7.0**
- **Android Studio** or **VS Code** with Flutter extensions

### Android Development
- **Android SDK** (API level 21+)
- **Java 11** or higher
- **Gradle 8.10.2**

### iOS Development (macOS only)
- **Xcode 14+**
- **iOS 12.0+** deployment target
- **CocoaPods** for dependency management

## Configuration Files
- **`pubspec.yaml`** - Package dependencies and asset configuration
- **`.fvmrc`** - Flutter version specification
- **`analysis_options.yaml`** - Dart analyzer configuration
- **`android/build.gradle.kts`** - Android build configuration
- **`ios/Podfile`** - iOS dependency configuration
# ELDAA Development Guidelines

## Code Quality Standards

### File Organization & Naming
- Use **snake_case** for file and directory names (`forgot_password_screen.dart`, `transaction_pin_screen.dart`)
- Organize files by feature in dedicated directories (`auth/`, `dashboard/`, `savings/`)
- Group related functionality in subdirectories (`forgot_password/`, `target_saving/`)
- Use descriptive, purpose-driven naming that clearly indicates functionality

### Documentation Standards
- Include comprehensive header comments for generated files with clear warnings
- Use **JavaDoc-style comments** for class and method documentation
- Add inline comments for complex business logic and security-sensitive code
- Maintain clear separation between generated and custom code with explicit markers

### Import Organization
- Group imports by type: Flutter framework, third-party packages, local imports
- Use explicit imports rather than wildcard imports
- Maintain consistent import ordering across all files
- Separate platform-specific imports clearly

## Platform-Specific Patterns

### Android Development
- **Package Structure**: Follow reverse domain naming (`com.example.eldaa`)
- **Kotlin Classes**: Use concise class declarations extending Flutter components
- **Plugin Registration**: Implement robust error handling with try-catch blocks and logging
- **Annotations**: Use `@Keep` for classes that should not be obfuscated
- **Error Handling**: Include detailed error logging with plugin names and exception details

```kotlin
// Standard MainActivity pattern
class MainActivity : FlutterActivity()

// Plugin registration with error handling
try {
    flutterEngine.getPlugins().add(new PluginClass());
} catch (Exception e) {
    Log.e(TAG, "Error registering plugin", e);
}
```

### iOS Development
- **Swift Classes**: Use `@main` and `@objc` annotations for app delegates
- **Inheritance**: Extend `FlutterAppDelegate` for standard Flutter integration
- **Method Overrides**: Always call super methods in lifecycle callbacks
- **Header Files**: Use include guards and proper Objective-C bridging
- **Nullability**: Use `NS_ASSUME_NONNULL_BEGIN/END` for safer code

```swift
// Standard AppDelegate pattern
@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```

## Flutter-Specific Conventions

### Widget Architecture
- Separate screens into dedicated files with clear naming (`home_screen.dart`, `login_screen.dart`)
- Use feature-based directory organization for scalability
- Implement reusable widgets in shared widget directories
- Follow StatelessWidget/StatefulWidget patterns appropriately

### State Management
- Use **Riverpod** for dependency injection and state management
- Implement **Flutter Hooks** for widget lifecycle management
- Maintain clear separation between UI and business logic
- Use providers for shared application state

### Asset Management
- Organize assets by type in dedicated directories (`images/`, `icons/`, `fonts/`)
- Use SVG format for scalable icons and graphics
- Implement proper asset loading with error handling
- Follow consistent naming conventions for asset files

## Security & Best Practices

### Authentication Flow
- Implement multi-step verification processes with clear navigation
- Use secure input methods for sensitive data (PIN, passwords)
- Validate all user inputs before processing
- Implement proper session management and timeout handling

### Data Handling
- Use secure storage for sensitive information
- Implement proper validation helpers for user input
- Handle network requests with appropriate error handling
- Use encrypted communication for financial data

### Testing Standards
- Write unit tests for business logic components
- Implement widget tests for UI components
- Use descriptive test names that explain the expected behavior
- Include edge case testing for financial calculations

```dart
// Standard test structure
class RunnerTests: XCTestCase {
  func testExample() {
    // Clear test implementation with descriptive naming
  }
}
```

## Code Style Guidelines

### Formatting
- Use consistent indentation (2 spaces for Dart, 4 for Java/Kotlin)
- Maintain line length limits (80-100 characters)
- Use trailing commas for better version control diffs
- Apply consistent spacing around operators and brackets

### Error Handling
- Implement comprehensive error handling with user-friendly messages
- Use logging for debugging and monitoring
- Provide fallback mechanisms for critical functionality
- Handle network failures gracefully with retry mechanisms

### Performance Optimization
- Use `const` constructors where possible for better performance
- Implement lazy loading for large datasets
- Optimize image loading with caching mechanisms
- Use efficient state management to minimize rebuilds

## Development Workflow

### Version Control
- Use meaningful commit messages that describe changes clearly
- Implement feature branch workflow for new functionality
- Review code changes before merging to main branch
- Maintain clean commit history with logical grouping

### Build & Deployment
- Use FVM for consistent Flutter version management
- Implement proper build configurations for different environments
- Test on multiple devices and screen sizes
- Follow platform-specific deployment guidelines

### Code Review Standards
- Review for security vulnerabilities in financial operations
- Ensure proper error handling and user feedback
- Verify responsive design across different screen sizes
- Check for proper state management implementation
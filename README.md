# ConnectAuth Swift SDK

A lightweight Swift authentication library designed for easy integration via Swift Package Manager.

## Features

- 🔐 Simple authentication management
- 🎫 Token generation and refresh
- 👤 User session management
- 📊 Status monitoring
- ✅ iOS 14+ and macOS 12+ support

## Installation

### Swift Package Manager

Add this to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/connect-auth-swift.git", from: "1.0.0")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: ["ConnectAuth"]
    )
]
```

Or use Xcode: File → Add Packages → Enter the repository URL

## Usage

### Basic Setup

```swift
import ConnectAuth

// Get the shared instance
let auth = ConnectAuth.shared

// Initialize with your API key
auth.initialize(apiKey: "your-api-key")

// Login a user
auth.login(userId: "user-123")

// Check authentication status
if auth.isAuthenticated {
    print("User logged in: \(auth.currentUserId ?? "")")
    print("Token: \(auth.currentToken ?? "")")
}
```

### Available Methods

```swift
// Initialize SDK
auth.initialize(apiKey: "your-key")

// Authentication
auth.login(userId: "user-id")
auth.logout()

// Token Management
auth.refreshToken() -> Bool
auth.currentToken -> String?

// Status
auth.isAuthenticated -> Bool
auth.currentUserId -> String?
auth.printStatus()

// Utilities
auth.getVersion() -> String
auth.testConnection() -> Bool
```

## Requirements

- Swift 5.9+
- iOS 14.0+
- macOS 12.0+

## Building

```bash
swift build
```

## Testing

```bash
swift test
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

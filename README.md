# ConnectAuth Swift SDK

Simple Swift Package for authentication testing on SPM.

## Installation

### Swift Package Manager

```swift
.package(url: "https://github.com/yourusername/connect-auth-swift.git", from: "1.0.0")
```

## Usage

```swift
import ConnectAuth

let auth = ConnectAuth.shared
auth.initialize(apiKey: "your-key")
auth.login(userId: "user-123")

if auth.isAuthenticated {
    print("Logged in! Token: \(auth.currentToken ?? "")")
}

auth.logout()
```

## Building

```bash
swift build
```

## Testing

```bash
swift test
```

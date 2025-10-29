import Foundation

public class ConnectAuth {
    public static let shared = ConnectAuth()

    private var token: String?
    private var userId: String?
    private var apiKey: String?
    private var isInitialized: Bool = false

    private init() {
        print("[ConnectAuth] 🚀 Initialized ConnectAuth SDK v1.0.0")
    }

    /// Initialize SDK with API key
    public func initialize(apiKey: String) {
        self.apiKey = apiKey
        self.isInitialized = true
        print("[ConnectAuth] 🔑 SDK initialized with API key: \(apiKey.prefix(5))...")
        printStatus()
    }

    /// Login user
    public func login(userId: String) {
        guard isInitialized else {
            print("[ConnectAuth] ❌ Error: SDK not initialized. Call initialize() first")
            return
        }

        self.userId = userId
        self.token = "token_\(UUID().uuidString)"
        print("[ConnectAuth] ✅ User '\(userId)' logged in successfully")
        print("[ConnectAuth] 🎫 Token: \(self.token!.prefix(20))...")
    }

    /// Logout user
    public func logout() {
        guard isInitialized else {
            print("[ConnectAuth] ❌ Error: SDK not initialized")
            return
        }

        guard let user = userId else {
            print("[ConnectAuth] ⚠️ Warning: No user logged in")
            return
        }

        self.token = nil
        self.userId = nil
        print("[ConnectAuth] 👋 User '\(user)' logged out")
    }

    /// Check if authenticated
    public var isAuthenticated: Bool {
        token != nil
    }

    /// Get current token
    public var currentToken: String? {
        token
    }

    /// Get current user ID
    public var currentUserId: String? {
        userId
    }

    /// Refresh token
    public func refreshToken() -> Bool {
        guard isInitialized else {
            print("[ConnectAuth] ❌ Error: SDK not initialized")
            return false
        }

        guard isAuthenticated else {
            print("[ConnectAuth] ❌ Error: User not authenticated")
            return false
        }

        let oldToken = self.token
        self.token = "token_\(UUID().uuidString)"
        print("[ConnectAuth] 🔄 Token refreshed")
        print("[ConnectAuth] 📝 Old token: \(oldToken!.prefix(20))...")
        print("[ConnectAuth] 🆕 New token: \(self.token!.prefix(20))...")
        return true
    }

    /// Print current status
    public func printStatus() {
        print("[ConnectAuth] 📊 === Current Status ===")
        print("[ConnectAuth] 🔧 Initialized: \(isInitialized)")
        print("[ConnectAuth] 👤 User ID: \(userId ?? "None")")
        print("[ConnectAuth] 🔐 Authenticated: \(isAuthenticated)")
        print("[ConnectAuth] 🔑 API Key: \(apiKey.map { $0.prefix(5) + "..." } ?? "None")")
        print("[ConnectAuth] =====================")
    }

    /// Get SDK version
    public func getVersion() -> String {
        let version = "1.0.0"
        print("[ConnectAuth] ℹ️ ConnectAuth version: \(version)")
        return version
    }

    /// Test function - prints a welcome message
    public func testConnection() -> Bool {
        print("[ConnectAuth] 🧪 Testing connection...")
        print("[ConnectAuth] ✓ Connection test successful!")
        return true
    }
}

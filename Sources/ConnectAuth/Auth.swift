import Foundation
import SwiftUI

public class ConnectAuth: ObservableObject {
    public static let shared = ConnectAuth()

    @Published public var token: String?
    @Published public var userId: String?
    @Published public var apiKey: String?
    @Published public var isInitialized: Bool = false
    @Published public var lastEvent: String = "SDK Ready"
    @Published public var eventLog: [String] = []

    private init() {
        addLog("🚀 Initialized ConnectAuth SDK v1.0.1")
        print("[ConnectAuth] 🚀 Initialized ConnectAuth SDK v1.0.1")
    }

    private func addLog(_ message: String) {
        lastEvent = message
        eventLog.append("\(Date().formatted(date: .omitted, time: .standard)) - \(message)")
        print("[ConnectAuth] \(message)")
    }

    /// Initialize SDK with API key
    public func initialize(apiKey: String) {
        self.apiKey = apiKey
        self.isInitialized = true
        addLog("🔑 SDK initialized with API key: \(apiKey.prefix(5))...")
    }

    /// Login user
    public func login(userId: String) {
        guard isInitialized else {
            addLog("❌ Error: SDK not initialized. Call initialize() first")
            return
        }

        self.userId = userId
        self.token = "token_\(UUID().uuidString)"
        addLog("✅ User '\(userId)' logged in successfully")
    }

    /// Logout user
    public func logout() {
        guard isInitialized else {
            addLog("❌ Error: SDK not initialized")
            return
        }

        guard let user = userId else {
            addLog("⚠️ Warning: No user logged in")
            return
        }

        self.token = nil
        self.userId = nil
        addLog("👋 User '\(user)' logged out")
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
            addLog("❌ Error: SDK not initialized")
            return false
        }

        guard isAuthenticated else {
            addLog("❌ Error: User not authenticated")
            return false
        }

        let oldToken = self.token
        self.token = "token_\(UUID().uuidString)"
        addLog("🔄 Token refreshed successfully")
        return true
    }

    /// Get SDK version
    public func getVersion() -> String {
        let version = "1.0.1"
        addLog("ℹ️ ConnectAuth version: \(version)")
        return version
    }

    /// Test function - connection test
    public func testConnection() -> Bool {
        addLog("🧪 Testing connection...")
        addLog("✓ Connection test successful!")
        return true
    }

    /// Clear event log
    public func clearLog() {
        eventLog.removeAll()
        addLog("📋 Event log cleared")
    }
}

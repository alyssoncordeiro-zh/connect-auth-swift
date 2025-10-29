import ConnectAuth

// Example of using ConnectAuth SDK

// Initialize the SDK
let auth = ConnectAuth.shared
auth.initialize(apiKey: "test_api_key_12345")

print("\n--- Testing login ---")
auth.login(userId: "user123")

print("\n--- Checking authentication status ---")
print("Is authenticated: \(auth.isAuthenticated)")
print("Current user: \(auth.currentUserId ?? "None")")
print("Current token: \(auth.currentToken?.prefix(20) ?? "None")...")

print("\n--- Testing refresh token ---")
_ = auth.refreshToken()

print("\n--- Printing status ---")
auth.printStatus()

print("\n--- Getting version ---")
let version = auth.getVersion()

print("\n--- Testing connection ---")
let connectionOK = auth.testConnection()

print("\n--- Logout ---")
auth.logout()

print("\n--- Final status ---")
auth.printStatus()

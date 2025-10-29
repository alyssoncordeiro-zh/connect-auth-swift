import XCTest
@testable import ConnectAuth

final class ConnectAuthTests: XCTestCase {
    func testSingleton() {
        let auth1 = ConnectAuth.shared
        let auth2 = ConnectAuth.shared
        XCTAssertTrue(auth1 === auth2)
    }

    func testLogin() {
        let auth = ConnectAuth.shared
        auth.login(userId: "user-123")
        XCTAssertTrue(auth.isAuthenticated)
        XCTAssertNotNil(auth.currentToken)
    }

    func testLogout() {
        let auth = ConnectAuth.shared
        auth.login(userId: "user-123")
        auth.logout()
        XCTAssertFalse(auth.isAuthenticated)
        XCTAssertNil(auth.currentToken)
    }
}

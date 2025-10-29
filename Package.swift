// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ConnectAuth",
    platforms: [
        .iOS(.v14),
        .macOS(.v12)
    ],
    products: [
        .library(name: "ConnectAuth", targets: ["ConnectAuth"]),
    ],
    targets: [
        .target(
            name: "ConnectAuth",
            path: "Sources/ConnectAuth"
        ),
        .testTarget(
            name: "ConnectAuthTests",
            dependencies: ["ConnectAuth"],
            path: "Tests/ConnectAuth"
        ),
    ]
)

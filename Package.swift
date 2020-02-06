// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "vaporWebSite",
    products: [
        .library(name: "vaporWebSite", targets: ["App"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        // 🔵 Swift ORM (queries, models, relations, etc) built on MYSQL.
        .package(url: "https://github.com/vapor/fluent-mysql.git", from: "3.0.0-rc"),
        
        // Swift HTML
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0-rc"),
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentMySQL",
                                            "Vapor",
                                            "Leaf"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)


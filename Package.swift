// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Reactor",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "Reactor", targets: ["Reactor"])
    ],
    dependencies: [
        .package(url: "git@github.com:SwiftUIX/Coordinator.git", .branch("master")),
        .package(url: "git@github.com:vmanot/Merge.git", .branch("master")),
        .package(url: "git@github.com:vmanot/Task.git", .branch("master")),
        .package(url: "git@github.com:SwiftUIX/SwiftUIX.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "Reactor",
            dependencies: [
                "Coordinator",
                "Merge",
                "Task",
                "SwiftUIX",
            ],
            path: "Sources"
        ),
    ],
    swiftLanguageVersions: [
        .version("5.1")
    ]
)

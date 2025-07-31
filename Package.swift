// swift-tools-version:6.0

import Foundation
import PackageDescription

extension String {
    static let coenttbShared: Self = "Coenttb Com Shared"
    static let coenttbComRouter: Self = "Coenttb Com Router"
}

extension Target.Dependency {
    static var coenttbShared: Self { .target(name: .coenttbShared) }
    static var coenttbComRouter: Self { .target(name: .coenttbComRouter) }
}

extension Target.Dependency {
    static var coenttbServer: Self { .product(name: "Coenttb Server", package: "coenttb-server") }
    static var coenttbWeb: Self { .product(name: "Coenttb Web", package: "coenttb-web") }
    static var dependenciesMacros: Self { .product(name: "DependenciesMacros", package: "swift-dependencies") }
    static var dependenciesTestSupport: Self { .product(name: "DependenciesTestSupport", package: "swift-dependencies") }
    static var issueReporting: Self { .product(name: "IssueReporting", package: "xctest-dynamic-overlay") }
    static var translating: Self { .product(name: "Translating", package: "swift-translating") }
    static var coenttbSyndication: Self { .product(name: "Coenttb Syndication", package: "coenttb-syndication") }
    static var coenttbBlog: Self { .product(name: "Coenttb Blog", package: "coenttb-blog") }
    static var coenttbNewsletter: Self { .product(name: "Coenttb Newsletter", package: "coenttb-newsletter") }
}

let package = Package(
    name: "coenttb-com-shared",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: .coenttbShared,
            targets: [.coenttbShared]
        ),
        .library(
            name: .coenttbComRouter,
            targets: [.coenttbComRouter]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/coenttb-server.git", branch: "main"),
        .package(url: "https://github.com/coenttb/coenttb-web.git", branch: "main"),
        .package(url: "https://github.com/coenttb/coenttb-blog.git", branch: "main"),
        .package(url: "https://github.com/coenttb/coenttb-newsletter.git", branch: "main"),
        .package(url: "https://github.com/coenttb/coenttb-syndication.git", branch: "main"),
        .package(url: "https://github.com/coenttb/swift-translating.git", from: "0.0.1"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.9.2"),
        .package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay", from: "1.4.3")
    ],
    targets: [
        .target(
            name: .coenttbShared,
            dependencies: [
                .coenttbServer,
                .issueReporting,
                .coenttbComRouter,
            ]
        ),
        .target(
            name: .coenttbComRouter,
            dependencies: [
                .coenttbServer,
                .issueReporting,
                .coenttbSyndication,
                .coenttbBlog,
                .coenttbNewsletter,
                .translating,
                .coenttbWeb
            ]
        ),
        .testTarget(
            name: .coenttbShared.tests,
            dependencies: [
                .coenttbShared,
                .coenttbComRouter,
                .dependenciesTestSupport
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)

extension String { var tests: Self { "\(self) Tests" } }

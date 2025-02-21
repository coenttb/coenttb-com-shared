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
    static var coenttbAuthentication: Self { .product(name: "Coenttb Authentication", package: "coenttb-authentication") }
    static var dependenciesMacros: Self { .product(name: "DependenciesMacros", package: "swift-dependencies") }
    static var dependenciesTestSupport: Self { .product(name: "DependenciesTestSupport", package: "swift-dependencies") }
    static var issueReporting: Self { .product(name: "IssueReporting", package: "xctest-dynamic-overlay") }
    static var identityConsumer: Self { .product(name: "Identity Consumer", package: "swift-identities") }
    static var identityProvider: Self { .product(name: "Identity Provider", package: "swift-identities") }
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
        .library(name: .coenttbShared, targets: [.coenttbShared]),
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/coenttb-server.git", branch: "main"),
        .package(url: "https://github.com/coenttb/coenttb-authentication.git", branch: "main"),
        .package(url: "https://github.com/coenttb/coenttb-blog.git", branch: "main"),
        .package(url: "https://github.com/coenttb/coenttb-newsletter.git", branch: "main"),
        .package(url: "https://github.com/coenttb/coenttb-syndication.git", branch: "main"),
        .package(url: "https://github.com/coenttb/swift-identities.git", branch: "main"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.1.5"),
        .package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay", from: "1.4.3"),
    ],
    targets:  [
        .target(
            name: .coenttbShared,
            dependencies: [
                .coenttbServer,
                .issueReporting,
                .coenttbAuthentication,
                .coenttbComRouter,
                .identityConsumer,
                .identityProvider,
            ]
        ),
        .target(
            name: .coenttbComRouter,
            dependencies: [
                .coenttbServer,
                .issueReporting,
                .coenttbAuthentication,
                .identityConsumer,
                .coenttbSyndication,
                .coenttbBlog,
                .coenttbNewsletter,
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

extension String {
    var tests: Self {
        "\(self) Tests"
    }
}

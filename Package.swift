// swift-tools-version:6.0

import Foundation
import PackageDescription

extension String {
    static let coenttbShared: Self = "Coenttb Com Shared"
    static let coenttbLegalDocuments: Self = "Coenttb Legal Documents"
}
   
extension Target.Dependency {
    static var coenttbShared: Self { .target(name: .coenttbShared) }
    static var coenttbLegalDocuments: Self { .target(name: .coenttbLegalDocuments) }
}

extension Target.Dependency {
    static var coenttbWeb: Self { .product(name: "Coenttb Web", package: "coenttb-web") }
    static var coenttbAuthentication: Self { .product(name: "Coenttb Authentication", package: "coenttb-authentication") }
    static var dependenciesMacros: Self { .product(name: "DependenciesMacros", package: "swift-dependencies") }
    static var dependenciesTestSupport: Self { .product(name: "DependenciesTestSupport", package: "swift-dependencies") }
    static var issueReporting: Self { .product(name: "IssueReporting", package: "xctest-dynamic-overlay") }
}

let package = Package(
    name: "coenttb-com-shared",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: .coenttbShared, targets: [.coenttbShared]),
        .library(name: .coenttbLegalDocuments, targets: [.coenttbLegalDocuments]),
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/coenttb-web.git", branch: "main"),
        .package(url: "https://github.com/coenttb/coenttb-authentication.git", branch: "main"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.1.5"),
        .package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay", from: "1.4.3"),
    ],
    targets:  [
        .target(
            name: .coenttbShared,
            dependencies: [
                .coenttbWeb,
                .issueReporting,
                .coenttbAuthentication,
            ]
        ),
        .target(
            name: .coenttbLegalDocuments,
            dependencies: [
                .coenttbWeb
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

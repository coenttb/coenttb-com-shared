//
//  File.swift
//  coenttb-com-shared
//
//  Created by Coen ten Thije Boonkkamp on 24/01/2025.
//

import Coenttb_Com_Router
import Dependencies
import Foundation
import Identities
import SwiftWeb

public struct Configuration: Sendable {
    public var website: Configuration.Website
    public var identity: Configuration.Identity

    public init(
        website: Website,
        identity: Identity
    ) {
        self.website = website
        self.identity = identity
    }
}

extension Configuration {
    public struct Website: Sendable {
        public var baseURL: URL
        public var router: Coenttb_Com_Router.Route.Router

        public init(
            baseURL: URL,
            router: Coenttb_Com_Router.Route.Router
        ) {
            self.baseURL = baseURL
            self.router = router
        }
    }
}

extension Configuration {
    public struct Identity: Sendable {
        public var provider: Provider

        public init(provider: Provider) {
            self.provider = provider
        }
    }
}

extension Configuration.Identity {
    public struct Provider: Sendable {
        public var baseURL: URL
        public var router: AnyParserPrinter<URLRequestData, Identity.API>

        public init(
            baseURL: URL,
            router: AnyParserPrinter<URLRequestData, Identity.API>
        ) {
            self.baseURL = baseURL
            self.router = router
        }
    }
}

extension Configuration: DependencyKey {
    public static var liveValue: Self {
        .init(
            website: .liveValue,
            identity: .liveValue
        )
    }

    public static var testValue: Self {
        .init(
            website: .testValue,
            identity: .testValue
        )
    }
}

extension Configuration.Identity: TestDependencyKey {
    public static var liveValue: Self {
        .init(
            provider: .liveValue
        )
    }
    public static var testValue: Self {
        .init(
            provider: .testValue
        )
    }
}

extension Configuration.Website: TestDependencyKey {
    public static var liveValue: Self {
        let baseURL = URL(string: "https://coenttb.com")!
        return .init(
            baseURL: baseURL,
            router: Coenttb_Com_Router.Route.Router(baseURL)
        )
    }

    public static var testValue: Self {
        let baseURL = URL(string: "http://localhost:8080")!
        return .init(
            baseURL: baseURL,
            router: Coenttb_Com_Router.Route.Router(baseURL)
        )
    }
}

extension Configuration.Identity.Provider: DependencyKey {
    public static var liveValue: Self {
        let baseURL = URL(string: "https://identity.coenttb.com")!
        return .init(
            baseURL: baseURL,
            router: Identity.API.Router()
                .baseURL(baseURL.absoluteString).eraseToAnyParserPrinter()
        )
    }

    public static var testValue: Self {
        let baseURL = URL(string: "http://localhost:5001")!
        return .init(
            baseURL: baseURL,
            router: Identity.API.Router()
                .baseURL(baseURL.absoluteString).eraseToAnyParserPrinter()
        )
    }
}

extension DependencyValues {
    public var coenttb: Configuration {
        get { self[Configuration.self] }
        set { self[Configuration.self] = newValue }
    }
}

extension Coenttb_Com_Router.Route.Router {
    public var identity: AnyParserPrinter<URLRequestData, Identity.Route> {
        self.map(
            .convert(
                apply: Identity.Route.init,
                unapply: Coenttb_Com_Router.Route.init
            )
        ).eraseToAnyParserPrinter()
    }
}

extension AnyParserPrinter<URLRequestData, Identity.Route> {
    public var view: AnyParserPrinter<URLRequestData, Identity.View> {
        self.map(
            .convert(
                apply: \.view,
                unapply: Identity.Route.view
            )
        ).eraseToAnyParserPrinter()
    }
}

extension Identity.Route {
    public init?(
        _ route: Coenttb_Com_Router.Route
    ) {
        if let api = route.api?.identity { self = .api(api) } else if let view = route.website?.page.identity { self = .view(view) } else { return nil }
    }
}

extension Coenttb_Com_Router.Route {
    public init(
        _ route: Identity.Route
    ) {
        switch route {
        case .api(let identity):
            self = .api(.identity(identity))
        case .view(let view):
            self = .page(.identity(view))
        }
    }
}

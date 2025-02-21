//
//  File.swift
//  coenttb-com-shared
//
//  Created by Coen ten Thije Boonkkamp on 24/01/2025.
//

import Foundation
import Dependencies
import SwiftWeb
import Coenttb_Com_Router
import Identity_Consumer
import Identity_Provider

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
        public let provider: Provider
        
        public init(provider: Provider) {
            self.provider = provider
        }
    }
}

extension Configuration.Identity {
    public struct Provider: Sendable {
        public var baseURL: URL
        public var router: AnyParserPrinter<URLRequestData, Identity_Provider.Identity.Provider.API>
        
        public init(
            baseURL: URL,
            router: AnyParserPrinter<URLRequestData, Identity_Provider.Identity.Provider.API>
        ) {
            self.baseURL = baseURL
            self.router = router
        }
    }
}


extension Configuration: DependencyKey {
    public static var liveValue: Configuration {
        
        return Configuration(
            website: {
                let baseURL = URL(string: "https://coenttb.com")!
                return .init(
                    baseURL: baseURL,
                    router: Coenttb_Com_Router.Route.Router(baseURL)
                )
            }(),
            identity: .init(
                provider: {
                    let baseURL = URL(string: "https://identity.coenttb.com")!
                    return .init(
                        baseURL: baseURL,
                        router: Identity_Provider.Identity.Provider.API.Router()
                            .baseURL(baseURL.absoluteString).eraseToAnyParserPrinter()
                    )
                }()
            )
        )
    }
    
    public static var testValue: Configuration {
        
        return Configuration(
            website: {
                let baseURL = URL(string: "http://localhost:8080")!
                return .init(
                    baseURL: baseURL,
                    router: Coenttb_Com_Router.Route.Router(baseURL)
                )
            }(),
            identity: .init(
                provider: {
                    let baseURL = URL(string: "http://localhost:5001")!
                    return .init(
                        baseURL: baseURL,
                        router: Identity_Provider.Identity.Provider.API.Router()
                            .baseURL(baseURL.absoluteString).eraseToAnyParserPrinter()
                    )
                }()
            )
        )
    }
}

extension DependencyValues {
    public var coenttb: Configuration  {
        get { self[Configuration.self] }
        set { self[Configuration.self] = newValue }
    }
}

extension Coenttb_Com_Router.Route.Router {
    public var identity: AnyParserPrinter<URLRequestData, Identity.Consumer.Route> {
        self.map(
            .convert(
                apply: Identity.Consumer.Route.init,
                unapply: Coenttb_Com_Router.Route.init
            )
        ).eraseToAnyParserPrinter()
    }
}

extension Identity.Consumer.Route.Router {
    public var view: AnyParserPrinter<URLRequestData, Identity.Consumer.View> {
        self.map(
            .convert(
                apply: \.view,
                unapply: Identity.Consumer.Route.view
            )
        ).eraseToAnyParserPrinter()
    }
}

extension Identity.Consumer.Route {
    public init?(
        _ route: Coenttb_Com_Router.Route
    ){
        if let api = route.api?.identity { self = .api(api) }
        else if let view = route.website?.page.identity { self = .view(view) }
        else { return nil }
    }
}

extension Coenttb_Com_Router.Route {
    public init(
        _ route: Identity.Consumer.Route
    ){
        switch route {
        case .api(let identity):
            self = .api(.identity(identity))
        case .view(let view):
            self = .page(.identity(view))
        }
    }
}

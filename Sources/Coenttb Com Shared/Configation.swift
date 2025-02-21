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
        public var router: AnyParserPrinter<URLRequestData, Coenttb_Com_Router.Route>
        
        public init(
            baseURL: URL,
            router: AnyParserPrinter<URLRequestData, Coenttb_Com_Router.Route>
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
                    router: Coenttb_Com_Router.Route.Router()
                        .baseURL(baseURL.absoluteString).eraseToAnyParserPrinter()
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
                    router: Coenttb_Com_Router.Route.Router()
                        .baseURL(baseURL.absoluteString).eraseToAnyParserPrinter()
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
                apply: { input in
                    if case .api(.identity(let identity)) = input {
                        return .api(identity)
                    } else if case .website(let page) = input,
                              case .identity(let view) = page.page {
                        return .view(view)
                    }
                    return nil
                },
                unapply: { output in
                    switch output {
                    case .api(let identity):
                        return .api(.identity(identity))
                    case .view(let view):
                        return .page(.identity(view))
                    }
                }
            )
        ).eraseToAnyParserPrinter()
    }
}

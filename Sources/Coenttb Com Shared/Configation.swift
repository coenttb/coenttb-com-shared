//
//  File.swift
//  coenttb-com-shared
//
//  Created by Coen ten Thije Boonkkamp on 24/01/2025.
//

import Foundation
import Dependencies

public struct Configuration: Sendable, Equatable {
    public var website: Configuration.Website
    public var identity: Configuration.Identity
    
    public init(
        website: Website,
        identity: Identity
    ) {
        self.website = website
        self.identity = identity
    }
    
    public struct Website: Sendable, Equatable {
        public var baseURL: URL
        
        public init(baseURL: URL) {
            self.baseURL = baseURL
        }
    }

    public struct Identity: Sendable, Equatable {
        public var baseURL: URL
        
        public init(baseURL: URL) {
            self.baseURL = baseURL
        }
    }
}

extension Configuration: DependencyKey {
    public static var liveValue: Configuration {
        Configuration(
            website: .init(baseURL: URL(string: "https://coenttb.com")!),
            identity: .init(baseURL: URL(string: "https://identity.coenttb.com")!)
        )
    }
    
    public static var testValue: Configuration {
        Configuration(
            website: .init(baseURL: URL(string: "http://localhost:8080")!),
            identity: .init(baseURL: URL(string: "http://localhost:5001")!)
        )
    }
}

extension DependencyValues {
    public var coenttb: Configuration  {
        get { self[Configuration.self] }
        set { self[Configuration.self] = newValue }
    }
}

//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 13/12/2024.
//

import Coenttb_Com_Router
import Coenttb_Com_Shared
import Dependencies
import DependenciesTestSupport
import Foundation
import Testing

@Suite(
    "Shared Tests",
    .dependency(\.locale, .english),
    .dependency(\.language, .english),
    .dependency(\.languages, [.english, .dutch])
)
struct SharedTests {
    @Test
    func test() async throws {
        print("HELLO")
    }

    @Test
    func testNewsletterSubscripe() async throws {
        @Dependency(\.coenttb.website.router) var router
        try #expect(router.match(path: "en/newsletter/subscribe") == .page(.newsletter(.subscribe(.request))))
        try #expect(router.match(path: "en/newsletter/subscribe/request") == .page(.newsletter(.subscribe(.request))))
    }
    
    @Test
    func testGeneralTerms() async throws {
        @Dependency(\.coenttb.website.router) var router
        try #expect(router.match(path: "en/newsletter/subscribe") == .page(.newsletter(.subscribe(.request))))
        try #expect(router.match(path: "en/newsletter/subscribe/request") == .page(.newsletter(.subscribe(.request))))
    }
    
    @Test
    func testGeneralTermsDutch() async throws {
        @Dependency(\.coenttb.website.router) var router
        
        try #expect(router.match(path: "en/general-terms-and-conditions") == .page(.general_terms_and_conditions))
        
        try withDependencies {
            $0.language = .dutch
        } operation: {
            try #expect(router.match(path: "/nl/algemene-voorwaarden") == .page(.general_terms_and_conditions))
            try #expect(router.match(path: "/nl/general-terms-and-conditions") == .page(.general_terms_and_conditions))
        }
    }
}

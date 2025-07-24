//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 13/12/2024.
//

import Coenttb_Com_Router
import Coenttb_Com_Shared
import Dependencies
import Foundation
import Testing

@Test
func test() async throws {
    print("HELLO")
}

@Test
func testNewsletterSubscripe() async throws {
    @Dependency(\.coenttb.website.router) var router
    try #expect(router.match(path: "/newsletter/subscribe") == .page(.newsletter(.subscribe(.request))))
    try #expect(router.match(path: "/newsletter/subscribe/request") == .page(.newsletter(.subscribe(.request))))

}

//
//  File.swift
//  rule-law-server
//
//  Created by Coen ten Thije Boonkkamp on 08/02/2025.
//

import CasePaths
import Coenttb_Newsletter
import Coenttb_Syndication
import Foundation
import Identities
import Coenttb_Web

extension Route {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case identity(Identity.API)
        case syndication(Coenttb_Syndication.API)
        case newsletter(Newsletter.Route.API)
    }
}

extension Route.API {
    public struct Router: ParserPrinter & Sendable {

        public init () {}

        public var body: some URLRouting.Router<Route.API> {
            OneOf {
                URLRouting.Route(.case(Route.API.identity)) {
                    Identity.API.Router()
                }

                URLRouting.Route(.case(Route.API.syndication)) {
                    Coenttb_Syndication.API.Router()
                }

                URLRouting.Route(.case(Route.API.newsletter)) {
                    Newsletter.Route.API.Router()
                }
            }
        }
    }
}

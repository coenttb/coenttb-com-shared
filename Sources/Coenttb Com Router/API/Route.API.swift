//
//  File.swift
//  rule-law-server
//
//  Created by Coen ten Thije Boonkkamp on 08/02/2025.
//

import Foundation
import Identities
import SwiftWeb
import Coenttb_Syndication
import Coenttb_Newsletter
import CasePaths

extension Route {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case identity(Identity.API)
        case syndication(Coenttb_Syndication.API)
        case newsletter(Coenttb_Newsletter.API)
    }
}

extension Route.API {
    public struct Router: ParserPrinter & Sendable {
        
        public init (){}
        
        public var body: some URLRouting.Router<Route.API> {
            OneOf {
                URLRouting.Route(.case(Route.API.identity)) {
                    Identity.API.Router()
                }
                
                URLRouting.Route(.case(Route.API.syndication)) {
                    Coenttb_Syndication.API.Router()
                }
                
                URLRouting.Route(.case(Route.API.newsletter)) {
                    Coenttb_Newsletter.API.Router()
                }
            }
        }
    }
}


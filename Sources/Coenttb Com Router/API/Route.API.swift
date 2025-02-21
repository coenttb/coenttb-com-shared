//
//  File.swift
//  rule-law-server
//
//  Created by Coen ten Thije Boonkkamp on 08/02/2025.
//

import Foundation
import Identity_Consumer
import SwiftWeb
import Coenttb_Syndication
import Coenttb_Newsletter
import CasePaths

extension Route {
    @CasePathable
    @dynamicMemberLookup
    public enum API: Equatable, Sendable {
        case identity(Identity.Consumer.API)
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
                    Identity.Consumer.API.Router()
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


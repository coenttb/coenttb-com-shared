//
//  File.swift
//  rule-law-server
//
//  Created by Coen ten Thije Boonkkamp on 11/09/2024.
//

import CasePaths
import Identities
import Dependencies
import Foundation
import Languages
import URLRouting
import Identities


extension Route.Website {
    @CasePathable
    public enum Account: Codable, Hashable, Sendable {
        case index
        case settings(Route.Website.Account.Settings)
    }
}

extension Route.Website.Account {
    struct Router: ParserPrinter {
        var body: some URLRouting.Router<Route.Website.Account> {
            OneOf {

                URLRouting.Route(.case(Route.Website.Account.settings)) {
                    Path { "settings" }
                    Route.Website.Account.Settings.Router()
                }

                URLRouting.Route(.case(Route.Website.Account.index))
            }
        }
    }
}

extension Route.Website.Account {
    public enum Settings: Codable, Hashable, Sendable {
        case index
        case profile
    }
}

extension Route.Website.Account.Settings {
    struct Router: ParserPrinter {
        var body: some URLRouting.Router<Route.Website.Account.Settings> {
            OneOf {
                URLRouting.Route(.case(Route.Website.Account.Settings.index)) {
                    Path { "index" }
                }

                URLRouting.Route(.case(Route.Website.Account.Settings.profile)) {
                    Path { "profile" }
                }
            }
        }
    }
}

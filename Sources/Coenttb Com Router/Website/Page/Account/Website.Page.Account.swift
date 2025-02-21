//
//  File.swift
//  rule-law-server
//
//  Created by Coen ten Thije Boonkkamp on 11/09/2024.
//

import CasePaths
import Identity_Consumer
import Dependencies
import Foundation
import Languages
import URLRouting
import Identity_Consumer

extension WebsitePage {
    @CasePathable
    public enum Account: Codable, Hashable, Sendable {
        case index
        case settings(WebsitePage.Account.Settings)
    }
}

extension WebsitePage.Account {
    struct Router: ParserPrinter {
        var body: some URLRouting.Router<WebsitePage.Account> {
            OneOf {

                URLRouting.Route(.case(WebsitePage.Account.settings)) {
                    Path { "settings" }
                    WebsitePage.Account.Settings.Router()
                }

                URLRouting.Route(.case(WebsitePage.Account.index))
            }
        }
    }
}

extension WebsitePage.Account {
    public enum Settings: Codable, Hashable, Sendable {
        case index
        case profile
    }
}

extension WebsitePage.Account.Settings {
    struct Router: ParserPrinter {
        var body: some URLRouting.Router<WebsitePage.Account.Settings> {
            OneOf {
                URLRouting.Route(.case(WebsitePage.Account.Settings.index)) {
                    Path { "index" }
                }

                URLRouting.Route(.case(WebsitePage.Account.Settings.profile)) {
                    Path { "profile" }
                }
            }
        }
    }
}

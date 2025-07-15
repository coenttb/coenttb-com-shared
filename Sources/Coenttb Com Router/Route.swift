//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 10/08/2022.
//

import Foundation
import CasePaths
import Identities
import Coenttb_Server

@CasePathable
@dynamicMemberLookup
public enum Route: Equatable, Sendable {
    case website(Coenttb_Server.Website<Website>)
    case `public`(Public)
    case webhook(Webhook)
    case api(API)
}

extension Route {
    public static func page(
        language: Language? = nil,
        _ page: Website
    ) -> Self {
        return .website(.init(language: language, page: page))
    }
}

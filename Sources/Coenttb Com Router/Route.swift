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
    case website(Website<WebsitePage>)
    case `public`(Public)
    case webhook(Webhook)
    case api(API)
}

extension Route {
    public static func page(_ page: WebsitePage) -> Self {
        return .website(.init(page: page))
    }
}

import Foundation
import Dependencies
import Coenttb_Server
import Identity_Consumer

extension Route {
    public struct Router: ParserPrinter & Sendable {       
        package init(){}
        
        public var body: some URLRouting.Router<Route> {
            OneOf {
                URLRouting.Route(.case(Route.website)) {
                    Website.Router.init(pageRouter: WebsitePage.Router())
                }

                URLRouting.Route(.case(Route.public)) {
                    Public.Router()
                }
            }
        }
        
        public func href(for public: Public) -> String {
            self.url(for: .public(`public`)).relativePath
        }

        public func href(for website: Website<WebsitePage>) -> String {
            self.url(for: website).relativePath
        }

        public func url(for page: Website<WebsitePage>) -> URL {
            return self.url(for: .website(page))
        }
        
        public func url(for page: WebsitePage) -> URL {
            @Dependency(\.language) var language
            return self.url(for: .website(.init(language: language, page: page)))
        }
        
        public func href(for page: WebsitePage) -> String {
            @Dependency(\.language) var language
            return self.url(for: .website(.init(language: language, page: page))).relativePath
        }
    }
}

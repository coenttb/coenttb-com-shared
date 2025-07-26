//
//  TranslatedString+URLRouting.swift
//  coenttb-com-shared
//
//  Created by Coen ten Thije Boonkkamp on 26/07/2025.
//

import Dependencies
import URLRouting
import Translating

/// TranslatedString conforms to Parser and ParserPrinter for use in URL routing.
///
/// ## Usage in Routers
///
/// When using TranslatedString in URL routes, always call `.slug()` to ensure
/// spaces and special characters are converted to URL-friendly format:
///
/// ```swift
/// URLRouting.Route(.case(Route.Website.contact)) {
///     Path { String.contact.slug() }  // Converts "contact us" → "contact-us"
/// }
/// ```
///
/// ## Parsing Behavior
///
/// The parser will match any of the available language translations. For example,
/// if a TranslatedString contains:
/// - English: "privacy-policy"
/// - Dutch: "privacybeleid"
///
/// Both `/en/privacy-policy` and `/nl/privacybeleid` will successfully parse.
///
/// ## Printing Behavior
///
/// When generating URLs, the current language from Dependencies is used to select
/// which translation to output.
extension TranslatedString: @retroactive Parser {
    public typealias Input = Substring
    public typealias Output = Void
    
    public func parse(_ input: inout Substring) throws -> Void {
        @Dependency(\.language) var currentLanguage
        @Dependency(\.languages) var languages
        
        // Fast path: Check current language first as it's the most likely match
        let currentTranslation = self[currentLanguage]
        if input.hasPrefix(currentTranslation) {
            input.removeFirst(currentTranslation.count)
            return
        }
        
        // Check all other available languages
        for language in languages where language != currentLanguage {
            let translation = self[language]
            
            if input.hasPrefix(translation) {
                input.removeFirst(translation.count)
                return
            }
        }
        
        // No match found - provide helpful error with all available translations
        let allTranslations = languages.map { self[$0] }
        throw TranslatedStringParsingError(
            input: String(input),
            availableTranslations: Array(Set(allTranslations)).sorted(),
            checkedLanguages: .init(languages)
        )
    }
}

/// Error thrown when a TranslatedString fails to parse a URL path component
struct TranslatedStringParsingError: Error, CustomDebugStringConvertible {
    let input: String
    let availableTranslations: [String]
    let checkedLanguages: [Language]
    
    var debugDescription: String {
        """
        Failed to match '\(input)' against \(checkedLanguages.count) language translations.
        Available translations: \(availableTranslations.joined(separator: ", "))
        """
    }
}

extension TranslatedString: @retroactive ParserPrinter {
    public func print(_ output: Void, into input: inout Substring) throws {
        @Dependency(\.language) var language
        
        // Use the translation for the current language
        // Note: Assumes the TranslatedString is already slugified if needed
        let translation = self[language]
        input = Substring(translation)
    }
}

// MARK: - Debugging Helpers

extension TranslatedString {
    /// Returns a debug description showing all translations for this string
    ///
    /// Example output:
    /// ```
    /// TranslatedString {
    ///   english: 'general-terms-and-conditions',
    ///   dutch: 'algemene-voorwaarden'
    /// }
    /// ```
    public var debugTranslations: String {
        @Dependency(\.languages) var languages
        
        let translations = languages.compactMap { language -> String? in
            let translation = self[language]
            return "\(language): '\(translation)'"
        }
        
        return "TranslatedString { \(translations.joined(separator: ", ")) }"
    }
    
    /// Returns a debug description showing how this string would appear in URLs
    /// for each language (useful for debugging routing issues)
    public var debugURLPaths: String {
        @Dependency(\.languages) var languages
        
        let paths = languages.compactMap { language -> String? in
            let translation = self[language]
            let slugified = translation.slug()
            if translation == slugified {
                return "/\(language.rawValue)/\(translation)"
            } else {
                return "/\(language.rawValue)/\(translation) → /\(language.rawValue)/\(slugified)"
            }
        }
        
        return "URL paths: \(paths.joined(separator: ", "))"
    }
}

// MARK: - Performance Optimization

/// Cache for storing parsed TranslatedString results to avoid repeated dependency lookups
/// Note: This is an advanced optimization. Only use if profiling shows parsing performance issues.
private actor TranslatedStringParsingCache {
    private var cache: [CacheKey: Set<String>] = [:]
    
    struct CacheKey: Hashable {
        let translatedStringID: ObjectIdentifier
        let languagesHash: Int
    }
    
    func getCachedTranslations(for translatedString: TranslatedString, languages: [Language]) -> Set<String>? {
        let key = CacheKey(
            translatedStringID: ObjectIdentifier(translatedString as AnyObject),
            languagesHash: languages.hashValue
        )
        return cache[key]
    }
    
    func setCachedTranslations(_ translations: Set<String>, for translatedString: TranslatedString, languages: [Language]) {
        let key = CacheKey(
            translatedStringID: ObjectIdentifier(translatedString as AnyObject),
            languagesHash: languages.hashValue
        )
        cache[key] = translations
    }
    
    func clear() {
        cache.removeAll()
    }
}

// MARK: - Usage Examples

/*
 // In your router:
 
 extension Route.Website {
     public struct Router: ParserPrinter, Sendable {
         public var body: some URLRouting.Router<Route.Website> {
             OneOf {
                 // Always use .slug() for URL-friendly paths
                 URLRouting.Route(.case(Route.Website.privacy_statement)) {
                     Path { String.privacyStatement.slug() }
                 }
                 
                 // The parser will match "privacy-statement" in English
                 // and "privacyverklaring" in Dutch
             }
         }
     }
 }
 
 // In your string definitions:
 
 extension String {
     static let privacyStatement = TranslatedString(
         english: "privacy statement",    // Will become "privacy-statement"
         dutch: "privacyverklaring"       // Already URL-friendly
     )
 }
 */

//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 21/06/2024.
//

import Coenttb_Web
import OrderedCollections

extension Clauses {
    public static func termsOfUse(
        entity: (name: String, x: Void),
        trademarks: [String] = []
    ) -> Self {
        
        let trademarks: OrderedSet = OrderedSet([entity.name] + trademarks)
        
        return [
            (
                header: TranslatedString(
                    dutch: "Wat deze Gebruiksvoorwaarden dekken",
                    english: "What these Terms of Use cover"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                        dutch: "Deze gebruiksvoorwaarden zijn van toepassing op alle bezoeken aan en gebruik van deze website, en op alle informatie, aanbevelingen en diensten die \(entity.name) aan u verstrekt op deze website",
                        english: "These Terms of Use apply to all visits to and use of this website, and to all information, recommendations and services that \(entity.name) provides to you on this website"
                    )
                ) (**Informatie**).
                """#}
            ),
            (
                header: TranslatedString(
                    dutch: "Informatie & Aansprakelijkheid",
                    english: "Information & Liability"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                        dutch: "De Informatie is uitsluitend voor algemene doeleinden en vormt geen advies. \(entity.name) is niet aansprakelijk voor enige schade die voortvloeit uit het gebruik van de Informatie op de website. Dit omvat schade veroorzaakt door virussen of enige onjuistheid of onvolledigheid van de Informatie, tenzij de schade is veroorzaakt door opzettelijk wangedrag of nalatigheid van \(entity.name). \(entity.name) is ook niet aansprakelijk voor enige schade die voortvloeit uit het gebruik van elektronische communicatie, inclusief schade die voortvloeit uit het niet afleveren of een vertraging in het afleveren van elektronische communicatie, uit onderschepping of manipulatie van elektronische communicatie door derden of computerprogramma's die worden gebruikt voor elektronische communicatie en uit de overdracht van virussen.",
                        english: "The Information is for general purposes only and does not constitute advice. \(entity.name) is not liable for any damage resulting from the use of Information on the website. This includes damage caused by viruses or any inaccuracy or incompleteness of the Information, unless the damage is caused by any wilful misconduct or negligence on \(entity.name)’s part. \(entity.name) is also not liable for any damage resulting from the use of electronic communication, including damage resulting from a failure to deliver or a delay in delivering electronic communication, from interception or manipulation of electronic communication by third parties or computer programs used for electronic communication and from transmission of viruses."
                    )
                )
                """#}
            ),
            (
                header: TranslatedString(
                    dutch: "Gelinkte Sites",
                    english: "Linked Sites"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                        dutch: "Deze website biedt links naar externe internetsites. \(entity.name) is niet aansprakelijk voor het gebruik of de inhoud van externe sites die naar of vanaf deze website linken. Ons privacybeleid is niet van toepassing op de verzameling en verwerking van uw persoonsgegevens op of via die externe sites.",
                        english: "This website provides links to external internet sites. \(entity.name) is not liable for the use or content of external sites that link to or from this website. Our Privacy Statement does not apply to the collection and processing of your personal data on or via those external sites."
                    )
                )
                """#}
            ),
            (
                header: TranslatedString(
                    dutch: "Intellectueel Eigendom",
                    english: "Intellectual Property"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                        dutch: "\(trademarks.map{ "\"\($0)\"" }.formatted(.list(type: .and))) zijn geregistreerde handelsmerken van \(entity.name).",
                        english: "\(trademarks.map{ "\"\($0)\"" }.formatted(.list(type: .and))) are registered trademarks of \(entity.name)."
                    )
                )
                
                \#(
                    TranslatedString(
                        dutch: "Tenzij anders aangegeven, bezit \(entity.name) alle rechten op deze website en de Informatie, inclusief auteursrechten en andere intellectuele eigendomsrechten.",
                        english: "Unless otherwise indicated, \(entity.name) owns all rights to this website and the Information, including copyrights and other intellectual property rights."
                    )
                )
                
                \#(
                    TranslatedString(
                        dutch: "Gebruikers mogen deze website en de Informatie lezen en kopieën maken voor persoonlijk gebruik, bijvoorbeeld door de Informatie af te drukken of op te slaan. Gebruikers mogen deze website of de Informatie niet op een andere manier gebruiken zonder de uitdrukkelijke schriftelijke toestemming van \(entity.name). Dit omvat de opslag of reproductie van deze website of delen van deze website op enige externe internetsite of het creëren van links, hypertextlinks of deeplinks tussen deze website en enige andere internetsite.",
                        english: "Users may read this website and the Information and make copies for their own personal use, for example by printing or storing the Information. Users may not make any other use of this website or the Information without \(entity.name)’s express written consent. This includes the storage or reproduction of this website or parts of this website on any external internet site or the creation of links, hypertext links or deeplinks between this website and any other internet site."
                    )
                )
                """#}
            ),
            (
                header: TranslatedString(
                    dutch: "Ongevraagde Ideeën",
                    english: "Unsolicited Ideas"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                        dutch: "Als u ongevraagde ideeën of materialen bestaande uit teksten, afbeeldingen, geluiden, software, informatie of anderszins (**Material**) op deze website plaatst of deze naar \(entity.name) stuurt per e-mail of anderszins, mag \(entity.name) de Materialen volledig en gratis gebruiken, kopiëren en commercieel exploiteren en is niet gebonden aan enige vertrouwelijkheidsverplichting met betrekking tot die Materialen.",
                        english: "If you post unsolicited ideas or materials consisting of texts, images, sounds, software, information or otherwise (**Materials**) on this website or send these to \(entity.name) by email or otherwise, \(entity.name) may use, copy and commercially exploit the Materials fully and free of charge and will not be bound by any confidentiality obligation in respect of those Materials."
                    )
                )
                
                \#(
                    TranslatedString(
                        dutch: "Door deze website te gebruiken, stemt u ermee in \(entity.name) te vrijwaren tegen enige actie of claim tegen en enige aansprakelijkheid opgelopen door \(entity.name) die voortvloeit uit het gebruik of de exploitatie van de Materialen die inbreuk maken op de intellectuele of andere eigendomsrechten van een derde partij of anderszins onrechtmatig zijn jegens een derde partij.",
                        english: "By using this website, you agree to indemnify \(entity.name) against any action or claim against and any liability incurred by \(entity.name) that result from the use or exploitation of the Materials infringing the intellectual or other property rights of any third party or otherwise being unlawful towards a third party."
                    )
                )
                """#}
            ),
            (
                header: TranslatedString(
                    dutch: "Ongeldigheid",
                    english: "Invalidity"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                        dutch: "Indien deze gebruiksvoorwaarden gedeeltelijk ongeldig zijn of worden, blijven de partijen gebonden aan en door de overige voorwaarden. De partijen zullen de ongeldige voorwaarden vervangen door voorwaarden die geldig zijn en zoveel mogelijk het beoogde effect van de ongeldige voorwaarden bereiken, rekening houdend met de inhoud en het doel van deze gebruiksvoorwaarden.",
                        english: "If these Terms of Use are or become partially invalid, the parties will continue to be bound to and by the remaining terms. The parties shall replace the invalid terms by terms that are valid and achieve so far as possible the intended effect of the invalid terms, taking into account the content and purpose of these Terms of Use."
                    )
                )
                """#}
            ),
            (
                header: TranslatedString(
                    dutch: "Toepasselijk Recht & Jurisdictie",
                    english: "Applicable Law & Jurisdiction"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString.jurisdiction_clause(
                        topic: .init(
                            dutch: "deze Gebruiksvoorwaarden",
                            english: "these Terms of Use"
                        )
                    )
                )
                """#}
            )
        ]
    }
}


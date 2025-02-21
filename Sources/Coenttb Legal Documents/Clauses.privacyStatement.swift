//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 21/06/2024.
//

import Coenttb_Web

extension Clauses {
    public static func privacyStatement(
        entity: (name: String, x: Void),
        ISO_27001_certified: Bool = false
    )->Self {
        return [
            (
                header: TranslatedString(
                    dutch: "Wie is verantwoordelijk voor het gebruik van mijn gegevens?",
                    english: "Who is responsible for the use of my data?"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                        dutch: "\(entity.name) is de verwerkingsverantwoordelijke wanneer je onze websites bezoekt, wanneer we sollicitaties behandelen, wanneer we juridische diensten verlenen, wanneer je ons goederen of diensten levert, wanneer we contactgegevens in ons CRM-systeem gebruiken, en wanneer je onze kantoren bezoekt. In bepaalde uitzonderlijke gevallen is de klant de enige verwerkingsverantwoordelijke en is \(entity.name) de verwerker. Bijvoorbeeld, wanneer je ons klantportaal Connect gebruikt, kan de klant voor sommige toepassingen de verwerkingsverantwoordelijke zijn en \(entity.name) de verwerker. Waar van toepassing, zullen we dan een verwerkersovereenkomst sluiten. Als wij de verwerker zijn en je hebt een privacy-gerelateerde vraag, zullen we je doorverwijzen naar de organisatie die de verwerkingsverantwoordelijke is.",
                        english: "\(entity.name) is the controller when you visit our websites, when we handle job applications, when we provide legal services, when you provide us with goods or services, when we use contact data in our CRM system, and when you visit our offices. In certain exceptional cases the client is the sole controller and \(entity.name) is the processor. For example, when you use our client portal Connect, for some applications the client may be the controller and \(entity.name) the processor. Where applicable, we will then conclude a data processing agreement. If we are the processor, and you contact us with a privacy-related question, we will refer you to the organisation that is the controller."
                    )
                )
                
                """#}
            ),
            (
                header: TranslatedString(
                    dutch: "Welke gegevens gebruiken jullie wanneer ik de website bezoek, voor welk doel gebruiken jullie deze gegevens, en hoe lang slaan jullie deze op?",
                    english: "When I visit the website, which data do you use, for what purpose do you use this data, and how long do you store it?"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                        dutch: "Onze website, tenthijeboonkkamp.nl, wordt gebruikt om algemene informatie over \(entity.name) te verstrekken. tenthijeboonkkamp.nl wordt gehost door Heroku in zijn Europese regio.",
                        english: "Our website, tenthijeboonkkamp.nl, is used to provide general information on \(entity.name). tenthijeboonkkamp.nl is hosted by Heroku on its Europe region."
                    )
                )
                
                \#(
                    TranslatedString(
                        dutch: "Voor alle websites verzamelen we de volgende gebruiksgegevens: je IP-adres, je browser, de pagina's die je bezoekt, wanneer je die pagina's bezoekt, en (indien van toepassing) de vorige/volgende site die je bezoekt.",
                        english: "For all the websites, we collect the following usage data: your IP address, your browser, the pages you visit, when you visit those pages, and (where applicable) the previous/subsequent site you visit."
                    )
                )
                
                \#(
                    TranslatedString(
                        dutch: "We gebruiken deze gegevens om:",
                        english: "We use this data to:"
                    )
                )                    
                \#([
                    TranslatedString(
                        dutch: "de sites te beheren",
                        english: "administer the sites"
                    ),
                    TranslatedString(
                        dutch: "gebruikersstatistieken te genereren",
                        english: "generate usage statistics"
                    ),
                    TranslatedString(
                        dutch: "voor (aanvullende) functionaliteit op de sites te zorgen",
                        english: "provide for (additional) functionality on the sites"
                    ),
                    TranslatedString(
                        dutch: "de sites te beheren door technische storingen op te lossen of de toegankelijkheid van bepaalde delen van de sites te verbeteren",
                        english: "manage the sites by resolving any technical faults or improving accessibility to certain parts of the sites"
                    ),
                    TranslatedString(
                        dutch: "de beveiliging van onze IT-systemen te waarborgen",
                        english: "ensure the security of our IT systems"
                    )
                    ].map {"1. \($0)"}
                .joined(separator: "\n")
                )
                
                \#(
                    TranslatedString(
                        dutch: "We verwerken deze gegevens op basis van ons belang om ervoor te zorgen dat websites en apps functioneel en veilig blijven. We bewaren deze gegevens 14 maanden, tenzij hieronder anders vermeld.",
                        english: "We process this data on the basis of our interest to ensure that websites and apps remain functional and secure. We retain this data for 14 months, unless stated otherwise below."
                    )
                )
                
                \#(
                    TranslatedString(
                        dutch: "Onze website kan je ook de mogelijkheid bieden om een account aan te maken. Als je een account aanmaakt, verzamelen we je naam, e-mailadres, wachtwoord en, indien van toepassing, je werkgever. We gebruiken deze gegevens om je te registreren op onze website en je toegang te geven tot de website. We gebruiken je e-mailadres om je wachtwoord te herstellen en om je updates over onze service te sturen. We bewaren accountgegevens zolang je een account bij ons hebt.",
                        english: "Our website might also allow you to create an account. If you create an account, we will collect your name, email address, password and, where applicable, your employer. We use this data to register you with our website and provide you with access to the website. We use your email address to restore your password and to send you updates about our service. We retain account data for as long as you have an account with us."
                    )
                )
                """#}
            ),
            
            (
                header: TranslatedString(
                    dutch: "Welke cookies gebruiken jullie, voor welk doel, en hoe lang worden ze opgeslagen?",
                    english: "What cookies do you use, for what purpose, and how long are they stored?"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                        dutch: """
                        Wanneer je tenthijeboonkkamp.nl bezoekt, worden er cookies op je computer geplaatst. \(entity.name) gebruikt twee soorten cookies:
                        """,
                        english: """
                        When you visit tenthijeboonkkamp.nl, cookies are placed on your computer. \(entity.name) uses two types of cookies:
                        """
                    )
                )
                
                - \#(
                    TranslatedString(
                        dutch: """
                        Noodzakelijke cookies: \(entity.name) gebruikt een cookie om de basisfunctionaliteit van de website aan te bieden en om je cookie-instellingen te onthouden. Deze cookie heet _gat. Het wordt 24 maanden opgeslagen. Als de _gat-cookie wordt gebruikt om het aanvraagtempo te beperken, wordt het één minuut opgeslagen.
                        """,
                        english: """
                        Necessary cookies: \(entity.name) uses a cookie in order to offer the website’s basic functionality and to remember your cookie settings. This cookie is called _gat. It is stored for 24 months. If the _gat-cookie is used to throttle the request rate, then it is stored for one minute.
                        """
                    )
                )
                
                - \#(
                    TranslatedString(
                        dutch: "Cookies voor analytische doeleinden: \(entity.name) gebruikt cookies om anonieme gebruikersstatistieken te genereren en onze websites gebruiksvriendelijker te maken. Dit doen we via Google Analytics, een webanalysedienst die wordt aangeboden door Google Inc. (Google). Google gebruikt geaggregeerde statistische informatie om \(entity.name) inzicht te geven in hoe bezoekers onze websites gebruiken. Om je privacy te beschermen, hebben we Google Analytics zo geconfigureerd dat alleen een deel van de IP-adressen van onze bezoekers wordt opgeslagen en dat gegevens niet met anderen worden gedeeld. Google mag deze informatie alleen aan derden verstrekken als het daartoe wettelijk verplicht is of voor zover deze derden de informatie namens Google verwerken. We hebben een verwerkersovereenkomst met Google ondertekend. We gebruiken hiervoor de volgende cookies: _ga en _gid. Deze worden respectievelijk 24 maanden en 24 uur opgeslagen. We gebruiken Hotjar om beter te begrijpen wat onze gebruikers nodig hebben en om deze service en ervaring te optimaliseren. Hotjar is een technologiedienst die ons helpt om de gebruikerservaring beter te begrijpen (bijvoorbeeld hoeveel tijd ze op welke pagina's doorbrengen, op welke links ze klikken, wat gebruikers wel en niet leuk vinden, enz.), en dit stelt ons in staat om onze service te bouwen en te onderhouden met behulp van gebruikersfeedback. Hotjar gebruikt cookies en andere technologieën om gegevens te verzamelen over het gedrag van onze gebruikers en hun apparaten. Dit omvat het IP-adres van een apparaat (verwerkt tijdens je sessie en opgeslagen in een geanonimiseerde vorm), schermgrootte van het apparaat, apparaattype (unieke apparaatidentificatiecodes), browserinformatie, geografische locatie (alleen land) en de voorkeurstaal die wordt gebruikt om onze website weer te geven. Hotjar slaat deze informatie namens ons op in een gepseudonimiseerd gebruikersprofiel. Het is Hotjar contractueel verboden om de verzamelde gegevens namens ons te verkopen.",
                        english: "Cookies for analytics: \(entity.name) uses cookies to generate anonymous user statistics to make our websites more user-friendly. We do this through Google Analytics, a web analysis service offered by Google Inc. (Google). Google uses aggregated statistical information to provide \(entity.name) with an understanding of how visitors are using our websites. To protect your privacy, we have configured Google Analytics to only store part of our visitors’ IP address and to not share data with others. Google may only provide this information to third parties if it has a statutory duty to do so or to the extent that the third parties are processing the information on Google’s behalf. We have signed a data processor agreement with Google. We use the following cookies for this purpose: _ga and _gid. These are stored for 24 months and 24 hours respectively. We use Hotjar in order to better understand our users’ needs and to optimize this service and experience. Hotjar is a technology service that helps us better understand our users’ experience (e.g. how much time they spend on which pages, which links they choose to click, what users do and don’t like, etc.) and this enables us to build and maintain our service with user feedback. Hotjar uses cookies and other technologies to collect data on our users’ behavior and their devices. This includes a device's IP address (processed during your session and stored in a de-identified form), device screen size, device type (unique device identifiers), browser information, geographic location (country only), and the preferred language used to display our website. Hotjar stores this information on our behalf in a pseudonymized user profile. Hotjar is contractually forbidden to sell any of the data collected on our behalf."
                    )
                )
                
                \#(
                    TranslatedString(
                        dutch: "Om onze diensten te verbeteren, kunnen we bepaalde informatie verzamelen en analyseren over hoe je onze producten gebruikt. Dit omvat gegevens over je interactie met onze diensten, de gebruiksfrequentie en de gebeurtenissen die zich binnen onze producten voordoen. Deze gegevens zijn geanonimiseerd en bevatten geen persoonlijk identificeerbare informatie.",
                        english: "To help us improve our services, we may collect and analyze certain information about how you use our products. This includes data about your interaction with our services, the frequency of use, and the events that occur within our products. This data is anonymized and does not include any personally identifiable information."
                    )
                )
                """#}
                
            ),
            
            
            (
                header: TranslatedString(
                    dutch: "Wanneer je juridische diensten verleent, welke gegevens gebruik je, voor welk doel gebruik je deze gegevens, en hoe lang sla je ze op?",
                    english: "When you provide legal services, which data do you use, for what purpose do you use this data, and how long do you store it?"
                ).description,
                content: HTMLMarkdown {#"""
                    \#(
                        TranslatedString(
                            dutch: "\(entity.name) verleent juridische diensten, zoals in het kader van onderzoeken, rechtszaken, zakelijke aangelegenheden en notariële diensten. Bij het verlenen van deze diensten verwerken we persoonsgegevens van verschillende categorieën mensen. Dit omvat cliënten, contactpersonen van cliënten, getuigen, deskundigen, tegenpartijen, contactpersonen van tegenpartijen, advocaten en adviseurs van tegenpartijen, en personen van wie de persoonsgegevens deel uitmaken van een dossier.",
                            english: "\(entity.name) provides legal services, such as in the context of investigations, litigation, corporate matters and notarial services. In the course of providing those services, we process personal data of different categories of people. These include clients, clients’ contact persons, witnesses, experts, counterparties, counterparties’ contact persons, counterparties’ lawyers and advisors, and persons whose personal data forms part of a file."
                        )
                    )
                    
                    \#(
                        TranslatedString(
                            dutch: "In het bijzonder:",
                            english: "In particular:"
                        )
                    )
                    
                    \#([
                        TranslatedString(
                            dutch: "Wanneer we assisteren bij rechtszaken en onderzoeken uitvoeren, kunnen we zoeken naar relevante informatie in dossiers die door onze cliënten of een andere partij zijn verstrekt. We kunnen deze informatie, inclusief persoonsgegevens, gebruiken in documenten die we hebben opgesteld als onderdeel van onze diensten. Voor rechtszaken omvat dit het onderzoeken en voorbereiden van gerechtelijke documenten. Voor onderzoeken omvat dit het rapporteren aan een cliënt over zijn naleving van de toepasselijke regels.",
                            english: "When we assist in litigation and conduct investigations, we may search for relevant information in files provided by our clients or another party. We may use this information, including personal data, in documents we have drafted as part of our services. For litigation, this includes investigating and preparing court documents. For investigations, this includes reporting to a client on its compliance with applicable rules."
                        ),
                        TranslatedString(
                            dutch: "Wanneer we als adviseur worden ingeschakeld bij zakelijke aangelegenheden, kunnen we een dataroom opzetten of beoordelen, die mogelijk persoonsgegevens bevat - bijvoorbeeld over werknemers. Of we kunnen worden gevraagd om advies te geven over corporate governance, wat vaak het analyseren van documenten met persoonsgegevens inhoudt. Soms verwerken we die informatie in documenten die we hebben opgesteld, zoals rapporten of contracten.",
                            english: "When we are engaged as advisor in corporate matters, we may set up or review a data room, which may contain personal data – for example, about employees. Or we might be asked to provide advice on corporate governance, which often involves analysing documents containing personal data. Sometimes we incorporate that information in documents we have drafted, such as reports or contracts."
                        ),
                        TranslatedString(
                            dutch: "We bieden ook notariële diensten aan, bijvoorbeeld door juridisch advies te geven, documenten te legaliseren en notariële akten voor te bereiden, te behandelen, uit te voeren en op te slaan.",
                            english: "We also offer notarial services, for example by providing legal advice, legalising documents, and preparing, handling, executing and storing notarial deeds."
                        ),
                        TranslatedString(
                            dutch: "We verwerken ook enkele van de hierboven genoemde persoonsgegevens voor interne kennisdoeleinden. Bijvoorbeeld, we slaan relevante dossiers op (na het verwijderen van de meeste persoonsgegevens) en een aantal van onze interacties met anderen, zoals vertegenwoordigers van toezichthoudende autoriteiten, advocaten en rechters, in ons interne kennisbestand, om deze informatie later te kunnen raadplegen.",
                            english: "We also process some of the personal data mentioned above for internal knowhow purposes. For example, we store relevant files (after removing most personal data) and some of our interactions with others, such as representatives of supervisory authorities, attorneys and judges, in our internal knowhow repository, to retrieve this information at a later date."
                        )
                    ].map{ "1. \($0)" }.joined(separator: "\n"))
                    
                    \#(
                        TranslatedString(
                            dutch: "We verwerken deze gegevens op basis van het gerechtvaardigde belang van onze cliënten om hun juridische rechten vast te stellen, uit te oefenen en te verdedigen, op basis van ons eigen commerciële belang om hoogwaardige professionele diensten aan te bieden, en we kunnen dit ook doen omdat we daartoe wettelijk verplicht zijn.",
                            english: "We do this processing on the basis of our clients’ legitimate interest in establishing, exercising and defending their legal rights, on the basis of our own commercial interest to offer high quality professional services and we may also do this because we are legally obliged to."
                        )
                    )

                    \#(
                        TranslatedString(
                            dutch: "We zullen ook de contactgegevens (naam, adres, e-mailadres) van onze cliënt (of hun contactpersoon) gebruiken om facturen te versturen. Dit doen we om in staat te zijn onze diensten in rekening te brengen, als onderdeel van de uitvoering van de overeenkomst tussen ons en onze cliënt.",
                            english: "We will also use the contact details (name, address, email address) of our client (or their contact person) to send invoices. We do this to enable us to collect fees for our services, as part of the performance of the agreement between us and our client."
                        )
                    )

                    \#(
                        TranslatedString(
                            dutch: "Ten slotte bewaren we deze gegevens om een mogelijke audit mogelijk te maken. Dit doen we als we daartoe wettelijk verplicht zijn.",
                            english: "Lastly, we store this data to allow for a possible audit. We do this because we are legally obliged to."
                        )
                    )

                    \#(
                        TranslatedString(
                            dutch: "We bewaren onze dossiers 20 jaar nadat de zaak is afgesloten, tenzij we wettelijk verplicht zijn om de dossiers langer te bewaren, maar niet langer dan 30 jaar (bijvoorbeeld in bepaalde milieuzaken). Na deze periode bieden we aan om originele documenten die door de cliënt zijn verstrekt terug te geven, en vernietigen we alle dossiers op een veilige manier. Voor notariële dossiers gelden de wettelijk voorgeschreven bewaartermijnen.",
                            english: "We retain our files for 20 years after the matter is closed, unless we are required by law to retain the files for a longer period of no more than 30 years (for example, in certain environmental cases). After this period, we will offer to return original documents which were provided by the client, and we will securely destroy all files. For notarial files, the retention periods prescribed by law apply."
                        )
                    )

                    \#(
                        TranslatedString(
                            dutch: "Voorafgaand aan de meeste opdrachten verzamelen we bepaalde informatie om de identiteit van de cliënt te verifiëren, om te voldoen aan anti-witwaswetgeving en wetgeving die de Nederlandse juridische beroepen regelt. \(entity.name) is verplicht om ongebruikelijke transacties te melden bij de Financial Intelligence Unit (FIU-Nederland). In dat geval moet \(entity.name) ook de verzamelde informatie verstrekken. \(entity.name) bewaart deze informatie gedurende een periode van vijf jaar na beëindiging van de relatie of de uitvoering van de transactie, tenzij deze informatie onderdeel is geworden van een zaak, in welk geval het zolang als het dossier van de zaak wordt bewaard.",
                            english: "Prior to most engagements, we collect certain information to verify the identity of the client, in order to comply with anti-money laundering legislation and legislation governing Dutch legal professions. \(entity.name) is obliged to report unusual transactions to the Financial Intelligence Unit (FIU-Nederland). In that case, \(entity.name) must also provide the information it collected. \(entity.name) retains this information for a period of five years after the termination of the relationship or the performance of the transaction, unless this information has become part of a matter, in which case it is retained as long as the file of the matter is retained."
                        )
                    )

                    \#(
                        TranslatedString(
                            dutch: "Soms delen we informatie die in de loop van onze dienstverlening wordt verwerkt, ook met advocaten van andere kantoren, andere adviseurs van cliënten en rechtbanken. Maar alleen als dit mogelijk is binnen de grenzen van de strikte vertrouwelijkheid die aan advocaten en notarissen is opgelegd. In sommige gevallen is dit omdat je ons toestemming hebt gegeven, en in andere gevallen is dit omdat onze cliënten een gerechtvaardigd belang hebben om hun juridische rechten vast te stellen, uit te oefenen of te verdedigen.",
                            english: "Sometimes, we share information processed in the course of providing services, including with lawyers from other firms, other advisors to clients, and courts. But only if this is possible within the boundaries of the strict confidentiality imposed on lawyers and notaries. In some cases, this is because you have given us permission, and in other cases, this is because our clients have a legitimate interest in establishing, exercising or defending their legal rights."
                        )
                    )

                    \#(
                        TranslatedString(
                            dutch: "Wanneer je documenten digitaal ondertekent via Docusign in het kader van onze juridische diensten, verzamelen we je e-mailadres, IP-adres en een afbeelding van je handtekening, evenals het tijdstip en de datum waarop je de service hebt gebruikt. We slaan deze informatie op in de zaak die verband houdt met het document dat je hebt ondertekend, en gebruiken deze om het ondertekeningsproces te documenteren. Dit doen we omdat we een gerechtvaardigd belang hebben om bewijs van de ondertekening te bewaren. Deze gegevens zijn beschikbaar voor alle partijen namens wie dit document wordt ondertekend, die zich buiten de Europese Unie of de Europese Economische Ruimte kunnen bevinden.",
                            english: "When you digitally sign documents through Docusign in the context of our legal services, we collect your email address, IP address and an image of your signature, as well as the time and date on which you used the service. We store this information in the matter related to the document you signed, and use it to document the signing process. We do this because we have a legitimate interest in retaining evidence of the signing. This data is available to all parties on behalf of which this document is signed, who may be located outside of the European Union or the European Economic Area."
                        )
                    )
                    
                    """#}
            ),
            (
                header: TranslatedString(
                    dutch: "Welke gegevens slaan jullie op in jullie CRM-systeem en wat gebeurt ermee?",
                    english: "What data do you store in your CRM system and what happens with it?"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                            dutch: "\(entity.name) gebruikt een systeem voor het hele bedrijf om contactpersonen bij te houden. Voor de meeste personen slaan we de naam, het e-mailadres, het telefoonnummer, de functietitel en de werkgeschiedenis op (bijvoorbeeld voor welke organisatie iemand eerder heeft gewerkt of nu werkt). Soms slaan we ook aanvullende informatie over iemand op, zoals de branche waarin ze werken, geslacht, mailtaal, interessegebieden, huisadres, verjaardag, naam van een echtgenoot/partner, hobby's en andere persoonlijke aantekeningen. We houden ook bij welke mailings we naar deze persoon sturen. Voor onze alumni noteren we ook wanneer iemand het kantoor heeft verlaten. Als je in het verleden een cliënt van \(entity.name) bent geweest, je hebt geabonneerd op onze nieuwsbrieven, of hebt samengewerkt met \(entity.name), dan staan je gegevens waarschijnlijk in dit systeem.",
                            english: "\(entity.name) uses a company-wide system to keep track of its contacts. For most persons, we store the name, email address, phone number, job title and work history (e.g., what organisation did someone work for previously, or is now working for). We sometimes also store additional information about someone, such as the industry they work in, gender, mailing language, areas of interest, home address, birthday, a spouse/partner’s name, hobbies, and other personal notes. We also keep track of the mailings we send to this person. For our alumni, we also note when someone has left the firm. If, in the past, you have been a client of \(entity.name), were subscribed to our newsletters, or have worked with \(entity.name), your records are probably in this system."
                        )
                )
                
                \#(
                    TranslatedString(
                        dutch: "We gebruiken deze gegevens om:",
                        english: "We use this data to:"
                    )
                )
                
                \#([
                    TranslatedString(
                        dutch: "je persoonlijk aan te spreken en ervoor te zorgen dat personen binnen het kantoor die met je communiceren, je relevante persoonlijke gegevens kennen",
                        english: "address you personally and ensure that persons within the firm communicating with you know your relevant personal details"
                    ),
                    TranslatedString(
                        dutch: "een beter overzicht te krijgen van je netwerk, het bedrijf waarvoor je werkt en de markt(en) waarin het actief is",
                        english: "get a better overview of your network, the company you work for and its market(s)"
                    ),
                    TranslatedString(
                        dutch: "je nieuwsbrieven, updates over ons kantoor en uitnodigingen voor onze evenementen te sturen",
                        english: "send you newsletters, updates about our firm and invitations to our events"
                    )
                ].map{ "1. \($0)" }.joined(separator: "\n"))
                
                \#(
                    TranslatedString(
                        dutch: "Voor dit laatste doel delen we je naam, e-mailadres en interessegebieden met Advanced Computer Software Group Ltd., onze e-mailprovider voor dit soort communicatie. Als je nog geen abonnee bent, kun je je abonneren door een e-mail te sturen naar info@tenthijeboonkkamp.nl. Je kunt je altijd afmelden voor het ontvangen van nieuwsbrieven of je voorkeuren wijzigen door een e-mail naar hetzelfde adres te sturen.",
                        english: "For the last purpose, we share your name, email address and areas of interest with Advanced Computer Software Group Ltd., who are our emailing provider for these kinds of communications. If you are not yet a subscriber, you can subscribe by sending an email to info@tenthijeboonkkamp.nl. You can always unsubscribe from receiving newsletters or change your preferences by sending an email to the same address."
                    )
                )

                \#(
                    TranslatedString(
                        dutch: "We gebruiken je gegevens op basis van ons belang in het opbouwen en onderhouden van ons netwerk van persoonlijke contacten, met uitzondering van het verzenden van nieuwsbrieven, wat we alleen zullen doen met je toestemming.",
                        english: "We use your data on the basis of our interest in building and maintaining our network of personal contacts, with the exception of the sending newsletters, which we will only do with your consent."
                    )
                )

                \#(
                    TranslatedString(
                        dutch: "We archiveren je gegevens als deze in 36 maanden niet zijn gewijzigd en je gedurende deze periode geen mailing via ons CRM-systeem hebt ontvangen.",
                        english: "We archive your data if it has not changed in 36 months and you have not received a mailing via our CRM system during this period."
                    )
                )
                """#}
            ),
            (
                header: TranslatedString(
                    dutch: "Gebruiken jullie mijn gegevens voor andere doeleinden?",
                    english: "Do you use my data for other purposes?"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                        dutch: "\(entity.name) kan ook enkele van de hierboven beschreven persoonsgegevens verwerken om:",
                        english: "\(entity.name) may also process some of the personal data described above to:"
                    )
                )
                
                \#([
                   TranslatedString(
                       dutch: "voldoen aan een wettelijke verplichting",
                       english: "comply with a legal obligation"
                   ),
                   TranslatedString(
                       dutch: "onderzoeken, vaststellen, uitoefenen of verdedigen van juridische claims",
                       english: "to investigate, establish, exercise or defend against legal claims"
                   ),
                   TranslatedString(
                       dutch: "voorbereiden op en uitvoering geven aan een verkoop, fusie of andere transactie waarbij de activa van \(entity.name) betrokken zijn",
                       english: "prepare for and give effect to a sale, merger or other transaction involving \(entity.name)'s assets"
                   )
                ].map{ "1. \($0)" }.joined(separator: "\n"))
                
                \#(
                    TranslatedString(
                        dutch: "Voor het eerste doel is onze rechtsgrondslag te vinden in de verplichting om te voldoen aan wettelijke verplichtingen. Voor de andere doeleinden is onze verwerking voor dit doel gebaseerd op ons gerechtvaardigd belang om dit te doen.",
                        english: "For the first purpose, our legal basis can be found in the obligation to comply with legal obligations. For the other purposes, our processing for this purpose is based on our legitimate interest to do so."
                    )
                )
                """#}
            ),
            (
                header: TranslatedString(
                    dutch: "Hoe beveiligen jullie mijn gegevens?",
                    english: "How do you secure my data?"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                        dutch: "\(entity.name) neemt kantoorbrede beveiligingsmaatregelen als onderdeel van het informatiebeveiligingskader. Technische maatregelen omvatten het gebruik van toegangscontroles, firewalls, netwerksegmentatie, virusscanners, verkeersmonitoring, penetratietests en encryptie van laptops, telefoons en USB-sticks. Organisatorische maatregelen omvatten een clean desk policy, vertrouwelijkheidsbepalingen, screening van personeel, privacy- en beveiligingstrainingen en bewustwording, en het implementeren van controles in contracten met leveranciers. ",
                        english: "\(entity.name) takes office-wide security measures as part of its information security framework. Technical measures include the use of access controls, firewalls, network segmentation, virus scanners, traffic monitoring, penetration tests, and encryption of laptops, phones and USB sticks. Organisational measures include a clear screen policy, confidentiality provisions, screening of personnel, privacy and security training and awareness, and implementing controls in contracts with suppliers."
                    )
                )
                """#
                
                    if ISO_27001_certified {#"""
                        \#(
                            TranslatedString(
                                dutch: "\(entity.name) is ISO 27001-gecertificeerd, wat aantoont dat de informatiebeveiligingsmaatregelen zijn geïmplementeerd volgens internationaal erkende normen. \(entity.name) heeft een Chief Information Security Officer die verantwoordelijk is voor de ontwikkeling en implementatie van het informatiebeveiligingsbeleid.",
                                english: "\(entity.name) is ISO 27001-certified, which demonstrates that it has implemented its information security measures according to internationally acknowledged standards. \(entity.name) has a Chief Information Security Officer responsible for the development and implementation of the information security policy."
                            )
                        )
                    """#}
                    
                }
            ),
            (
                header: TranslatedString(
                    dutch: "Hoe delen jullie gegevens buiten de EU?",
                    english: "How do you share data outside the EU?"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                        dutch: "In situaties waarin \(entity.name) persoonsgegevens overdraagt aan andere partijen in landen buiten de EU/EER zonder een adequaatheidsbesluit, is de overdracht meestal noodzakelijk voor het vaststellen, uitoefenen of verdedigen van juridische claims. Anders zal \(entity.name) ervoor zorgen dat het passende waarborgen biedt voor deze overdracht in overeenstemming met de AVG. Je kunt contact opnemen met privacy@tenthijeboonkkamp.nl voor meer informatie over deze waarborgen.",
                        english: "In circumstances where \(entity.name) transfers personal data to other parties, in those countries outside of the EU/EEA without an adequacy decision, transfer is usually necessary for the establishment, exercise or defence of legal claims. Otherwise, \(entity.name) will ensure that it provides appropriate safeguards for this transfer in accordance with the GDPR. You can contact privacy@tenthijeboonkkamp.nl for more information about these safeguards."
                    )
                )   
                """#}
            ),
            (
                header: TranslatedString(
                    dutch: "Wat gebeurt er wanneer jullie een bevel ontvangen om persoonsgegevens te verstrekken?",
                    english: "What happens when you receive an order to disclose personal data?"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                   TranslatedString(
                       dutch: "Hoewel dit onwaarschijnlijk is, kan het zijn dat we verplicht zijn om persoonsgegevens te verstrekken op bevel van de rechter of om te voldoen aan andere wettelijke of regelgevende vereisten. We zullen alles wat redelijkerwijs mogelijk is doen om de betrokken personen op de hoogte te stellen voordat we deze gegevens verstrekken, tenzij we wettelijk beperkt zijn om dit te doen.",
                       english: "While this is unlikely, we may be required to disclose personal data by a court order or to comply with other legal or regulatory requirements. We will do everything we reasonably can to notify the persons involved before we disclose this data, unless we are legally restricted from doing so."
                   )
                )
                """#}
            ),
            (
                header: TranslatedString(
                    dutch: "Aan wie kan ik mijn vragen en verzoeken richten voor inzage, correctie en verwijdering van mijn persoonsgegevens, en welke andere rechten heb ik?",
                    english: "To whom can I address my questions and requests for inspection, correction and removal of my personal data, and what other rights do I have?"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                        dutch: "Je hebt te allen tijde het recht om inzage, correctie, verwijdering of beperking van de verwerking van je persoonsgegevens door \(entity.name) te verzoeken. Daarnaast heb je in sommige gevallen het recht om je gegevens in een gestructureerd formaat te ontvangen (d.w.z. gegevensoverdraagbaarheid). Stuur je verzoek, evenals andere privacy-gerelateerde vragen die je hebt, naar onze Functionaris Gegevensbescherming via dpo@tenthijeboonkkamp.nl. Je hebt ook het recht om een klacht in te dienen bij de Autoriteit Persoonsgegevens.",
                        english: "You are entitled at any time to request inspection, correction, removal or restriction of the processing of your personal data by \(entity.name). In addition, in some cases you have the right to receive your data in a structured format (i.e., data portability). Please send your request, as well as other privacy-related questions you might have, to our Data Protection Officer at dpo@tenthijeboonkkamp.nl. You also have the right to lodge a complaint with the Dutch Data Protection Authority (*Autoriteit Persoonsgegevens*)."
                    )
                )
                """#}
            ),
            (
                header: TranslatedString(
                    dutch: "Marketing",
                    english: "Marketing"
                ).description,
                content: HTMLMarkdown {#"""
                \#(
                    TranslatedString(
                        dutch: "We kunnen je contactgegevens gebruiken om je marketingcommunicatie te sturen. Dit kan meldingen bevatten over onze nieuwe functies, producten of promotieaanbiedingen. Je kunt je op elk moment afmelden voor deze communicatie.",
                        english: "We may use your contact information to send you marketing communications. These may include notifications about our new features, products, or promotional offers. You can opt out of these communications at any time."
                    )
                )
                """#}
            ),
        ]
    }
}


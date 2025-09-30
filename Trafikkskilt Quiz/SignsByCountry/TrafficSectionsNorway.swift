//
//  TrafficSectionsNorway.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 22/9/25.
//

import Foundation

struct TrafficSign: Identifiable {
    let id = UUID()
    
    let title: String
    let section: String
    let description: String
    let images: [String]
    let wrongAnswers: [String]
}

struct TrafficSection {
    let id = UUID()
    
    let name: String
    let signs: [TrafficSign]
}

struct TrafficSectionStore {
    static let all: [Country: [TrafficSection]] = [
        .norway: [
            TrafficSectionsNorway.fareskilt,
            TrafficSectionsNorway.vikeplikt,
            TrafficSectionsNorway.forbudsskilt,
            TrafficSectionsNorway.paabudsskilt,
            TrafficSectionsNorway.opplysningsskilt,
            TrafficSectionsNorway.serviceskilt,
            TrafficSectionsNorway.underskilt,
            TrafficSectionsNorway.markeringsskilt,
            TrafficSectionsNorway.vegvisningsskilt
        ]
        // Later: .sweden: [ ... ]
    ]
}

struct TrafficSectionsNorway {
    
    // MARK: - Sections
    static let fareskilt = TrafficSection(
        name: "Fareskilt",
        signs: [
            TrafficSign(
                title: "Farlig sving",
                section: "Fareskilt",
                description: "",
                images: ["100_1", "100_2"],
                wrongAnswers: [
                    "Bratt bakke", "Smalere veg", "Ujevn veg",
                    "Fartshump", "Glatt kjørebane", "Vegarbeid", "Steinsprut",
                    "Rasfare", "Sidevind", "Tunnel", "Annen fare"
                ]
            ),
            TrafficSign(
                title: "Farlige svinger",
                section: "Fareskilt",
                description: "",
                images: ["102_1", "102_2"],
                wrongAnswers: [
                    "Bratt bakke", "Smalere veg", "Ujevn veg",
                    "Fartshump", "Glatt kjørebane", "Vegarbeid", "Steinsprut",
                    "Rasfare", "Kø", "Fly", "Annen fare"
                ]
            ),
            TrafficSign(
                title: "Bratt bakke",
                section: "Fareskilt",
                description: "",
                images: ["104_1", "104_2"],
                wrongAnswers: [
                    "Farlig sving", "Smalere veg", "Ujevn veg",
                    "Fartshump", "Glatt kjørebane", "Vegarbeid", "Steinsprut",
                    "Rasfare", "Tunnel", "Bevegelig bru", "Kai, strand eller ferjeleie"
                ]
            ),
            TrafficSign(
                title: "Smalere veg",
                section: "Fareskilt",
                description: "",
                images: ["106_1", "106_2", "106_3"],
                wrongAnswers: [
                    "Bratt bakke", "Farlig sving", "Ujevn veg",
                    "Fartshump", "Vegarbeid", "Glatt kjørebane", "Møtende trafikk",
                    "Farlig vegskulder", "Rundkjøring", "Avstand til gangfelt"
                ]
            ),
            TrafficSign(
                title: "Ujevn veg",
                section: "Fareskilt",
                description: "",
                images: ["108_0"],
                wrongAnswers: [
                    "Fartshump", "Smalere veg", "Bratt bakke", "Glatt kjørebane",
                    "Vegarbeid", "Steinsprut", "Rasfare", "Kø",
                    "Barn", "Syklende", "Skiløpere"
                ]
            ),
            TrafficSign(
                title: "Fartshump",
                section: "Fareskilt",
                description: "",
                images: ["109_0"],
                wrongAnswers: [
                    "Ujevn veg", "Smalere veg", "Bratt bakke", "Farlig sving",
                    "Glatt kjørebane", "Vegarbeid", "Steinsprut", "Rasfare",
                    "Sidevind", "Kø", "Annen fare"
                ]
            ),
            TrafficSign(
                title: "Vegarbeid",
                section: "Fareskilt",
                description: "",
                images: ["110_0"],
                wrongAnswers: [
                    "Steinsprut", "Rasfare", "Fartshump", "Ujevn veg",
                    "Farlig vegskulder", "Tunnel", "Planovergang med bom",
                    "Kai, strand eller ferjeleie", "Barn", "Syklende", "Skiløpere"
                ]
            ),
            TrafficSign(
                title: "Steinsprut",
                section: "Fareskilt",
                description: "",
                images: ["112_0"],
                wrongAnswers: [
                    "Rasfare", "Vegarbeid", "Fartshump", "Ujevn veg",
                    "Glatt kjørebane", "Farlig vegskulder", "Sidevind",
                    "Kø", "Militær aktivitet", "Trafikkulykke"
                ]
            ),
            TrafficSign(
                title: "Rasfare",
                section: "Fareskilt",
                description: "Skiltet varsler om fare for ras av stein, jord, snø e.l., og at rasmaterialer kan ligge på kjørebanen.",
                images: ["114_1", "114_2"],
                wrongAnswers: [
                    "Steinsprut", "Vegarbeid", "Farlig vegskulder", "Ujevn veg",
                    "Tunnel", "Bevegelig bru", "Kai, strand eller ferjeleie",
                    "Sidevind", "Kø", "Annen fare"
                ]
            ),
            TrafficSign(
                title: "Glatt kjørebane",
                section: "Fareskilt",
                description: "Skiltet varsler om fare for glatt kjørebane på grunn av særlige forhold.",
                images: ["116_0"],
                wrongAnswers: [
                    "Ujevn veg", "Fartshump", "Steinsprut", "Smalere veg",
                    "Rasfare", "Sidevind", "Trafikkulykke",
                    "Vegarbeid", "Møtende trafikk", "Tunnel"
                ]
            ),
            TrafficSign(
                title: "Farlig vegskulder",
                section: "Fareskilt",
                description: "",
                images: ["117_0"],
                wrongAnswers: [
                    "Vegarbeid", "Steinsprut", "Rasfare", "Fartshump",
                    "Smalere veg", "Bratt bakke", "Tunnel",
                    "Kai, strand eller ferjeleie", "Bevegelig bru"
                ]
            ),
            TrafficSign(
                title: "Bevegelig bru",
                section: "Fareskilt",
                description: "",
                images: ["118_0"],
                wrongAnswers: [
                    "Tunnel", "Kai, strand eller ferjeleie", "Farlig vegskulder",
                    "Vegarbeid", "Rasfare", "Møtende trafikk", "Farlig vegkryss",
                    "Avstandsskilt", "Rundkjøring", "Annen fare"
                ]
            ),
            TrafficSign(
                title: "Kai, strand eller ferjeleie",
                section: "Fareskilt",
                description: "",
                images: ["120_0"],
                wrongAnswers: [
                    "Bevegelig bru", "Tunnel", "Vegarbeid", "Rasfare",
                    "Smalere veg", "Farlig vegskulder", "Bratt bakke",
                    "Fly", "Militær aktivitet", "Syklende"
                ]
            ),
            TrafficSign(
                title: "Tunnel",
                section: "Fareskilt",
                description: "",
                images: ["122_0"],
                wrongAnswers: [
                    "Bevegelig bru", "Kai, strand eller ferjeleie", "Vegarbeid",
                    "Rasfare", "Farlig vegskulder", "Farlig vegkryss",
                    "Avstandsskilt", "Rundkjøring", "Trafikklyssignal"
                ]
            ),
            TrafficSign(
                title: "Farlig vegkryss",
                section: "Fareskilt",
                description: "Skiltet varsler om farlig vegkryss hvor det gjelder vanlig vikeplikt overfor kjørende fra høyre.",
                images: ["124_0"],
                wrongAnswers: [
                    "Rundkjøring", "Trafikklyssignal", "Møtende trafikk",
                    "Avstandsskilt", "Vegarbeid", "Tunnel", "Kai, strand eller ferjeleie",
                    "Farlig vegskulder", "Barn", "Syklende"
                ]
            ),
            TrafficSign(
                title: "Rundkjøring",
                section: "Fareskilt",
                description: "",
                images: ["126_0"],
                wrongAnswers: [
                    "Farlig vegkryss", "Trafikklyssignal", "Møtende trafikk",
                    "Avstandsskilt", "Vegarbeid", "Tunnel", "Kai, strand eller ferjeleie",
                    "Planovergang med bom", "Planovergang uten bom", "Jernbanespor"
                ]
            ),
            TrafficSign(
                title: "Trafikklyssignal",
                section: "Fareskilt",
                description: "",
                images: ["132_0"],
                wrongAnswers: [
                    "Rundkjøring", "Farlig vegkryss", "Møtende trafikk",
                    "Avstandsskilt", "Vegarbeid", "Tunnel", "Kai, strand eller ferjeleie",
                    "Planovergang med bom", "Planovergang uten bom", "Avstand til gangfelt"
                ]
            ),
            TrafficSign(
                title: "Planovergang med bom",
                section: "Fareskilt",
                description: "",
                images: ["134_0"],
                wrongAnswers: [
                    "Avstandsskilt", "Jernbanespor",
                    "Sporvogn", "Avstand til gangfelt", "Barn", "Syklende",
                    "Skiløpere", "Ridende", "Fly"
                ]
            ),
            TrafficSign(
                title: "Planovergang uten bom",
                section: "Fareskilt",
                description: "",
                images: ["135_0"],
                wrongAnswers: [
                    "Avstandsskilt", "Jernbanespor",
                    "Sporvogn", "Avstand til gangfelt", "Barn", "Syklende",
                    "Skiløpere", "Ridende", "Fly"
                ]
            ),
            TrafficSign(
                title: "Avstandsskilt",
                section: "Fareskilt",
                description: "Skiltet gir forvarsel om planovergang varslet med skilt 134 eller 135.",
                images: ["136_1", "136_2", "136_3"],
                wrongAnswers: [
                    "Planovergang med bom", "Planovergang uten bom", "Jernbanespor",
                    "Sporvogn", "Avstand til gangfelt", "Barn", "Syklende",
                    "Skiløpere", "Ridende", "Fly"
                ]
            ),
            TrafficSign(
                title: "Jernbanespor",
                section: "Fareskilt",
                description: "Skiltet angir stedet hvor jernbane eller forstadsbane krysser vegen i plan.",
                images: ["138_1", "138_2"],
                wrongAnswers: [
                    "Planovergang med bom", "Planovergang uten bom", "Avstandsskilt",
                    "Sporvogn", "Avstand til gangfelt", "Barn", "Syklende",
                    "Skiløpere", "Ridende", "Militær aktivitet"
                ]
            ),
            TrafficSign(
                title: "Sporvogn",
                section: "Fareskilt",
                description: "",
                images: ["139_0"],
                wrongAnswers: [
                    "Jernbanespor", "Avstandsskilt", "Planovergang med bom",
                    "Planovergang uten bom", "Avstand til gangfelt", "Barn", "Syklende",
                    "Skiløpere", "Ridende", "Fly"
                ]
            ),
            TrafficSign(
                title: "Avstand til gangfelt",
                section: "Fareskilt",
                description: "",
                images: ["140_0"],
                wrongAnswers: [
                    "Sporvogn", "Jernbanespor", "Planovergang med bom",
                    "Planovergang uten bom", "Barn", "Syklende",
                    "Skiløpere", "Ridende", "Militær aktivitet"
                ]
            ),
            TrafficSign(
                title: "Barn",
                section: "Fareskilt",
                description: "Skiltet varsler om sted på eller langs veg hvor barn ofte ferdes eller oppholder seg i forbindelse med skole, barnehage, lekeplass e.l.",
                images: ["142_0"],
                wrongAnswers: [
                    "Syklende", "Skiløpere", "Ridende", "Dyr",
                    "Avstand til gangfelt", "Kø", "Trafikkulykke",
                    "Vegarbeid", "Fly", "Annen fare"
                ]
            ),
            TrafficSign(
                title: "Syklende",
                section: "Fareskilt",
                description: "Skiltet varsler om sted hvor syklende ofte krysser eller kjører ut på vegen, eller om syklende i tunnel.",
                images: ["144_0"],
                wrongAnswers: [
                    "Barn", "Skiløpere", "Ridende", "Dyr",
                    "Avstand til gangfelt", "Kø", "Trafikkulykke",
                    "Vegarbeid", "Fly", "Annen fare"
                ]
            ),
            TrafficSign(
                title: "Dyr",
                section: "Fareskilt",
                description: "Skiltet varsler at dyr ofte ferdes over eller langs vegen.",
                images: ["146_1", "146_2", "146_3", "146_4", "146_5"],
                wrongAnswers: [
                    "Barn", "Syklende", "Skiløpere", "Ridende",
                    "Avstand til gangfelt", "Kø", "Trafikkulykke",
                    "Vegarbeid", "Fly", "Militær aktivitet"
                ]
            ),
            TrafficSign(
                title: "Møtende trafikk",
                section: "Fareskilt",
                description: "Skiltet varsler at kjørebanen har kjørende trafikk i begge retninger.",
                images: ["148_0"],
                wrongAnswers: [
                    "Farlig vegkryss", "Rundkjøring", "Trafikklyssignal",
                    "Smalere veg", "Ujevn veg", "Glatt kjørebane",
                    "Vegarbeid", "Annen fare", "Sidevind", "Kø"
                ]
            ),
            TrafficSign(
                title: "Kø",
                section: "Fareskilt",
                description: "",
                images: ["149_0"],
                wrongAnswers: [
                    "Møtende trafikk", "Farlig vegkryss", "Rundkjøring",
                    "Trafikklyssignal", "Vegarbeid", "Barn", "Syklende",
                    "Fly", "Militær aktivitet", "Trafikkulykke"
                ]
            ),
            TrafficSign(
                title: "Fly",
                section: "Fareskilt",
                description: "Skiltet varsler at fly kan fly lavt over eller nær vegen.",
                images: ["150_0"],
                wrongAnswers: [
                    "Militær aktivitet", "Trafikkulykke", "Kø", "Dyr",
                    "Syklende", "Barn", "Skiløpere", "Ridende",
                    "Sidevind", "Annen fare"
                ]
            ),
            TrafficSign(
                title: "Militær aktivitet",
                section: "Fareskilt",
                description: "",
                images: ["151_0"],
                wrongAnswers: [
                    "Fly", "Trafikkulykke", "Kø", "Dyr",
                    "Syklende", "Barn", "Skiløpere", "Ridende",
                    "Sidevind", "Annen fare"
                ]
            ),
            TrafficSign(
                title: "Sidevind",
                section: "Fareskilt",
                description: "Skiltet varsler om sted hvor det ofte forekommer sterk sidevind.",
                images: ["152_0"],
                wrongAnswers: [
                    "Glatt kjørebane", "Rasfare", "Steinsprut", "Møtende trafikk",
                    "Farlig vegskulder", "Fly", "Militær aktivitet",
                    "Annen fare", "Vegarbeid", "Tunnel"
                ]
            ),
            TrafficSign(
                title: "Trafikkulykke",
                section: "Fareskilt",
                description: "",
                images: ["153_0"],
                wrongAnswers: [
                    "Kø", "Militær aktivitet", "Fly", "Barn",
                    "Syklende", "Skiløpere", "Ridende", "Dyr",
                    "Annen fare", "Vegarbeid"
                ]
            ),
            TrafficSign(
                title: "Skiløpere",
                section: "Fareskilt",
                description: "Skiltet varsler om sted hvor skiløpere ofte krysser vegen.",
                images: ["154_0"],
                wrongAnswers: [
                    "Barn", "Syklende", "Ridende", "Dyr",
                    "Avstand til gangfelt", "Kø", "Trafikkulykke",
                    "Fly", "Annen fare", "Militær aktivitet"
                ]
            ),
            TrafficSign(
                title: "Ridende",
                section: "Fareskilt",
                description: "Skiltet varsler om sted hvor ridende ofte krysser eller rir ut i vegen.",
                images: ["155_0"],
                wrongAnswers: [
                    "Barn", "Syklende", "Skiløpere", "Dyr",
                    "Avstand til gangfelt", "Kø", "Trafikkulykke",
                    "Fly", "Annen fare", "Militær aktivitet"
                ]
            ),
            TrafficSign(
                title: "Annen fare",
                section: "Fareskilt",
                description: "Farens art er angitt på underskilt.",
                images: ["156_0"],
                wrongAnswers: [
                    "Glatt kjørebane", "Rasfare", "Steinsprut", "Vegarbeid",
                    "Farlig vegskulder", "Tunnel", "Sidevind",
                    "Fly", "Militær aktivitet", "Kø"
                ]
            )
        ]
    )
    
    static let vikeplikt = TrafficSection(
        name: "Vikeplikt",
        signs: [
            TrafficSign(
                title: "Vikeplikt",
                section: "Vikeplikt",
                description: "Skiltet angir at kjørende har vikeplikt og skal stanse helt.",
                images: ["202"],
                wrongAnswers: [
                    "Forkjørsveg", "Slutt på forkjørsveg",
                    "Vikeplikt for møtende", "Møtende trafikk har vikeplikt",
                    "Farlig vegkryss", "Rundkjøring", "Trafikklyssignal",
                    "Planovergang med bom", "Forkjørskryss", "Tunnel"
                ]
            ),
            TrafficSign(
                title: "Stopp",
                section: "Vikeplikt",
                description: "Skiltet angir at kjørende har vikeplikt for trafikk i kryss.",
                images: ["204"],
                wrongAnswers: [
                    "Forkjørsveg", "Slutt på forkjørsveg",
                    "Vikeplikt for møtende", "Møtende trafikk har vikeplikt",
                    "Barn", "Rundkjøring", "Smalere veg", "Forkjørskryss", "Glatt kjørebane"
                ]
            ),
            TrafficSign(
                title: "Forkjørsveg",
                section: "Vikeplikt",
                description: "Skiltet angir at kjørende på vegen har forkjørsrett i kryss.",
                images: ["206"],
                wrongAnswers: [
                    "Stopp", "Vikeplikt", "Slutt på forkjørsveg",
                    "Vikeplikt for møtende", "Møtende trafikk har vikeplikt",
                    "Avstandsskilt", "Jernbanespor", "Forkjørskryss", "Kai, strand eller ferjeleie"
                ]
            ),
            TrafficSign(
                title: "Slutt på forkjørsveg",
                section: "Vikeplikt",
                description: "Skiltet angir at forkjørsretten i kryss opphører.",
                images: ["208"],
                wrongAnswers: [
                    "Slutt på motorveg",
                    "Slutt på motortrafikkveg",
                    "Slutt på tungtrafikkfelt",
                    "Slutt på kollektivfelt",
                    "Slutt på sambruksfelt",
                    "Slutt på gatetun",
                    "Slutt på gågate",
                    "Slutt på fartsgrensesone",
                    "Slutt på forbikjøringsforbud",
                    "Slutt på parkeringssone"
                ]
            ),
            TrafficSign(
                title: "Forkjørskryss",
                section: "Vikeplikt",
                description: "Skiltet varsler om kryss hvor trafikk på vegen har forkjørsrett.",
                images: ["210"],
                wrongAnswers: [
                    "Vikeplikt", "Stopp", "Forkjørsveg",
                    "Vikeplikt for møtende",
                    "Møtende trafikk har vikeplikt", "Farlig vegkryss",
                    "Rundkjøring", "Avstand til gangfelt"
                ]
            ),
            TrafficSign(
                title: "Vikeplikt for møtende",
                section: "Vikeplikt",
                description: "Skiltet angir at kjørende har vikeplikt for møtende trafikk.",
                images: ["212"],
                wrongAnswers: [
                    "Møtende trafikk har vikeplikt", "Stopp",
                    "Forkjørsveg", "Slutt på forkjørsveg",
                    "Smalere veg", "Ujevn veg", "Farlig sving"
                ]
            ),
            TrafficSign(
                title: "Møtende trafikk har vikeplikt",
                section: "Vikeplikt",
                description: "Skiltet angir at møtende trafikk har vikeplikt.",
                images: ["214"],
                wrongAnswers: [
                    "Vikeplikt for møtende", "Stopp",
                    "Forkjørsveg", "Slutt på forkjørsveg",
                    "Møtende trafikk", "Rundkjøring", "Avstand til gangfelt"
                ]
            )
        ]
    )
    
    static let forbudsskilt = TrafficSection(
        name: "Forbudsskilt",
        signs: [
            TrafficSign(
                title: "Innkjøring forbudt",
                section: "Forbudsskilt",
                description: "Skiltet angir forbud mot å kjøre forbi skiltet. Sykling og bruk av liten elektrisk motorvogn på fortau kan likevel foregå i samsvar med trafikkreglene.",
                images: ["302_0"],
                wrongAnswers: [
                    "Forbudt for motorvogn", "Forbudt for lastebil og trekkbil",
                    "Forbudt for traktor og motorredskap", "Forbudt for motorsykkel og moped",
                    "Forbudt for gående", "Forbudt for ridende", "Forbudt for transport av farlig gods",
                    "Stans forbudt", "Parkering forbudt"
                ]
            ),
            TrafficSign(
                title: "Forbudt for alle kjøretøy",
                section: "Forbudsskilt",
                description: "",
                images: ["306_0"],
                wrongAnswers: [
                    "Forbudt for motorvogn", "Forbudt for traktor og motorredskap",
                    "Forbudt for lastebil og trekkbil", "Forbudt for motorsykkel og moped",
                    "Forbudt for gående", "Forbudt for ridende", "Forbudt for transport av farlig gods",
                    "Vektgrense motorvogn", "Breddegrense"
                ]
            ),
            TrafficSign(
                title: "Forbudt for motorvogn\n(unntatt liten elektrisk motorvogn)",
                section: "Forbudsskilt",
                description: "",
                images: ["306_1"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for lastebil og trekkbil",
                    "Forbudt for motorsykkel og moped", "Forbudt for traktor og motorredskap",
                    "Forbudt for gående", "Forbudt for ridende", "Forbudt for transport av farlig gods",
                    "Vektgrense motorvogn", "Lengdegrense"
                ]
            ),
            TrafficSign(
                title: "Forbudt for traktor og motorredskap\n(< 40 km/t)",
                section: "Forbudsskilt",
                description: "",
                images: ["306_3"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for lastebil og trekkbil",
                    "Forbudt for motorsykkel og moped", "Forbudt for motorvogn",
                    "Forbudt for gående", "Forbudt for ridende", "Forbudt for transport av farlig gods",
                    "Totalvektgrense (vogntog)", "Aksellastgrense"
                ]
            ),
            TrafficSign(
                title: "Forbudt for motorsykkel og moped",
                section: "Forbudsskilt",
                description: "",
                images: ["306_4"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for lastebil og trekkbil",
                    "Forbudt for traktor og motorredskap", "Forbudt for motorvogn",
                    "Forbudt for gående", "Forbudt for ridende", "Forbudt for transport av farlig gods",
                    "Stans forbudt", "Svingeforbud"
                ]
            ),
            TrafficSign(
                title: "Forbudt for lastebil og trekkbil",
                section: "Forbudsskilt",
                description: "",
                images: ["306_5"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
                    "Forbudt for traktor og motorredskap", "Forbudt for motorsykkel og moped",
                    "Forbudt for gående", "Forbudt for ridende", "Forbudt for transport av farlig gods",
                    "Vektgrense motorvogn", "Totalvektgrense (vogntog)"
                ]
            ),
            TrafficSign(
                title: "Forbudt for syklende og liten elektrisk motorvogn",
                section: "Forbudsskilt",
                description: "",
                images: ["306_6"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
                    "Forbudt for motorsykkel og moped", "Forbudt for gående",
                    "Forbudt for ridende", "Forbudt for transport av farlig gods",
                    "Parkeringssone", "Stopp for toll"
                ]
            ),
            TrafficSign(
                title: "Forbudt for gående",
                section: "Forbudsskilt",
                description: "",
                images: ["306_7"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
                    "Forbudt for traktor og motorredskap", "Forbudt for motorsykkel og moped",
                    "Forbudt for ridende", "Forbudt for transport av farlig gods",
                    "Stans forbudt", "Parkering forbudt", "Vendingsforbud"
                ]
            ),
            TrafficSign(
                title: "Forbudt for gående, syklende og liten elektrisk motorvogn",
                section: "Forbudsskilt",
                description: "",
                images: ["306_8"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
                    "Forbudt for traktor og motorredskap", "Forbudt for motorsykkel og moped",
                    "Forbudt for ridende", "Forbudt for transport av farlig gods",
                    "Sone med parkeringsforbud for liten elektrisk motorvogn", "Vendingsforbud", "Forbikjøringsforbud"
                ]
            ),
            TrafficSign(
                title: "Forbudt for ridende",
                section: "Forbudsskilt",
                description: "",
                images: ["306_9"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
                    "Forbudt for traktor og motorredskap", "Forbudt for motorsykkel og moped",
                    "Forbudt for gående", "Forbudt for transport av farlig gods",
                    "Stans forbudt", "Parkering forbudt", "Svingeforbud"
                ]
            ),
            TrafficSign(
                title: "Forbudt for liten elektrisk motorvogn",
                section: "Forbudsskilt",
                description: "Forbudet gjelder ferdsel på veg og fortau med liten elektrisk motorvogn.",
                images: ["306_10"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
                    "Forbudt for traktor og motorredskap", "Forbudt for motorsykkel og moped",
                    "Forbudt for gående", "Forbudt for ridende", "Forbudt for transport av farlig gods",
                    "Fartsgrensesone for liten elektrisk motorvogn", "Sone med bruksforbud for liten elektrisk motorvogn"
                ]
            ),
            TrafficSign(
                title: "Forbudt for transport av farlig gods",
                section: "Forbudsskilt",
                description: "Forbudet gjelder kjøretøy som transporterer farlig gods hvor merking med oransje skilter kreves. For vegtunneler gjelder spesifikke ADR-regler.",
                images: ["308_0"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
                    "Forbudt for traktor og motorredskap", "Forbudt for lastebil og trekkbil",
                    "Vektgrense motorvogn", "Aksellastgrense", "Stans forbudt",
                    "Parkering forbudt", "Stopp for toll"
                ]
            ),
            TrafficSign(
                title: "Vektgrense motorvogn",
                section: "Forbudsskilt",
                description: "",
                images: ["310_0"],
                wrongAnswers: [
                    "Breddegrense", "Høydegrense", "Lengdegrense",
                    "Totalvektgrense (vogntog)", "Totalvektgrense (kjøretøy)",
                    "Aksellastgrense", "Boggilastgrense", "Forbudt for lastebil og trekkbil",
                    "Forbudt for traktor og motorredskap", "Forbudt for motorsykkel og moped"
                ]
            ),
            TrafficSign(
                title: "Breddegrense",
                section: "Forbudsskilt",
                description: "Forbudet gjelder kjøretøy, medregnet gods, med større bredde enn angitt.",
                images: ["312_0"],
                wrongAnswers: [
                    "Vektgrense motorvogn", "Høydegrense", "Lengdegrense",
                    "Totalvektgrense (vogntog)", "Totalvektgrense (kjøretøy)",
                    "Aksellastgrense", "Boggilastgrense", "Parkering forbudt",
                    "Stans forbudt", "Innkjøring forbudt"
                ]
            ),
            TrafficSign(
                title: "Høydegrense",
                section: "Forbudsskilt",
                description: "Forbudet gjelder kjøretøy, medregnet gods, med større høyde enn angitt.",
                images: ["314_0"],
                wrongAnswers: [
                    "Vektgrense motorvogn", "Breddegrense", "Lengdegrense",
                    "Totalvektgrense (vogntog)", "Totalvektgrense (kjøretøy)",
                    "Aksellastgrense", "Boggilastgrense", "Stopp for toll", "Svingeforbud"
                ]
            ),
            TrafficSign(
                title: "Lengdegrense",
                section: "Forbudsskilt",
                description: "Forbudet gjelder kjøretøy eller vogntog, medregnet gods, med større lengde enn angitt.",
                images: ["316_0"],
                wrongAnswers: [
                    "Vektgrense motorvogn", "Breddegrense", "Høydegrense",
                    "Totalvektgrense (vogntog)", "Totalvektgrense (kjøretøy)",
                    "Aksellastgrense", "Boggilastgrense", "Forbudt for lastebil og trekkbil", "Vendingsforbud"
                ]
            ),
            TrafficSign(
                title: "Totalvektgrense (kjøretøy)",
                section: "Forbudsskilt",
                description: "Forbudet gjelder kjøretøy hvor aktuell totalvekt er høyere enn angitt.",
                images: ["318_1"],
                wrongAnswers: [
                    "Totalvektgrense (vogntog)", "Vektgrense motorvogn", "Breddegrense",
                    "Høydegrense", "Lengdegrense", "Aksellastgrense", "Boggilastgrense",
                    "Forbudt for lastebil og trekkbil", "Forbudt for traktor og motorredskap"
                ]
            ),
            TrafficSign(
                title: "Totalvektgrense (vogntog)",
                section: "Forbudsskilt",
                description: "Forbudet gjelder vogntog hvor samlet aktuell totalvekt er høyere enn angitt.",
                images: ["318_2"],
                wrongAnswers: [
                    "Totalvektgrense (kjøretøy)", "Vektgrense motorvogn", "Breddegrense",
                    "Høydegrense", "Lengdegrense", "Aksellastgrense", "Boggilastgrense",
                    "Forbudt for lastebil og trekkbil", "Forbudt for traktor og motorredskap"
                ]
            ),
            TrafficSign(
                title: "Aksellastgrense",
                section: "Forbudsskilt",
                description: "Forbudet gjelder kjøretøy med aktuell aksellast høyere enn angitt.",
                images: ["320_0"],
                wrongAnswers: [
                    "Boggilastgrense", "Vektgrense motorvogn", "Breddegrense",
                    "Høydegrense", "Lengdegrense", "Totalvektgrense (kjøretøy)", "Totalvektgrense (vogntog)",
                    "Forbudt for lastebil og trekkbil", "Forbudt for traktor og motorredskap"
                ]
            ),
            TrafficSign(
                title: "Boggilastgrense",
                section: "Forbudsskilt",
                description: "Forbudet gjelder kjøretøy med aktuell boggilast høyere enn angitt.",
                images: ["322_0"],
                wrongAnswers: [
                    "Aksellastgrense", "Vektgrense motorvogn", "Breddegrense",
                    "Høydegrense", "Lengdegrense", "Totalvektgrense (kjøretøy)", "Totalvektgrense (vogntog)",
                    "Forbudt for lastebil og trekkbil", "Forbudt for traktor og motorredskap"
                ]
            ),
            TrafficSign(
                title: "Stopp for angitt formål",
                section: "Forbudsskilt",
                description: "Skiltet angir forbud mot å kjøre videre før det er foretatt stans for det formål som er angitt på skiltet.",
                images: ["324_1", "324_2"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for transport av farlig gods",
                    "Stans forbudt", "Parkering forbudt", "Vendingsforbud", "Svingeforbud",
                    "Forbikjøringsforbud", "Forbudt for alle kjøretøy"
                ]
            ),
            TrafficSign(
                title: "Stopp for toll",
                section: "Forbudsskilt",
                description: "Skiltet angir plikt til å stanse for tollklarering.",
                images: ["326_0"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for transport av farlig gods",
                    "Stans forbudt", "Parkering forbudt", "Vendingsforbud", "Svingeforbud",
                    "Forbikjøringsforbud", "Forbudt for alle kjøretøy"
                ]
            ),
            TrafficSign(
                title: "Svingeforbud",
                section: "Forbudsskilt",
                description: "Forbudet gjelder bare for det vegkryss skiltet er satt opp ved, eller første vegkryss etter skiltet.",
                images: ["330_1", "330_2"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for alle kjøretøy",
                    "Forbudt for motorvogn", "Forbudt for gående", "Stans forbudt",
                    "Parkering forbudt", "Forbikjøringsforbud"
                ]
            ),
            TrafficSign(
                title: "Vendingsforbud",
                section: "Forbudsskilt",
                description: "Forbudet gjelder til og med første vegkryss.",
                images: ["332_0"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for alle kjøretøy",
                    "Forbudt for motorvogn", "Forbudt for gående", "Stans forbudt",
                    "Parkering forbudt", "Forbikjøringsforbud"
                ]
            ),
            TrafficSign(
                title: "Forbikjøringsforbud",
                section: "Forbudsskilt",
                description: "Forbudet gjelder forbikjøring av motorvogn med flere enn to hjul. Gjelder ikke forbikjøring til høyre der dette er lovlig.",
                images: ["334_0"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
                    "Forbudt for lastebil og trekkbil", "Forbudt for motorsykkel og moped",
                    "Stans forbudt", "Parkering forbudt", "Vendingsforbud",
                    "Forbudt for transport av farlig gods"
                ]
            ),
            TrafficSign(
                title: "Forbikjøringsforbud for lastebil",
                section: "Forbudsskilt",
                description: "Forbudet gjelder lastebil med totalvekt over 3.500 kg.",
                images: ["335_0"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
                    "Forbudt for traktor og motorredskap", "Vektgrense motorvogn",
                    "Totalvektgrense (vogntog)", "Lengdegrense", "Svingeforbud", "Vendingsforbud"
                ]
            ),
            TrafficSign(
                title: "Slutt på forbikjøringsforbud",
                section: "Forbudsskilt",
                description: "",
                images: ["336_0"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Parkering forbudt", "Stans forbudt",
                    "Vendingsforbud", "Forbudt for gående", "Forbudt for ridende",
                    "Forbudt for liten elektrisk motorvogn", "Forbudt for traktor og motorredskap"
                ]
            ),
            TrafficSign(
                title: "Slutt på forbikjøringsforbud for lastebil",
                section: "Forbudsskilt",
                description: "",
                images: ["337_0"],
                wrongAnswers: [
                    "Innkjøring forbudt", "Parkering forbudt", "Stans forbudt",
                    "Vendingsforbud", "Forbudt for gående", "Forbudt for ridende",
                    "Forbudt for liten elektrisk motorvogn", "Forbudt for traktor og motorredskap"
                ]
            ),
            TrafficSign(
                title: "Fartsgrense",
                section: "Forbudsskilt",
                description: "Forbud mot kjøring med høyere fart enn angitt.",
                images: ["362_3", "362_4", "362_5", "362_6", "362_7", "362_8", "362_9", "362_100"],
                wrongAnswers: [
                    "Slutt på særskilt fartsgrense", "Fartsgrensesone", "Generell fartsgrense",
                    "Motorveg", "Motortrafikkveg", "Forkjørsveg",
                    "Parkering forbudt", "Stans forbudt", "Innkjøring forbudt", "Vendingsforbud"
                ]
            ),
            TrafficSign(
                title: "Slutt på særskilt fartsgrense",
                section: "Forbudsskilt",
                description: "",
                images: ["364_3", "364_4", "364_5", "364_6", "364_7", "364_8", ],
                wrongAnswers: [
                    "Fartsgrense", "Fartsgrensesone", "Generell fartsgrense",
                    "Motorveg", "Motortrafikkveg",
                    "Parkering forbudt", "Stans forbudt", "Innkjøring forbudt", "Vendingsforbud"
                ]
            ),
            TrafficSign(
                title: "Fartsgrensesone",
                section: "Forbudsskilt",
                description: "Forbud mot å kjøre med høyere fart enn angitt innenfor sonen.",
                images: ["366_0"],
                wrongAnswers: [
                    "Slutt på fartsgrensesone",
                    "Generell fartsgrense", "Forkjørsveg", "Motorveg",
                    "Parkering forbudt", "Stans forbudt", "Svingeforbud", "Forbikjøringsforbud"
                ]
            ),
            TrafficSign(
                title: "Slutt på fartsgrensesone",
                section: "Forbudsskilt",
                description: "",
                images: ["368_0"],
                wrongAnswers: [
                    "Fartsgrensesone", "Fartsgrense",
                    "Generell fartsgrense", "Motortrafikkveg", "Forkjørsveg",
                    "Parkering forbudt", "Stans forbudt", "Vendingsforbud", "Svingeforbud"
                ]
            ),
            TrafficSign(
                title: "Stans forbudt",
                section: "Forbudsskilt",
                description: "Skiltet angir forbud mot å stanse kjøretøy på den side av vegen hvor skiltet er satt opp. Skiltet gjelder fram til nærmeste vegkryss, eller til nytt skilt 370 «Stans forbudt», 372 «Parkering forbudt», 376 «Parkeringssone», 378 «Slutt på parkeringssone» og 552 «Parkering».",
                images: ["370_0"],
                wrongAnswers: [
                    "Parkering forbudt", "Slutt på parkeringssone", "Slutt på fartsgrensesone",
                    "Slutt på særskilt fartsgrense", "Motorveg", "Motortrafikkveg",
                    "Innkjøring forbudt", "Forkjørsveg", "Vikeplikt"
                ]
            ),
            TrafficSign(
                title: "Parkering forbudt",
                section: "Forbudsskilt",
                description: "Skiltet angir forbud mot parkering på den side av vegen hvor skiltet er satt opp. Skiltet gjelder fram til nærmeste vegkryss, eller til nytt skilt 372 «Parkering forbudt», 370 «Stans forbudt», 376 «Parkeringssone», 378 «Slutt på parkeringssone» og 552 «Parkering».",
                images: ["372_0"],
                wrongAnswers: [
                    "Stans forbudt", "Slutt på parkeringssone", "Fartsgrense",
                    "Innkjøring forbudt", "Forbudt for motorvogn",
                    "Forbudt for transport av farlig gods", "Vendingsforbud",
                    "Forbikjøringsforbud", "Svingeforbud", "Vikeplikt"
                ]
            ),
            TrafficSign(
                title: "Parkeringssone",
                section: "Forbudsskilt",
                description: "Skiltet angir grense for område hvor det gjelder særlige bestemmelser om parkering eller stans av kjøretøy. De særlige bestemmelser som gjelder, framgår av symboler og tekst på skiltet. Skiltet gjelder til det blir opphevet av skilt 378 «Slutt på parkeringssone».",
                images: ["376_1", "376_2", "376_3"],
                wrongAnswers: [
                    "Slutt på parkeringssone", "Parkering forbudt", "Stans forbudt",
                    "Fartsgrensesone", "Slutt på fartsgrensesone",
                    "Innkjøring forbudt", "Forbudt for motorvogn",
                    "Svingeforbud", "Vendingsforbud", "Forbikjøringsforbud"
                ]
            ),
            TrafficSign(
                title: "Sone med parkeringsforbud for liten elektrisk motorvogn",
                section: "Forbudsskilt",
                description: "Skiltet angir grense for område hvor det er forbudt å parkere liten elektrisk motorvogn. Skiltet gjelder til det blir opphevet av skilt 379 «Slutt på sone med parkeringsforbud for liten elektrisk motorvogn». Innenfor området kan det være fastsatt avvikende bestemmelser om parkering eller stans. For disse stedene gjelder ikke soneskiltets bestemmelser.",
                images: ["377_0"],
                wrongAnswers: [
                    "Slutt på sone med parkeringsforbud for liten elektrisk motorvogn",
                    "Sone med bruksforbud for liten elektrisk motorvogn",
                    "Slutt på sone med bruksforbud for liten elektrisk motorvogn",
                    "Parkeringssone", "Slutt på parkeringssone",
                    "Parkering forbudt", "Stans forbudt", "Forbudt for motorvogn"
                ]
            ),
            TrafficSign(
                title: "Slutt på parkeringssone",
                section: "Forbudsskilt",
                description: "Skiltet markerer at bestemmelser angitt ved skilt 376 «Parkeringssone» opphører.",
                images: ["378_1", "378_2"],
                wrongAnswers: [
                    "Parkeringssone", "Sone med parkeringsforbud for liten elektrisk motorvogn",
                    "Slutt på sone med parkeringsforbud for liten elektrisk motorvogn",
                    "Sone med bruksforbud for liten elektrisk motorvogn",
                    "Parkering forbudt", "Stans forbudt",
                    "Fartsgrensesone", "Slutt på fartsgrensesone"
                ]
            ),
            TrafficSign(
                title: "Slutt på sone med parkeringsforbud for liten elektrisk motorvogn",
                section: "Forbudsskilt",
                description: "Skiltet markerer at bestemmelser angitt ved skilt 377 «Sone med parkeringsforbud for liten elektrisk motorvogn» opphører.",
                images: ["379_0"],
                wrongAnswers: [
                    "Sone med parkeringsforbud for liten elektrisk motorvogn",
                    "Parkeringssone", "Slutt på parkeringssone",
                    "Sone med bruksforbud for liten elektrisk motorvogn",
                    "Slutt på sone med bruksforbud for liten elektrisk motorvogn",
                    "Parkering forbudt", "Stans forbudt"
                ]
            ),
            TrafficSign(
                title: "Sone med bruksforbud for liten elektrisk motorvogn",
                section: "Forbudsskilt",
                description: "Skiltet angir grense for område hvor det er forbudt å bruke liten elektrisk motorvogn. Skiltet gjelder til det blir opphevet av skilt 382 «Slutt på sone med bruksforbud for liten elektrisk motorvogn».",
                images: ["380_0"],
                wrongAnswers: [
                    "Slutt på sone med bruksforbud for liten elektrisk motorvogn",
                    "Sone med parkeringsforbud for liten elektrisk motorvogn",
                    "Slutt på sone med parkeringsforbud for liten elektrisk motorvogn",
                    "Parkeringssone", "Slutt på parkeringssone",
                    "Parkering forbudt", "Stans forbudt"
                ]
            ),
            TrafficSign(
                title: "Slutt på sone med bruksforbud for liten elektrisk motorvogn",
                section: "Forbudsskilt",
                description: "Skiltet markerer at bestemmelser angitt ved skilt 380 «Sone med bruksforbud for liten elektrisk motorvogn» opphører.",
                images: ["382_0"],
                wrongAnswers: [
                    "Sone med bruksforbud for liten elektrisk motorvogn",
                    "Sone med parkeringsforbud for liten elektrisk motorvogn",
                    "Slutt på sone med parkeringsforbud for liten elektrisk motorvogn",
                    "Parkeringssone", "Slutt på parkeringssone",
                    "Parkering forbudt", "Stans forbudt"
                ]
            )
        ]
    )
    
    static let paabudsskilt = TrafficSection(
        name: "Påbudsskilt",
        signs: [
            TrafficSign(
                title: "Påbudt kjøreretning",
                section: "Påbudsskilt",
                description: "Skiltet angir at kjørende skal forlate vegkrysset i den retning som er angitt på skiltet.",
                images: ["402_1", "402_2", "402_3", "402_4", "402_5", "402_6", "402_7", "402_8"],
                wrongAnswers: [
                    "Påbudt kjørefelt", "Påbudt rundkjøring", "Påbudt kjøreretning i rundkjøring",
                    "Påbudt kollektivfelt", "Påbudt sykkelveg", "Påbudt gangveg",
                    "Påbudt gang- og sykkelveg", "Påbudt motorveg", "Påbudt forbikjøringsfelt",
                    "Forbudt for motorvogn"
                ]
            ),
            TrafficSign(
                title: "Påbudt kjørefelt",
                section: "Påbudsskilt",
                description: "Skiltet angir at kjørende skal passere skiltet på den side som pilen peker mot.",
                images: ["404_1", "404_2"],
                wrongAnswers: [
                    "Påbudt kjøreretning", "Påbudt rundkjøring", "Påbudt kjøreretning i rundkjøring",
                    "Påbudt sykkelveg", "Påbudt gangveg", "Påbudt gang- og sykkelveg",
                    "Påbudt motorveg", "Påbudt kollektivfelt", "Påbudt forbikjøringsfelt",
                    "Innkjøring forbudt"
                ]
            ),
            TrafficSign(
                title: "Påbudt rundkjøring",
                section: "Påbudsskilt",
                description: "Skiltet angir at kjørende skal kjøre inn i rundkjøring og følge den.",
                images: ["406_0"],
                wrongAnswers: [
                    "Påbudt kjøreretning", "Påbudt kjørefelt", "Påbudt kjøreretning i rundkjøring",
                    "Påbudt kollektivfelt", "Påbudt sykkelveg", "Påbudt gangveg",
                    "Påbudt gang- og sykkelveg", "Påbudt motorveg", "Påbudt forbikjøringsfelt",
                    "Parkering forbudt"
                ]
            ),
            TrafficSign(
                title: "Påbudt kjøreretning i rundkjøring",
                section: "Påbudsskilt",
                description: "Skiltet angir hvilken retning som skal følges i rundkjøringen.",
                images: ["408"],
                wrongAnswers: [
                    "Påbudt kjøreretning", "Påbudt kjørefelt", "Påbudt rundkjøring",
                    "Påbudt kollektivfelt", "Påbudt sykkelveg", "Påbudt gangveg",
                    "Påbudt gang- og sykkelveg", "Påbudt motorveg", "Påbudt forbikjøringsfelt",
                    "Stans forbudt"
                ]
            )
        ]
    )
    
    static let opplysningsskilt = TrafficSection(
        name: "Opplysningsskilt",
        signs: [
            TrafficSign(
                title: "Motorveg",
                section: "Opplysningsskilt",
                description: "Skiltet angir at trafikkreglenes bestemmelser om motorveg gjelder fra skiltet og til skilt 504 «Slutt på motorveg», til skilt 503 «Motortrafikkveg» eller til kryss mellom avkjøringsveg fra motorveg og veg som ikke er motorveg.",
                images: ["502_0"],
                wrongAnswers: [
                    "Slutt på motorveg", "Tungtrafikkfelt",
                    "Kollektivfelt (buss)", "Sambruksfelt", "Gatetun", "Parkering",
                    "Feil kjøreretning", "Blindveg"
                ]
            ),
            TrafficSign(
                title: "Motortrafikkveg",
                section: "Opplysningsskilt",
                description: "Skiltet angir at trafikkreglenes bestemmelser om motortrafikkveg gjelder fra skiltet og til skilt 505 «Slutt på motortrafikkveg», til skilt 502 «Motorveg» eller til kryss mellom avkjøringsveg fra motortrafikkveg og veg som ikke er motortrafikkveg.",
                images: ["503_0"],
                wrongAnswers: [
                    "Slutt på motortrafikkveg", "Tungtrafikkfelt",
                    "Kollektivfelt (buss og drosje)", "Sambruksfelt", "Gågate", "Blindveg",
                    "Møteplass", "Gangfelt"
                ]
            ),
            TrafficSign(
                title: "Slutt på motorveg",
                section: "Opplysningsskilt",
                description: "",
                images: ["504_0"],
                wrongAnswers: [
                    "Motorveg", "Slutt på tungtrafikkfelt",
                    "Kollektivfelt (buss)", "Sambruksfelt", "Gatetun", "Blindveg",
                    "Gangveg", "Valgfritt kjørefelt"
                ]
            ),
            TrafficSign(
                title: "Slutt på motortrafikkveg",
                section: "Opplysningsskilt",
                description: "",
                images: ["505_0"],
                wrongAnswers: [
                    "Motortrafikkveg", "Slutt på tungtrafikkfelt",
                    "Kollektivfelt (buss og drosje)", "Sambruksfelt", "Gågate", "Blindveg",
                    "Gangfelt", "Møteplass"
                ]
            ),
            TrafficSign(
                title: "Tungtrafikkfelt",
                section: "Opplysningsskilt",
                description: "Kjørefelt for motorvogn med tillatt totalvekt høyere enn angitt. Skiltet angir at kjørefelt for tungtrafikk begynner og at trafikkreglenes bestemmelser om tungtrafikkfelt gjelder.",
                images: ["506"],
                wrongAnswers: [
                    "Slutt på tungtrafikkfelt", "Kollektivfelt (buss)", "Kollektivfelt (buss og drosje)",
                    "Sambruksfelt", "Motorveg", "Motortrafikkveg", "Gatetun", "Møteplass",
                    "Parkering", "Sykkelveg"
                ]
            ),
            TrafficSign(
                title: "Slutt på tungtrafikkfelt",
                section: "Opplysningsskilt",
                description: "",
                images: ["507"],
                wrongAnswers: [
                    "Tungtrafikkfelt", "Slutt på kollektivfelt", "Slutt på sambruksfelt",
                    "Motorveg", "Motortrafikkveg", "Sambruksfelt", "Gågate",
                    "Blindveg", "Gangveg", "Gatetun"
                ]
            ),
            TrafficSign(
                title: "Kollektivfelt (buss)",
                section: "Opplysningsskilt",
                description: "Skiltet angir at kollektivfelt begynner og at trafikkreglenes bestemmelser om kollektivfelt gjelder.",
                images: ["508_1"],
                wrongAnswers: [
                    "Sambruksfelt", "Tungtrafikkfelt",
                    "Motorveg", "Motortrafikkveg", "Slutt på kollektivfelt", "Slutt på sambruksfelt",
                    "Gangveg", "Sykkelfelt – sideplassert", "Parkering"
                ]
            ),
            TrafficSign(
                title: "Kollektivfelt (buss og drosje)",
                section: "Opplysningsskilt",
                description: "Skiltet angir at kollektivfelt begynner og at trafikkreglenes bestemmelser om kollektivfelt gjelder.",
                images: ["508_2"],
                wrongAnswers: [
                    "Sambruksfelt", "Tungtrafikkfelt",
                    "Motorveg", "Motortrafikkveg", "Slutt på kollektivfelt", "Slutt på sambruksfelt",
                    "Gangveg", "Sykkelfelt – midtstilt", "Parkering"
                ]
            ),
            TrafficSign(
                title: "Sambruksfelt",
                section: "Opplysningsskilt",
                description: "Skiltet angir at sambruksfelt begynner og at trafikkreglenes bestemmelser om sambruksfelt gjelder.",
                images: ["509_0"],
                wrongAnswers: [
                    "Kollektivfelt (buss)", "Tungtrafikkfelt",
                    "Motorveg", "Motortrafikkveg", "Slutt på sambruksfelt", "Slutt på kollektivfelt",
                    "Gangveg", "Sykkelveg", "Parkering"
                ]
            ),
            TrafficSign(
                title: "Slutt på kollektivfelt",
                section: "Opplysningsskilt",
                description: "",
                images: ["510_1", "510_2"],
                wrongAnswers: [
                    "Kollektivfelt (buss og drosje)", "Sambruksfelt",
                    "Slutt på sambruksfelt", "Motorveg", "Motortrafikkveg", "Tungtrafikkfelt",
                    "Gågate", "Parkering", "Gangfelt"
                ]
            ),
            TrafficSign(
                title: "Slutt på sambruksfelt",
                section: "Opplysningsskilt",
                description: "",
                images: ["511_0"],
                wrongAnswers: [
                    "Sambruksfelt", "Kollektivfelt (buss)",
                    "Slutt på kollektivfelt", "Tungtrafikkfelt", "Motorveg", "Motortrafikkveg",
                    "Gangveg", "Sykkelfelt – midtstilt", "Parkering"
                ]
            ),
            TrafficSign(
                title: "Holdeplass for buss",
                section: "Opplysningsskilt",
                description: "Skiltet angir at det er holdeplass for buss på stedet og at trafikkreglenes bestemmelser om holdeplass gjelder. Skiltet kan plasseres på leskur og på rutetavle.",
                images: ["512_0"],
                wrongAnswers: [
                    "Holdeplass for sporvogn", "Holdeplass for drosje", "Parkering",
                    "Kollektivfelt (buss)", "Møteplass",
                    "Blindveg", "Gangfelt", "Gågate", "Sykkelveg"
                ]
            ),
            TrafficSign(
                title: "Holdeplass for sporvogn",
                section: "Opplysningsskilt",
                description: "Skiltet angir at det er holdeplass for sporvogn på stedet og at trafikkreglenes bestemmelser om holdeplass gjelder. Skiltet kan plasseres på leskur og på rutetavle.",
                images: ["513_0"],
                wrongAnswers: [
                    "Holdeplass for buss", "Holdeplass for drosje", "Parkering",
                    "Kollektivfelt (buss og drosje)", "Møteplass",
                    "Blindveg", "Gangfelt", "Gågate", "Sykkelveg"
                ]
            ),
            TrafficSign(
                title: "Holdeplass for drosje",
                section: "Opplysningsskilt",
                description: "Skiltet angir at det er holdeplass for drosje på stedet og at trafikkreglenes bestemmelser om holdeplass gjelder. Skiltet kan plasseres på leskur.",
                images: ["514_0"],
                wrongAnswers: [
                    "Holdeplass for buss", "Holdeplass for sporvogn", "Parkering",
                    "Kollektivfelt (buss)", "Møteplass",
                    "Blindveg", "Gangfelt", "Gågate", "Sykkelveg"
                ]
            ),
            TrafficSign(
                title: "Gangfelt",
                section: "Opplysningsskilt",
                description: "Skiltet angir kryssingssted for gående hvor trafikkreglenes bestemmelser om gangfelt gjelder.",
                images: ["516_H", "516_V"],
                wrongAnswers: [
                    "Sykkelveg", "Møteplass", "Blindveg", "Valgfritt kjørefelt",
                    "Parkering", "Holdeplass for buss"
                ]
            ),
            TrafficSign(
                title: "Gangveg",
                section: "Opplysningsskilt",
                description: "Skiltet angir veg som er anlagt for gående. Skiltet angir dessuten at trafikkreglenes bestemmelser om bruk av slik veg gjelder.",
                images: ["518_0"],
                wrongAnswers: [
                    "Sykkelveg", "Møteplass", "Blindveg", "Valgfritt kjørefelt",
                    "Parkering", "Holdeplass for buss"
                ]
            ),
            TrafficSign(
                title: "Sykkelveg",
                section: "Opplysningsskilt",
                description: "Skiltet angir veg som er anlagt for syklende og fører av liten elektrisk motorvogn.",
                images: ["520_0"],
                wrongAnswers: [
                    "Gangveg", "Møteplass", "Blindveg", "Valgfritt kjørefelt",
                    "Parkering", "Holdeplass for buss"
                ]
            ),
            TrafficSign(
                title: "Sykkelfelt – sideplassert",
                section: "Opplysningsskilt",
                description: "Skiltet angir at kjørebanen har eget kjørefelt for syklende og fører av liten elektrisk motorvogn.",
                images: ["521_0"],
                wrongAnswers: [
                    "Gangveg",
                    "Gågate", "Møteplass", "Blindveg", "Valgfritt kjørefelt",
                    "Parkering", "Holdeplass for buss"
                ]
            ),
            TrafficSign(
                title: "Sykkelfelt – midtstilt",
                section: "Opplysningsskilt",
                description: "Skiltet angir at kjørebanen har eget kjørefelt for syklende og fører av liten elektrisk motorvogn.",
                images: ["521_1"],
                wrongAnswers: [
                    "Gangfelt",
                    "Gågate", "Møteplass", "Blindveg", "Valgfritt kjørefelt",
                    "Parkering", "Holdeplass for buss"
                ]
            ),
            TrafficSign(
                title: "Gang- og sykkelveg",
                section: "Opplysningsskilt",
                description: "Skiltet angir veg som er anlagt for gående, syklende og fører av liten elektrisk motorvogn.",
                images: ["522_0"],
                wrongAnswers: [
                    "Sykkelveg", "Møteplass", "Blindveg", "Valgfritt kjørefelt",
                    "Parkering", "Holdeplass for buss"
                ]
            ),
            TrafficSign(
                title: "Møteplass",
                section: "Opplysningsskilt",
                description: "Skiltet angir sted hvor trafikkreglenes bestemmelser om møteplass gjelder.",
                images: ["524_0"],
                wrongAnswers: [
                    "Gangfelt", "Blindveg", "Valgfritt kjørefelt",
                    "Parkering", "Holdeplass for buss", "Gågate"
                ]
            ),
            TrafficSign(
                title: "Envegskjøring",
                section: "Opplysningsskilt",
                description: "Skiltet angir at kjøring bare er tillatt i pilens retning fram til første vegkryss.",
                images: ["526_1", "526_2"],
                wrongAnswers: [
                    "Blindveg", "Valgfritt kjørefelt", "Sammenfletting", "Kjørefelt slutter",
                    "Kjørefelt begynner", "Endret kjøremønster", "Møteplass", "Parkering",
                    "Gatetun", "Feil kjøreretning"
                ]
            ),
            TrafficSign(
                title: "Blindveg",
                section: "Opplysningsskilt",
                description: "Skiltet viser at vegen er fysisk stengt, eller kun stengt for biltrafikk men åpen for gående/syklende.",
                images: ["527_1", "527_2", "527_3", "527_4"],
                wrongAnswers: [
                    "Envegskjøring", "Valgfritt kjørefelt", "Sammenfletting", "Kjørefelt slutter",
                    "Kjørefelt begynner", "Endret kjøremønster", "Møteplass", "Parkering",
                    "Gatetun", "Feil kjøreretning"
                ]
            ),
            TrafficSign(
                title: "Valgfritt kjørefelt",
                section: "Opplysningsskilt",
                description: "",
                images: ["528_0"],
                wrongAnswers: [
                    "Blindveg", "Envegskjøring", "Sammenfletting", "Kjørefelt slutter",
                    "Kjørefelt begynner", "Endret kjøremønster", "Møteplass", "Parkering",
                    "Gatetun", "Feil kjøreretning"
                ]
            ),
            TrafficSign(
                title: "Sammenfletting",
                section: "Opplysningsskilt",
                description: "Skiltet angir at kjørefelt føres sammen til ett med gjensidig tilpassing i samsvar med trafikkreglenes bestemmelser (fletting).",
                images: ["530a", "530b"],
                wrongAnswers: [
                    "Valgfritt kjørefelt", "Blindveg", "Envegskjøring", "Kjørefelt slutter",
                    "Kjørefelt begynner", "Endret kjøremønster", "Møteplass", "Parkering",
                    "Gatetun", "Feil kjøreretning"
                ]
            ),
            TrafficSign(
                title: "Felt for fartsøkning",
                section: "Opplysningsskilt",
                description: "Skiltet angir at felt for fartsøkning føres inn på annet kjørefelt med gjensidig tilpassing.",
                images: ["531_1", "531_2"],
                wrongAnswers: [
                    "Kjørefelt slutter", "Kjørefelt begynner", "Sammenfletting", "Valgfritt kjørefelt",
                    "Blindveg", "Envegskjøring", "Endret kjøremønster", "Parkering",
                    "Gatetun", "Feil kjøreretning"
                ]
            ),
            TrafficSign(
                title: "Kjørefelt slutter",
                section: "Opplysningsskilt",
                description: "Kjørende i felt som slutter skal skifte felt og har vikeplikt i samsvar med trafikkreglene.",
                images: ["532a", "532b"],
                wrongAnswers: [
                    "Kjørefelt begynner", "Felt for fartsøkning", "Sammenfletting", "Valgfritt kjørefelt",
                    "Blindveg", "Envegskjøring", "Endret kjøremønster", "Parkering",
                    "Gatetun", "Feil kjøreretning"
                ]
            ),
            TrafficSign(
                title: "Kjørefelt begynner",
                section: "Opplysningsskilt",
                description: "",
                images: ["534a", "534b", "534c"],
                wrongAnswers: [
                    "Kjørefelt slutter", "Felt for fartsøkning", "Sammenfletting", "Valgfritt kjørefelt",
                    "Blindveg", "Envegskjøring", "Endret kjøremønster", "Parkering",
                    "Gatetun", "Feil kjøreretning"
                ]
            ),
            TrafficSign(
                title: "Påkjøring fortsetter i eget kjørefelt",
                section: "Opplysningsskilt",
                description: "",
                images: ["536_1", "536_2", "536_3", "536_4"],
                wrongAnswers: [
                    "Kjørefelt slutter", "Felt for fartsøkning", "Sammenfletting",
                    "Valgfritt kjørefelt", "Blindveg", "Envegskjøring", "Endret kjøremønster"
                ]
            ),
            TrafficSign(
                title: "Kjørefeltinndeling",
                section: "Opplysningsskilt",
                description: "Skiltet angir antall kjørefelt på kjørebanen, og kjøreretningen for de enkelte felt.",
                images: ["538_0", "538_1", "538_2"],
                wrongAnswers: [
                    "Kjørefelt begynner", "Kjørefelt slutter", "Felt for fartsøkning", "Sammenfletting",
                    "Valgfritt kjørefelt", "Blindveg", "Envegskjøring", "Endret kjøremønster"
                ]
            ),
            TrafficSign(
                title: "Endret kjøremønster",
                section: "Opplysningsskilt",
                description: "",
                images: ["539_0"],
                wrongAnswers: [
                    "Kjørefeltinndeling", "Kjørefelt begynner", "Kjørefelt slutter", "Felt for fartsøkning",
                    "Sammenfletting", "Valgfritt kjørefelt", "Blindveg", "Envegskjøring"
                ]
            ),
            TrafficSign(
                title: "Gatetun",
                section: "Opplysningsskilt",
                description: "Skiltet angir grense for område hvor trafikkreglenes bestemmelser om gatetun gjelder.",
                images: ["540_0"],
                wrongAnswers: [
                    "Parkering", "Blindveg",
                    "Møteplass", "Gangfelt", "Gangveg", "Sykkelveg",
                    "Feil kjøreretning", "Holdeplass for buss"
                ]
            ),
            TrafficSign(
                title: "Slutt på gatetun",
                section: "Opplysningsskilt",
                description: "",
                images: ["542_0"],
                wrongAnswers: [
                    "Slutt på motorveg",
                    "Slutt på motortrafikkveg",
                    "Slutt på tungtrafikkfelt",
                    "Slutt på kollektivfelt",
                    "Slutt på sambruksfelt",
                    "Slutt på fartsgrensesone",
                    "Slutt på parkeringssone",
                    "Slutt på sone med bruksforbud",
                    "Slutt på særskilt fartsgrense"
                ]
            ),
            TrafficSign(
                title: "Gågate",
                section: "Opplysningsskilt",
                description: "Skiltet angir grense for område hvor det er forbudt å kjøre motorvogn unntatt liten elektrisk motorvogn.",
                images: ["548_0"],
                wrongAnswers: [
                    "Parkering",
                    "Blindveg", "Møteplass",
                    "Sykkelveg", "Holdeplass for buss"
                ]
            ),
            TrafficSign(
                title: "Slutt på gågate",
                section: "Opplysningsskilt",
                description: "",
                images: ["550_0"],
                wrongAnswers: [
                    "Slutt på motorveg",
                    "Slutt på motortrafikkveg",
                    "Slutt på tungtrafikkfelt",
                    "Slutt på kollektivfelt",
                    "Slutt på sambruksfelt",
                    "Slutt på fartsgrensesone",
                    "Slutt på parkeringssone",
                    "Slutt på sone med bruksforbud",
                    "Slutt på særskilt fartsgrense"
                ]
            ),
            TrafficSign(
                title: "Parkering",
                section: "Opplysningsskilt",
                description: "Skiltet angir at parkering er tillatt på stedet, dersom parkeringen ikke er i strid med trafikkreglene.",
                images: ["552_0"],
                wrongAnswers: [
                    "Gågate", "Gatetun", "Slutt på gågate", "Slutt på gatetun",
                    "Blindveg", "Møteplass", "Gangfelt", "Gangveg",
                    "Sykkelveg", "Holdeplass for buss"
                ]
            ),
            TrafficSign(
                title: "Havarilomme",
                section: "Opplysningsskilt",
                description: "",
                images: ["555_0"],
                wrongAnswers: [
                    "Parkering", "Møteplass", "Blindveg", "Envegskjøring",
                    "Valgfritt kjørefelt", "Gangfelt", "Sykkelveg",
                    "Gatetun", "Gågate"
                ]
            ),
            TrafficSign(
                title: "Automatisk trafikkontroll – punktmåling",
                section: "Opplysningsskilt",
                description: "",
                images: ["556_1"],
                wrongAnswers: [
                    "Opplysningstavle",
                    "Feil kjøreretning", "Nødutgang", "Parkering", "Blindveg",
                    "Gågate", "Gatetun", "Møteplass"
                ]
            ),
            TrafficSign(
                title: "Automatisk trafikkontroll – strekningsmåling",
                section: "Opplysningsskilt",
                description: "",
                images: ["556_2"],
                wrongAnswers: [
                    "Opplysningstavle",
                    "Feil kjøreretning", "Nødutgang", "Parkering", "Blindveg",
                    "Gågate", "Gatetun", "Møteplass"
                ]
            ),
            TrafficSign(
                title: "Videokontroll/-overvåking",
                section: "Opplysningsskilt",
                description: "",
                images: ["558_0"],
                wrongAnswers: [
                    "Opplysningstavle",
                    "Feil kjøreretning", "Nødutgang", "Parkering", "Blindveg",
                    "Gågate", "Gatetun", "Møteplass"
                ]
            ),
            TrafficSign(
                title: "Opplysningstavle",
                section: "Opplysningsskilt",
                description: "Skiltet kan gi opplysning om veg- og trafikkforhold som ikke kan formidles ved andre trafikkskilt.",
                images: ["560_0"],
                wrongAnswers: [
                    "Videokontroll/-overvåking",
                    "Feil kjøreretning", "Nødutgang", "Parkering", "Blindveg",
                    "Gågate", "Gatetun", "Møteplass"
                ]
            ),
            TrafficSign(
                title: "Feil kjøreretning",
                section: "Opplysningsskilt",
                description: "",
                images: ["565_0"],
                wrongAnswers: [
                    "Nødutgang", "Parkering", "Blindveg", "Gågate",
                    "Gatetun", "Møteplass"
                ]
            ),
            TrafficSign(
                title: "Nødutgang",
                section: "Opplysningsskilt",
                description: "",
                images: ["570_1V", "570_1H"],
                wrongAnswers: [
                    "Opplysningstavle", "Parkering", "Blindveg", "Gågate",
                    "Gatetun", "Møteplass"
                ]
            ),
            //            TrafficSign(
            //                title: "Retning og avstand til nødutgang",
            //                description: "",
            //                images: ["570_2V", "570_2H"],
            //                isPortrait: false
            //            )
        ]
    )
    
    static let serviceskilt = TrafficSection(
        name: "Serviceskilt",
        signs: [
            // A. Skilt for nødhjelp og vegservice
            TrafficSign(
                title: "Lytt til radio",
                section: "serviceskilt",
                description: "",
                images: ["601_1"],
                wrongAnswers: [
                    "Førstehjelp", "Nødtelefon", "Brannslokningsapparat",
                    "Informasjon", "Turistkontor", "Drivstoff",
                    "Rasteplass", "Overnattingssted", "Toalett", "Campingplass"
                ]
            ),
            TrafficSign(
                title: "Førstehjelp",
                section: "serviceskilt",
                description: "",
                images: ["602"],
                wrongAnswers: [
                    "Lytt til radio", "Nødtelefon", "Brannslokningsapparat",
                    "Kjøretøyverksted", "Informasjon", "Turistkontor",
                    "Toalett", "Rasteplass", "Campingplass", "Spisested"
                ]
            ),
            TrafficSign(
                title: "Nødtelefon",
                section: "serviceskilt",
                description: "",
                images: ["605_0"],
                wrongAnswers: [
                    "Førstehjelp", "Brannslokningsapparat", "Lytt til radio",
                    "Informasjon", "Turistkontor", "Kjøretøyverksted",
                    "Rasteplass", "Toalett", "Overnattingssted", "Campingplass"
                ]
            ),
            TrafficSign(
                title: "Brannslokningsapparat",
                section: "serviceskilt",
                description: "",
                images: ["606_0"],
                wrongAnswers: [
                    "Førstehjelp", "Nødtelefon", "Lytt til radio",
                    "Kjøretøyverksted", "Hurtiglading av motorvogn", "Drivstoff",
                    "Informasjon", "Rasteplass", "Campingplass", "Overnattingssted"
                ]
            ),
            TrafficSign(
                title: "Kjøretøyverksted",
                section: "serviceskilt",
                description: "",
                images: ["608_0"],
                wrongAnswers: [
                    "Drivstoff", "Hurtiglading av motorvogn", "Rasteplass",
                    "Lytt til radio", "Førstehjelp", "Nødtelefon",
                    "Campingplass", "Overnattingssted", "Toalett", "Informasjon"
                ]
            ),
            TrafficSign(
                title: "Hurtiglading av motorvogn",
                section: "serviceskilt",
                description: "",
                images: ["609"],
                wrongAnswers: [
                    "Drivstoff", "Kjøretøyverksted", "Toalett",
                    "Rasteplass", "Campingplass", "Overnattingssted",
                    "Lytt til radio", "Førstehjelp", "Informasjon", "Turistkontor"
                ]
            ),
            TrafficSign(
                title: "Drivstoff",
                section: "serviceskilt",
                description: "",
                images: ["610_0", "610_1", "610_2"],
                wrongAnswers: [
                    "Hurtiglading av motorvogn", "Kjøretøyverksted", "Rasteplass",
                    "Campingplass", "Overnattingssted", "Toalett",
                    "Spisested", "Informasjon", "Turistkontor", "Lytt til radio"
                ]
            ),
            TrafficSign(
                title: "Toalettømmeanlegg",
                section: "serviceskilt",
                description: "Skiltet angir mottaksanlegg for toalettavfall fra campingvogner, bobiler og busser.",
                images: ["611_0"],
                wrongAnswers: [
                    "Toalett", "Rasteplass", "Campingplass",
                    "Bobilplass", "Campinghytter", "Overnattingssted",
                    "Informasjon", "Spisested", "Drivstoff", "Vandrerhjem"
                ]
            ),
            TrafficSign(
                title: "Toalett",
                section: "serviceskilt",
                description: "",
                images: ["612_0"],
                wrongAnswers: [
                    "Toalettømmeanlegg", "Rasteplass", "Campingplass",
                    "Bobilplass", "Overnattingssted", "Rom og frokost",
                    "Drivstoff", "Informasjon", "Spisested", "Campinghytter"
                ]
            ),
            TrafficSign(
                title: "Rasteplass",
                section: "serviceskilt",
                description: "",
                images: ["613_1", "613_2"],
                wrongAnswers: [
                    "Bobilplass", "Overnattingssted",
                    "Toalett", "Informasjon",
                    "Turistkontor", "Drivstoff",  "Lytt til radio"
                ]
            ),
            TrafficSign(
                title: "Enklere servering",
                section: "serviceskilt",
                description: "",
                images: ["614_0"],
                wrongAnswers: [
                    "Campingplass", "Rasteplass",
                    "Toalett", "Overnattingssted",
                    "Informasjon", "Turistkontor", "Drivstoff", "Vandrerhjem"
                ]
            ),
            TrafficSign(
                title: "Spisested",
                section: "serviceskilt",
                description: "",
                images: ["616_0"],
                wrongAnswers: [
                    "Rasteplass", "Campingplass",
                    "Overnattingssted", "Toalett",
                    "Informasjon", "Turistkontor", "Campinghytter", "Bobilplass"
                ]
            ),
            TrafficSign(
                title: "Campingplass",
                section: "serviceskilt",
                description: "",
                images: ["618_0"],
                wrongAnswers: [
                    "Toalettømmeanlegg", "Toalett",
                    "Vandrerhjem", "Rom og frokost", "Spisested", "Turistkontor"
                ]
            ),
            TrafficSign(
                title: "Bobilplass",
                section: "serviceskilt",
                description: "",
                images: ["621_0"],
                wrongAnswers: [
                    "Campinghytter", "Rasteplass",
                    "Toalettømmeanlegg", "Toalett", "Overnattingssted",
                    "Rom og frokost", "Spisested", "Informasjon", "Vandrerhjem"
                ]
            ),
            TrafficSign(
                title: "Campinghytter",
                section: "serviceskilt",
                description: "",
                images: ["622_0"],
                wrongAnswers: [
                    "Bobilplass", "Rasteplass",
                    "Overnattingssted", "Rom og frokost", "Vandrerhjem",
                    "Spisested", "Enklere servering", "Turistkontor", "Toalett"
                ]
            ),
            TrafficSign(
                title: "Vandrerhjem",
                section: "serviceskilt",
                description: "",
                images: ["624_0"],
                wrongAnswers: [
                    "Rom og frokost", "Campingplass",
                    "Bobilplass", "Rasteplass",
                    "Toalett", "Informasjon", "Turistkontor", "Spisested"
                ]
            ),
            TrafficSign(
                title: "Rom og frokost",
                section: "serviceskilt",
                description: "",
                images: ["625_0"],
                wrongAnswers: [
                    "Vandrerhjem", "Overnattingssted", "Campingplass",
                    "Campinghytter", "Bobilplass", "Rasteplass",
                    "Toalett", "Turistkontor"
                ]
            ),
            TrafficSign(
                title: "Overnattingssted",
                section: "serviceskilt",
                description: "",
                images: ["626_0"],
                wrongAnswers: [
                    "Vandrerhjem", "Campingplass",
                    "Campinghytter", "Bobilplass", "Rasteplass",
                    "Toalett", "Spisested", "Informasjon", "Turistkontor"
                ]
            ),
            TrafficSign(
                title: "Informasjon",
                section: "serviceskilt",
                description: "",
                images: ["635_0"],
                wrongAnswers: [
                    "Severdighet", "Museum/galleri",
                    "Utsiktspunkt", "Naturvernområde", "Verdensarv",
                    "Rasteplass", "Toalett", "Campingplass", "Overnattingssted"
                ]
            ),
            TrafficSign(
                title: "Turistkontor",
                section: "serviceskilt",
                description: "",
                images: ["637_0"],
                wrongAnswers: [
                    "Severdighet", "Museum/galleri",
                    "Utsiktspunkt", "Naturvernområde", "Verdensarv",
                    "Rasteplass", "Toalett", "Campingplass", "Overnattingssted"
                ]
            ),
            //            TrafficSign(title: "Døgnhvileplass", description: "", images: ["638_0"]),
            
            // B. Skilt for severdigheter, aktiviteter, friluftsliv m.m.
            TrafficSign(
                title: "Severdighet",
                section: "serviceskilt",
                description: "For severdighet av særlig stor betydning kan symbolet erstattes av symbol tilpasset severdigheten.",
                images: ["640_10"],
                wrongAnswers: [
                    "Informasjon",
                    "Turistkontor", "Spisested", "Campingplass", "Overnattingssted"
                ]
            ),
            TrafficSign(
                title: "Museum/galleri",
                section: "serviceskilt",
                description: "",
                images: ["640_12"],
                wrongAnswers: [
                    "Severdighet", "Utsiktspunkt", "Naturvernområde",
                    "Verdensarv", "Nasjonale festningsverk", "Informasjon",
                    "Turistkontor", "Campingplass", "Spisested", "Overnattingssted"
                ]
            ),
            TrafficSign(
                title: "Utsiktspunkt",
                section: "serviceskilt",
                description: "",
                images: ["640_20"],
                wrongAnswers: [
                    "Museum/galleri", "Turistkontor",
                    "Informasjon", "Rasteplass", "Campingplass", "Spisested"
                ]
            ),
            TrafficSign(
                title: "Naturvernområde",
                section: "serviceskilt",
                description: "",
                images: ["640_30"],
                wrongAnswers: [
                    "Utsiktspunkt", "Museum/galleri",
                    "Nasjonale festningsverk", "Turistkontor",
                    "Informasjon", "Campingplass", "Spisested", "Overnattingssted"
                ]
            ),
            TrafficSign(
                title: "Verdensarv",
                section: "serviceskilt",
                description: "",
                images: ["640_101"],
                wrongAnswers: [
                    "Utsiktspunkt",
                    "Museum/galleri", "Nasjonale festningsverk", "Turistkontor",
                    "Informasjon", "Campingplass", "Spisested", "Overnattingssted"
                ]
            ),
            TrafficSign(
                title: "Nasjonale festningsverk",
                section: "serviceskilt",
                description: "",
                images: ["640_102"],
                wrongAnswers: [
                    "Museum/galleri", "Utsiktspunkt", "Turistkontor",
                    "Informasjon", "Campingplass", "Spisested", "Overnattingssted"
                ]
            ),
            TrafficSign(
                title: "Badeplass",
                section: "serviceskilt",
                description: "",
                images: ["650_10"],
                wrongAnswers: [
                    "Fiskeplass", "Tursti", "Skiløype",
                    "Sykkelløype", "Campingplass", "Rasteplass",
                    "Spisested", "Severdighet", "Utsiktspunkt", "Overnattingssted"
                ]
            ),
            TrafficSign(
                title: "Fiskeplass",
                section: "serviceskilt",
                description: "",
                images: ["650_11"],
                wrongAnswers: [
                    "Badeplass", "Tursti", "Skiløype",
                    "Sykkelløype", "Campingplass", "Rasteplass",
                    "Spisested", "Severdighet", "Utsiktspunkt", "Overnattingssted"
                ]
            ),
            TrafficSign(
                title: "Tursti",
                section: "serviceskilt",
                description: "",
                images: ["650_20"],
                wrongAnswers: [
                    "Skiløype", "Sykkelløype", "Fiskeplass",
                    "Badeplass", "Naturvernområde", "Severdighet",
                    "Utsiktspunkt", "Campingplass", "Spisested", "Overnattingssted"
                ]
            ),
            TrafficSign(
                title: "Skiløype",
                section: "serviceskilt",
                description: "",
                images: ["650_21"],
                wrongAnswers: [
                    "Tursti", "Sykkelløype", "Fiskeplass",
                    "Badeplass", "Naturvernområde", "Severdighet",
                    "Utsiktspunkt", "Campingplass", "Spisested", "Overnattingssted"
                ]
            ),
            TrafficSign(
                title: "Sykkelløype",
                section: "serviceskilt",
                description: "",
                images: ["650_22"],
                wrongAnswers: [
                    "Skiløype", "Tursti", "Fiskeplass",
                    "Badeplass", "Naturvernområde", "Severdighet",
                    "Utsiktspunkt", "Campingplass", "Spisested", "Overnattingssted"
                ]
            ),
            TrafficSign(
                title: "Gardsmat/bygdeturisme",
                section: "serviceskilt",
                description: "",
                images: ["650_40"],
                wrongAnswers: [
                    "Campingplass", "Spisested", "Enklere servering",
                    "Rom og frokost", "Overnattingssted", "Turistkontor",
                    "Informasjon", "Severdighet", "Museum/galleri", "Rasteplass"
                ]
            ),
            TrafficSign(
                title: "Olavsrosa",
                section: "serviceskilt",
                description: "",
                images: ["650_41"],
                wrongAnswers: [
                    "Severdighet", "Museum/galleri", "Naturvernområde",
                    "Verdensarv", "Nasjonale festningsverk", "Turistkontor",
                    "Informasjon", "Utsiktspunkt", "Campingplass", "Spisested"
                ]
            )
        ]
    )
    
    static let underskilt = TrafficSection(
        name: "Underskilt",
        signs: [
            // A. Alminnelige underskilt
            TrafficSign(
                title: "Avstand",
                section: "Underskilt",
                description: "Underskiltet angir avstanden til det sted hvor hovedskiltet begynner å gjelde, eller til sted hvor tilsvarende hovedskilt er satt opp (forvarsling).",
                images: ["802_0"],
                wrongAnswers: [
                    "Utstrekning", "Tid", "Svingpil",
                    "Forvarsling av stopp", "Oppstilling av parkert kjøretøy",
                    "Kombinert regulering", "Anbefalt fart", "Stigningsgrad"
                ]
            ),
            TrafficSign(
                title: "Utstrekning",
                section: "Underskilt",
                description: "Underskiltet angir at hovedskiltet gjelder for bestemt vegstrekning.",
                images: ["804_0"],
                wrongAnswers: [
                    "Avstand", "Tid", "Svingpil",
                    "Utstrekning av stans- og parkeringsregulering", "Kombinert regulering",
                    "Forløp av forkjørsveg", "Oppstilling av parkert kjøretøy", "Sykkeltrafikk i begge retninger"
                ]
            ),
            TrafficSign(
                title: "Tid",
                section: "Underskilt",
                description: "Underskiltet angir at hovedskiltet bare gjelder i det eller de tidsrom som er angitt med klokkeslett.",
                images: ["806_0"],
                wrongAnswers: [
                    "Avstand", "Utstrekning", "Svingpil",
                    "Parkeringsskive/gratisbillett", "Kombinert regulering",
                    "Forvarsling av stopp", "Oppstilling av parkert kjøretøy", "Anbefalt fart"
                ]
            ),
            TrafficSign(
                title: "Personbil",
                section: "Underskilt",
                description: "",
                images: ["807_1"],
                wrongAnswers: [
                    "Varebil, lastebil og trekkbil", "Buss", "Vogntog",
                    "Campingtilhenger og trekkvogn", "Bobil", "Motorsykkel og moped",
                    "Sykkel og liten elektrisk motorvogn", "Liten elektrisk motorvogn"
                ]
            ),
            TrafficSign(
                title: "Varebil, lastebil og trekkbil",
                section: "Underskilt",
                description: "",
                images: ["807_2"],
                wrongAnswers: [
                    "Personbil", "Buss", "Vogntog",
                    "Campingtilhenger og trekkvogn", "Bobil", "Motorsykkel og moped",
                    "Sykkel og liten elektrisk motorvogn", "Liten elektrisk motorvogn"
                ]
            ),
            TrafficSign(
                title: "Buss",
                section: "Underskilt",
                description: "",
                images: ["807_3"],
                wrongAnswers: [
                    "Personbil", "Varebil, lastebil og trekkbil", "Vogntog",
                    "Campingtilhenger og trekkvogn", "Bobil", "Motorsykkel og moped",
                    "Sykkel og liten elektrisk motorvogn", "Liten elektrisk motorvogn"
                ]
            ),
            TrafficSign(
                title: "Vogntog",
                section: "Underskilt",
                description: "",
                images: ["807_4"],
                wrongAnswers: [
                    "Personbil", "Buss", "Varebil, lastebil og trekkbil",
                    "Campingtilhenger og trekkvogn", "Bobil", "Motorsykkel og moped",
                    "Sykkel og liten elektrisk motorvogn", "Forflytningshemmede", "Liten elektrisk motorvogn"
                ]
            ),
            TrafficSign(
                title: "Campingtilhenger og trekkvogn",
                section: "Underskilt",
                description: "",
                images: ["807_5"],
                wrongAnswers: [
                    "Personbil", "Buss", "Vogntog",
                    "Varebil, lastebil og trekkbil", "Bobil", "Motorsykkel og moped",
                    "Sykkel og liten elektrisk motorvogn", "Forflytningshemmede", "Liten elektrisk motorvogn"
                ]
            ),
            TrafficSign(
                title: "Sykkel og liten elektrisk motorvogn",
                section: "Underskilt",
                description: "",
                images: ["807_6"],
                wrongAnswers: [
                    "Personbil", "Buss", "Vogntog",
                    "Campingtilhenger og trekkvogn", "Bobil", "Motorsykkel og moped",
                    "Forflytningshemmede", "Liten elektrisk motorvogn", "Varebil, lastebil og trekkbil"
                ]
            ),
            TrafficSign(
                title: "Motorsykkel og moped",
                section: "Underskilt",
                description: "",
                images: ["807_7"],
                wrongAnswers: [
                    "Personbil", "Buss", "Vogntog",
                    "Campingtilhenger og trekkvogn", "Bobil", "Sykkel og liten elektrisk motorvogn",
                    "Forflytningshemmede", "Liten elektrisk motorvogn", "Varebil, lastebil og trekkbil"
                ]
            ),
            TrafficSign(
                title: "Forflytningshemmede",
                section: "Underskilt",
                description: "",
                images: ["807_8"],
                wrongAnswers: [
                    "Personbil", "Buss", "Vogntog",
                    "Campingtilhenger og trekkvogn", "Bobil", "Motorsykkel og moped",
                    "Sykkel og liten elektrisk motorvogn", "Liten elektrisk motorvogn", "Varebil, lastebil og trekkbil"
                ]
            ),
            TrafficSign(
                title: "Bobil",
                section: "Underskilt",
                description: "",
                images: ["807_9"],
                wrongAnswers: [
                    "Personbil", "Buss", "Vogntog",
                    "Campingtilhenger og trekkvogn", "Varebil, lastebil og trekkbil", "Motorsykkel og moped",
                    "Sykkel og liten elektrisk motorvogn", "Forflytningshemmede", "Liten elektrisk motorvogn"
                ]
            ),
            TrafficSign(
                title: "Liten elektrisk motorvogn",
                section: "Underskilt",
                description: "",
                images: ["807_10"],
                wrongAnswers: [
                    "Personbil", "Buss", "Vogntog",
                    "Campingtilhenger og trekkvogn", "Bobil", "Motorsykkel og moped",
                    "Forflytningshemmede", "Varebil, lastebil og trekkbil"
                ]
            ),
            TrafficSign(
                title: "Tekst",
                section: "Underskilt",
                description: "Underskiltet brukes når det ikke er hensiktsmessig å gi regulering eller informasjon med symbol, tall eller annet.",
                images: ["808_42b"],
                wrongAnswers: [
                    "Tid", "Avstand", "Utstrekning",
                    "Svingpil", "Kombinert regulering",
                    "Parkeringsskive/gratisbillett", "Oppstilling av parkert kjøretøy", "Forvarsling av stopp", "Sykkeltrafikk i begge retninger"
                ]
            ),
            TrafficSign(
                title: "Svingpil",
                section: "Underskilt",
                description: "Underskiltet angir at hovedskiltet gjelder etter sving i vegkryss.",
                images: ["810_H45", "810_H90", "810_H135", "810_R", "810_V45", "810_V90", "810_V135"],
                wrongAnswers: [
                    "Tid", "Avstand", "Utstrekning",
                    "Tekst", "Utstrekning av stans- og parkeringsregulering",
                    "Forvarsling av stopp", "Forløp av forkjørsveg", "Oppstilling av parkert kjøretøy", "Sykkeltrafikk i begge retninger"
                ]
            ),
            
            // B. Spesielle underskilt
            // I. Til fareskilt
            TrafficSign(
                title: "Anbefalt fart",
                section: "Underskilt",
                description: "Underskiltet angir den høyeste fart som den varslede fare tilsier under normale forhold.",
                images: ["812_0"],
                wrongAnswers: [
                    "Stigningsgrad", "Virkelig fri vegbredde", "Kryssende tømmertransport",
                    "Særlig ulykkesfare", "Avstand", "Utstrekning",
                    "Forvarsling av stopp", "Forløp av forkjørsveg", "Sykkeltrafikk i begge retninger"
                ]
            ),
            TrafficSign(
                title: "Stigningsgrad",
                section: "Underskilt",
                description: "",
                images: ["813_1", "813_2"],
                wrongAnswers: [
                    "Anbefalt fart", "Virkelig fri vegbredde", "Kryssende tømmertransport",
                    "Særlig ulykkesfare", "Avstand", "Utstrekning",
                    "Svingpil", "Forløp av forkjørsveg", "Sykkeltrafikk i begge retninger"
                ]
            ),
            TrafficSign(
                title: "Virkelig fri vegbredde",
                section: "Underskilt",
                description: "",
                images: ["814_0"],
                wrongAnswers: [
                    "Anbefalt fart", "Stigningsgrad", "Kryssende tømmertransport",
                    "Særlig ulykkesfare", "Avstand", "Utstrekning",
                    "Svingpil", "Tekst", "Sykkeltrafikk i begge retninger"
                ]
            ),
            TrafficSign(
                title: "Kryssende tømmertransport",
                section: "Underskilt",
                description: "",
                images: ["816_0"],
                wrongAnswers: [
                    "Anbefalt fart", "Stigningsgrad", "Virkelig fri vegbredde",
                    "Særlig ulykkesfare", "Avstand", "Utstrekning",
                    "Svingpil", "Tekst", "Oppstilling av parkert kjøretøy"
                ]
            ),
            TrafficSign(
                title: "Særlig ulykkesfare",
                section: "Underskilt",
                description: "Utformingen tilpasses den aktuelle faresituasjonen.",
                images: ["817_1", "817_2", "817_3", "817_4", "817_5"],
                wrongAnswers: [
                    "Anbefalt fart", "Stigningsgrad", "Virkelig fri vegbredde",
                    "Kryssende tømmertransport", "Avstand", "Utstrekning",
                    "Svingpil",  "Forvarsling av stopp"
                ]
            ),
            
            // II. Til vikeplikt- og forkjørsskilt
            TrafficSign(
                title: "Forløp av forkjørsveg",
                section: "Underskilt",
                description: "Underskiltet viser et skjematisk bilde av krysset, hvor tykk strek angir forkjørsveg og tynn strek angir sideveg.",
                images: ["822_1", "822_2", "822_3", "822_4", "822_5", "822_6", "822_7"],
                wrongAnswers: [
                    "Forvarsling av stopp", "Sykkeltrafikk i begge retninger", "Utstrekning",
                    "Avstand", "Tid", "Svingpil", "Tekst", "Anbefalt fart", "Kombinert regulering"
                ]
            ),
            TrafficSign(
                title: "Forvarsling av stopp",
                section: "Underskilt",
                description: "Underskiltet brukes sammen med skilt 202 «Vikeplikt» for å varsle om at skilt 204 «Stopp» er satt opp i angitt avstand.",
                images: ["824_0"],
                wrongAnswers: [
                    "Forløp av forkjørsveg", "Sykkeltrafikk i begge retninger", "Utstrekning",
                    "Avstand", "Tid", "Svingpil", "Tekst", "Anbefalt fart", "Oppstilling av parkert kjøretøy"
                ]
            ),
            TrafficSign(
                title: "Sykkeltrafikk i begge retninger",
                section: "Underskilt",
                description: "Underskiltet viser at det er trafikk med sykkel og liten elektrisk motorvogn i begge retninger.",
                images: ["826_0"],
                wrongAnswers: [
                    "Forvarsling av stopp", "Forløp av forkjørsveg", "Utstrekning",
                    "Avstand", "Tid", "Svingpil", "Tekst", "Anbefalt fart", "Stigningsgrad"
                ]
            ),
            
            // III. Til stans- og parkeringsskilt
            TrafficSign(
                title: "Utstrekning av stans- og parkeringsregulering",
                section: "Underskilt",
                description: "Underskiltet angir at reguleringen gjelder i pilens retning eller i angitt avstand.",
                images: ["828_1", "828_2", "828_3"],
                wrongAnswers: [
                    "Oppstilling av parkert kjøretøy", "Parkeringsskive/gratisbillett", "Kombinert regulering",
                    "Avstand", "Utstrekning", "Tid", "Svingpil", "Tekst", "Forvarsling av stopp"
                ]
            ),
            TrafficSign(
                title: "Oppstilling av parkert kjøretøy",
                section: "Underskilt",
                description: "",
                images: ["829_0"],
                wrongAnswers: [
                    "Utstrekning av stans- og parkeringsregulering", "Parkeringsskive/gratisbillett", "Kombinert regulering",
                    "Avstand", "Utstrekning", "Tid", "Svingpil", "Tekst", "Sykkeltrafikk i begge retninger"
                ]
            ),
            TrafficSign(
                title: "Parkeringsskive/gratisbillett",
                section: "Underskilt",
                description: "Underskiltet angir at parkering bare er tillatt med synlig parkeringsskive eller billett som viser tidspunkt.",
                images: ["831_0"],
                wrongAnswers: [
                    "Oppstilling av parkert kjøretøy", "Utstrekning av stans- og parkeringsregulering", "Kombinert regulering",
                    "Avstand", "Utstrekning", "Tid", "Svingpil", "Forvarsling av stopp"
                ]
            ),
            TrafficSign(
                title: "Kombinert regulering",
                section: "Underskilt",
                description: "Underskiltet angir parkeringsregulering ved kombinasjon av tekst, tall og symboler.",
                images: ["834_0"],
                wrongAnswers: [
                    "Oppstilling av parkert kjøretøy", "Parkeringsskive/gratisbillett", "Utstrekning av stans- og parkeringsregulering",
                    "Avstand", "Utstrekning", "Tid", "Svingpil", "Anbefalt fart"
                ]
            ),
            
            // IV. Til opplysningsskilt
            // TrafficSign(
            //     title: "Generell fartsgrense i miniatyr",
            //     description: "Underskiltet brukes sammen med skilt 556.2 «Automatisk trafikkontroll – strekningsmåling» for å vise hvilken fartsgrense som gjelder på strekningen.",
            //     images: ["856_0"]
            // )
        ]
    )
    
    static let markeringsskilt = TrafficSection(
        name: "Markeringsskilt",
        signs: [
            TrafficSign(
                title: "Bakgrunnsmarkering",
                section: "Markeringsskilt",
                description: "",
                images: ["902_0H", "902_0V"],
                wrongAnswers: [
                    "Retningsmarkering", "Hindermarkering", "Tunnelmarkering",
                    "Avkjøringsmarkering", "Avstandsmarkering i tunnel",
                    "Kantstolpe", "Trafikkjegle", "Trafikksylinder", "Fartsgrensemarkering"
                ]
            ),
            TrafficSign(
                title: "Retningsmarkering",
                section: "Markeringsskilt",
                description: "",
                images: ["904_0H", "904_0V"],
                wrongAnswers: [
                    "Bakgrunnsmarkering", "Hindermarkering (skråstriper)", "Tunnelmarkering",
                    "Avkjøringsmarkering", "Avstandsmarkering i tunnel",
                    "Kantstolpe", "Trafikkjegle",  "Vegarbeidsmarkering"
                ]
            ),
            TrafficSign(
                title: "Hindermarkering (skråstriper)",
                section: "Markeringsskilt",
                description: "Skråstripene peker ned mot den side markeringen kan passeres på.",
                images: ["906_0V", "906_0H", "906_0VH"],
                wrongAnswers: [
                    "Retningsmarkering", "Bakgrunnsmarkering",
                    "Tunnelmarkering", "Avkjøringsmarkering",
                    "Kantstolpe", "Trafikksylinder", "Avstandsmarkering i tunnel"
                ]
            ),
            TrafficSign(
                title: "Hindermarkering",
                section: "Markeringsskilt",
                description: "",
                images: ["908_0"],
                wrongAnswers: [
                    "Retningsmarkering", "Bakgrunnsmarkering",
                    "Tunnelmarkering", "Avkjøringsmarkering",
                    "Avstandsmarkering i tunnel", "Kantstolpe", "Trafikkjegle",
                ]
            ),
            TrafficSign(
                title: "Avkjøringsmarkering",
                section: "Markeringsskilt",
                description: "Skiltet markerer avkjøringsveg fra motorveg eller annen veg med høy standard.",
                images: ["912_0"],
                wrongAnswers: [
                    "Bakgrunnsmarkering", "Retningsmarkering", "Hindermarkering",
                    "Tunnelmarkering", "Avstandsmarkering i tunnel",
                    "Kantstolpe", "Trafikksylinder", "Fartsgrensemarkering"
                ]
            ),
            TrafficSign(
                title: "Tunnelmarkering",
                section: "Markeringsskilt",
                description: "",
                images: ["914_V", "914_H"],
                wrongAnswers: [
                    "Avstandsmarkering i tunnel", "Bakgrunnsmarkering", "Retningsmarkering",
                    "Hindermarkering (skråstriper)", "Avkjøringsmarkering",
                    "Kantstolpe", "Trafikkjegle", "Vegarbeidsmarkering"
                ]
            ),
            TrafficSign(
                title: "Avstandsmarkering i tunnel",
                section: "Markeringsskilt",
                description: "Skiltet markerer avstand til tunnelåpninger.",
                images: ["916_0"],
                wrongAnswers: [
                    "Bakgrunnsmarkering", "Retningsmarkering",
                    "Hindermarkering", "Avkjøringsmarkering",
                    "Kantstolpe", "Trafikkjegle", "Fartsgrensemarkering"
                ]
            ),
            TrafficSign(
                title: "Kantstolpe",
                section: "Markeringsskilt",
                description: "",
                images: ["920_VE", "920_H", "920_VM"],
                wrongAnswers: [
                    "Bakgrunnsmarkering", "Retningsmarkering", "Hindermarkering",
                    "Tunnelmarkering", "Avkjøringsmarkering",
                    "Avstandsmarkering i tunnel", "Trafikksylinder", "Vegarbeidsmarkering"
                ]
            ),
            TrafficSign(
                title: "Trafikkjegle",
                section: "Markeringsskilt",
                description: "Kjegle som enten angir at trafikantene skal holde seg innenfor det felt som de er ledet inn i eller angir andre forhold trafikantene må være oppmerksom på.",
                images: ["940_0"],
                wrongAnswers: [
                    "Bakgrunnsmarkering", "Retningsmarkering",
                    "Hindermarkering", "Tunnelmarkering", "Avkjøringsmarkering",
                    "Avstandsmarkering i tunnel", "Kantstolpe", "Vegarbeidsmarkering"
                ]
            ),
            TrafficSign(
                title: "Trafikksylinder",
                section: "Markeringsskilt",
                description: "Sylinder som enten angir at trafikantene skal holde seg innenfor det felt som de er ledet inn i eller angir andre forhold trafikantene må være oppmerksom på.",
                images: ["942_0"],
                wrongAnswers: [
                    "Bakgrunnsmarkering", "Retningsmarkering",
                    "Hindermarkering", "Tunnelmarkering", "Avkjøringsmarkering",
                    "Avstandsmarkering i tunnel", "Kantstolpe", "Vegarbeidsmarkering"
                ]
            )
        ]
    )
    
    static let vegvisningsskilt = TrafficSection(
        name: "Vegvisningsskilt",
        signs: [
            TrafficSign(
                title: "Tabellorienteringstavle",
                section: "Vegvisningsskilt",
                description: "Skiltet forvarsler vegkryss eller avkjøringsveg og viser vegnummer og/eller reisemål.",
                images: ["701"],
                wrongAnswers: [
                    "Diagramorienteringstavle", "Avkjøringstavle", "Kjørefeltorienteringstavle",
                    "Portalorienteringstavle", "Tabellvegviser", "Vanlig vegviser",
                    "Samleskilt for vegvisning", "Midlertidig omkjøring", "Vegviser for sykkelrute"
                ]
            ),
            TrafficSign(
                title: "Diagramorienteringstavle",
                section: "Vegvisningsskilt",
                description: "Skiltet forvarsler vegkryss eller avkjøringsveg og viser vegnummer og/eller reisemål.",
                images: ["703"],
                wrongAnswers: [
                    "Tabellorienteringstavle", "Avkjøringstavle", "Portalorienteringstavle",
                    "Kjørefeltorienteringstavle", "Tabellvegviser", "Vanlig vegviser",
                    "Stedsnavnskilt", "Vegviser for gangtrafikk", "Vegnummer for riksveg"
                ]
            ),
            TrafficSign(
                title: "Avkjøringstavle",
                section: "Vegvisningsskilt",
                description: "Skiltet forvarsler avkjøringsveg og viser vegnummer og/eller reisemål.",
                images: ["705"],
                wrongAnswers: [
                    "Tabellorienteringstavle", "Diagramorienteringstavle", "Kjørefeltorienteringstavle",
                    "Portalorienteringstavle", "Vanlig vegviser", "Samleskilt for vegvisning",
                    "Avstandsskilt for sykkelrute", "Vegnummer for europaveg", "Stedsnavnskilt"
                ]
            ),
            TrafficSign(
                title: "Kjørefeltorienteringstavle",
                section: "Vegvisningsskilt",
                description: "Viser antall kjørefelt fram mot kryss eller avkjøringsveg, og hvilke kjøreretninger eller reisemål de enkelte kjørefelt er beregnet for.",
                images: ["707"],
                wrongAnswers: [
                    "Portalorienteringstavle", "Tabellorienteringstavle", "Avkjøringstavle",
                    "Kjørefeltvegviser", "Portalvegviser", "Vanlig vegviser",
                    "Stedsnavnskilt", "Midlertidig omkjøring", "Omkjøring bestemte kjøretøy"
                ]
            ),
            TrafficSign(
                title: "Portalorienteringstavle",
                section: "Vegvisningsskilt",
                description: "Viser hvilke kjøreretninger eller reisemål kjørefelt er beregnet for.",
                images: ["709"],
                wrongAnswers: [
                    "Kjørefeltorienteringstavle", "Tabellorienteringstavle", "Diagramorienteringstavle",
                    "Avkjøringstavle", "Portalvegviser", "Kjørefeltvegviser",
                    "Samleskilt for vegvisning", "Vegviser for sykkelrute", "Vegnummer for fylkesveg"
                ]
            ),
            TrafficSign(
                title: "Tabellvegviser",
                section: "Vegvisningsskilt",
                description: "Viser vegnummer og/eller reisemål for de enkelte vegarmer i kryss eller for avkjøringsveg.",
                images: ["711"],
                wrongAnswers: [
                    "Vanlig vegviser", "Samleskilt for vegvisning", "Tabellorienteringstavle",
                    "Avkjøringstavle", "Stedsnavnskilt", "Gate-/vegnavnskilt",
                    "Vegviser for gangtrafikk", "Vegviser for sykkelrute", "Avstandsskilt for sykkelrute"
                ]
            ),
            TrafficSign(
                title: "Vanlig vegviser",
                section: "Vegvisningsskilt",
                description: "Viser vegnummer og/eller reisemål i kryss eller avkjøringsveg.",
                images: ["713"],
                wrongAnswers: [
                    "Tabellvegviser", "Samleskilt for vegvisning", "Tabellorienteringstavle",
                    "Avkjøringstavle", "Diagramorienteringstavle", "Kjørefeltvegviser",
                    "Vegviser for gangtrafikk", "Vegnummer for riksveg", "Stedsnavnskilt"
                ]
            ),
            //            TrafficSign(
            //                title: "Avkjøringsvegviser",
            //                description: "Viser vegnummer og/eller reisemål for avkjøringsveg.",
            //                images: ["715"],
            //                isPortrait: true
            //            ),
            TrafficSign(
                title: "Kjørefeltvegviser",
                section: "Vegvisningsskilt",
                description: "Viser hvilke reisemål kjørefelt er beregnet for.",
                images: ["717"],
                wrongAnswers: [
                    "Portalvegviser", "Kjørefeltorienteringstavle", "Portalorienteringstavle",
                    "Vanlig vegviser", "Tabellvegviser", "Stedsnavnskilt",
                    "Omkjøring bestemte kjøretøy", "Vegviser for sykkelrute", "Vegnummer for fylkesveg"
                ]
            ),
            TrafficSign(
                title: "Portalvegviser",
                section: "Vegvisningsskilt",
                description: "Viser hvilke reisemål kjørefelt er beregnet for.",
                images: ["719"],
                wrongAnswers: [
                    "Kjørefeltvegviser", "Portalorienteringstavle", "Kjørefeltorienteringstavle",
                    "Vanlig vegviser", "Tabellvegviser", "Samleskilt for vegvisning",
                    "Vegviser for gangtrafikk", "Midlertidig omkjøring", "Vegnummer for europaveg"
                ]
            ),
            TrafficSign(
                title: "Vegnummer for europaveg",
                section: "Vegvisningsskilt",
                description: "",
                images: ["723_11", "723_12"],
                wrongAnswers: [
                    "Vegnummer for riksveg", "Vegnummer for fylkesveg", "Ringveg/ringrute",
                    "Nasjonal turistveg", "Omkjøringsrute for store kjøretøy",
                    "Rute for farlig gods", "Andre omkjøringsruter", "Kryssnummer flerfeltsveg", "Stedsnavnskilt"
                ]
            ),
            TrafficSign(
                title: "Vegnummer for riksveg",
                section: "Vegvisningsskilt",
                description: "",
                images: ["723_13", "723_14"],
                wrongAnswers: [
                    "Vegnummer for europaveg", "Vegnummer for fylkesveg", "Ringveg/ringrute",
                    "Nasjonal turistveg", "Omkjøringsrute for store kjøretøy",
                    "Andre omkjøringsruter", "Kryssnummer tofeltsveg", "Gate-/vegnavnskilt", "Samleskilt for vegvisning"
                ]
            ),
            TrafficSign(
                title: "Vegnummer for fylkesveg",
                section: "Vegvisningsskilt",
                description: "",
                images: ["723_15", "723_16"],
                wrongAnswers: [
                    "Vegnummer for europaveg", "Vegnummer for riksveg", "Ringveg/ringrute",
                    "Nasjonal turistveg", "Andre omkjøringsruter",
                    "Rute for farlig gods", "Stedsnavnskilt", "Gate-/vegnavnskilt", "Omkjøring bestemte kjøretøy"
                ]
            ),
            TrafficSign(
                title: "Ringveg/ringrute",
                section: "Vegvisningsskilt",
                description: "",
                images: ["723_21", "723_22"],
                wrongAnswers: [
                    "Vegnummer for europaveg", "Vegnummer for riksveg", "Vegnummer for fylkesveg",
                    "Nasjonal turistveg", "Andre omkjøringsruter",
                    "Kryssnummer flerfeltsveg", "Samleskilt for vegvisning", "Midlertidig omkjøring", "Vegviser for sykkelrute"
                ]
            ),
            TrafficSign(
                title: "Nasjonal turistveg",
                section: "Vegvisningsskilt",
                description: "",
                images: ["723_31"],
                wrongAnswers: [
                    "Vegnummer for europaveg", "Vegnummer for fylkesveg", "Vegnummer for riksveg",
                    "Ringveg/ringrute", "Andre omkjøringsruter",
                    "Stedsnavnskilt", "Omkjøring bestemte kjøretøy", "Vegviser for gangtrafikk", "Samleskilt for vegvisning"
                ]
            ),
            TrafficSign(
                title: "Omkjøringsrute for store kjøretøy",
                section: "Vegvisningsskilt",
                description: "",
                images: ["723_41"],
                wrongAnswers: [
                    "Andre omkjøringsruter", "Rute for farlig gods", "Vegnummer for europaveg",
                    "Vegnummer for riksveg", "Ringveg/ringrute",
                    "Kryssnummer tofeltsveg", "Midlertidig omkjøring", "Stedsnavnskilt", "Samleskilt for vegvisning"
                ]
            ),
            TrafficSign(
                title: "Rute for farlig gods",
                section: "Vegvisningsskilt",
                description: "",
                images: ["723_51"],
                wrongAnswers: [
                    "Omkjøringsrute for store kjøretøy", "Andre omkjøringsruter", "Vegnummer for europaveg",
                    "Vegnummer for fylkesveg", "Ringveg/ringrute",
                    "Kryssnummer flerfeltsveg", "Midlertidig omkjøring", "Stedsnavnskilt", "Vegviser for sykkelrute"
                ]
            ),
            TrafficSign(
                title: "Andre omkjøringsruter",
                section: "Vegvisningsskilt",
                description: "",
                images: ["723_61","723_62","723_63","723_64","723_65","723_66"],
                wrongAnswers: [
                    "Omkjøringsrute for store kjøretøy", "Rute for farlig gods", "Midlertidig omkjøring",
                    "Vegnummer for europaveg", "Vegnummer for fylkesveg",
                    "Ringveg/ringrute", "Kryssnummer tofeltsveg", "Vegviser for gangtrafikk", "Stedsnavnskilt"
                ]
            ),
            TrafficSign(
                title: "Kryssnummer flerfeltsveg",
                section: "Vegvisningsskilt",
                description: "",
                images: ["723_71","723_72"],
                wrongAnswers: [
                    "Kryssnummer tofeltsveg", "Vegnummer for europaveg", "Vegnummer for riksveg",
                    "Ringveg/ringrute", "Samleskilt for vegvisning",
                    "Stedsnavnskilt", "Gate-/vegnavnskilt", "Midlertidig omkjøring", "Vegviser for sykkelrute"
                ]
            ),
            TrafficSign(
                title: "Kryssnummer tofeltsveg",
                section: "Vegvisningsskilt",
                description: "",
                images: ["723_73"],
                wrongAnswers: [
                    "Kryssnummer flerfeltsveg", "Vegnummer for europaveg", "Vegnummer for fylkesveg",
                    "Ringveg/ringrute", "Samleskilt for vegvisning",
                    "Stedsnavnskilt", "Vegviser for gangtrafikk", "Omkjøring bestemte kjøretøy", "Midlertidig omkjøring"
                ]
            ),
            //            TrafficSign(
            //                title: "Avstandsskilt",
            //                description: "",
            //                images: ["725"],
            //                isPortrait: true
            //            ),
            TrafficSign(
                title: "Stedsnavnskilt",
                section: "Vegvisningsskilt",
                description: "",
                images: ["727"],
                wrongAnswers: [
                    "Gate-/vegnavnskilt", "Samleskilt for vegvisning", "Vegnummer for europaveg",
                    "Vegnummer for riksveg", "Vegnummer for fylkesveg",
                    "Ringveg/ringrute", "Vegviser for sykkelrute", "Vegviser for gangtrafikk", "Omkjøring bestemte kjøretøy"
                ]
            ),
            TrafficSign(
                title: "Gate-/vegnavnskilt",
                section: "Vegvisningsskilt",
                description: "",
                images: ["729"],
                wrongAnswers: [
                    "Stedsnavnskilt", "Samleskilt for vegvisning", "Vegnummer for europaveg",
                    "Vegnummer for riksveg", "Vegnummer for fylkesveg",
                    "Ringveg/ringrute", "Midlertidig omkjøring", "Vegviser for gangtrafikk", "Vegviser for sykkelrute"
                ]
            ),
            TrafficSign(
                title: "Samleskilt for vegvisning",
                section: "Vegvisningsskilt",
                description: "",
                images: ["731"],
                wrongAnswers: [
                    "Tabellvegviser", "Vanlig vegviser", "Tabellorienteringstavle",
                    "Avkjøringstavle", "Portalorienteringstavle",
                    "Kjørefeltvegviser", "Vegviser for gangtrafikk", "Vegviser for sykkelrute", "Stedsnavnskilt"
                ]
            ),
            TrafficSign(
                title: "Omkjøring bestemte kjøretøy",
                section: "Vegvisningsskilt",
                description: "",
                images: ["741"],
                wrongAnswers: [
                    "Midlertidig omkjøring", "Slutt på midlertidig omkjøring", "Omkjøringsrute for store kjøretøy",
                    "Andre omkjøringsruter", "Vegnummer for fylkesveg",
                    "Vegnummer for riksveg", "Stedsnavnskilt", "Samleskilt for vegvisning", "Vegviser for gangtrafikk"
                ]
            ),
            TrafficSign(
                title: "Midlertidig omkjøring",
                section: "Vegvisningsskilt",
                description: "",
                images: ["743_1", "743_2"],
                wrongAnswers: [
                    "Slutt på midlertidig omkjøring", "Omkjøring bestemte kjøretøy", "Andre omkjøringsruter",
                    "Omkjøringsrute for store kjøretøy", "Vegnummer for europaveg",
                    "Ringveg/ringrute", "Samleskilt for vegvisning", "Stedsnavnskilt", "Vegviser for sykkelrute"
                ]
            ),
            TrafficSign(
                title: "Slutt på midlertidig omkjøring",
                section: "Vegvisningsskilt",
                description: "",
                images: ["745_0"],
                wrongAnswers: [
                    "Midlertidig omkjøring", "Omkjøring bestemte kjøretøy", "Andre omkjøringsruter",
                    "Omkjøringsrute for store kjøretøy", "Vegnummer for riksveg",
                    "Vegnummer for fylkesveg", "Stedsnavnskilt", "Samleskilt for vegvisning", "Vegviser for gangtrafikk"
                ]
            ),
            TrafficSign(
                title: "Vegviser for gangtrafikk",
                section: "Vegvisningsskilt",
                description: "",
                images: ["749"],
                wrongAnswers: [
                    "Vegviser for sykkelrute", "Tabellvegviser for sykkelrute", "Sykkelruteskilt",
                    "Avstandsskilt for sykkelrute", "Stedsnavnskilt",
                    "Gate-/vegnavnskilt", "Samleskilt for vegvisning", "Vanlig vegviser", "Vegnummer for fylkesveg"
                ]
            ),
            TrafficSign(
                title: "Vegviser for sykkelrute",
                section: "Vegvisningsskilt",
                description: "",
                images: ["751"],
                wrongAnswers: [
                    "Tabellvegviser for sykkelrute", "Sykkelruteskilt", "Avstandsskilt for sykkelrute",
                    "Vegviser for gangtrafikk", "Stedsnavnskilt",
                    "Samleskilt for vegvisning", "Midlertidig omkjøring", "Vanlig vegviser", "Kryssnummer tofeltsveg"
                ]
            ),
            TrafficSign(
                title: "Tabellvegviser for sykkelrute",
                section: "Vegvisningsskilt",
                description: "",
                images: ["753"],
                wrongAnswers: [
                    "Vegviser for sykkelrute", "Sykkelruteskilt", "Avstandsskilt for sykkelrute",
                    "Vegviser for gangtrafikk", "Stedsnavnskilt",
                    "Samleskilt for vegvisning", "Midlertidig omkjøring", "Omkjøring bestemte kjøretøy", "Gate-/vegnavnskilt"
                ]
            ),
            TrafficSign(
                title: "Sykkelruteskilt",
                section: "Vegvisningsskilt",
                description: "",
                images: ["755"],
                wrongAnswers: [
                    "Vegviser for sykkelrute", "Tabellvegviser for sykkelrute", "Avstandsskilt for sykkelrute",
                    "Vegviser for gangtrafikk", "Stedsnavnskilt",
                    "Samleskilt for vegvisning", "Midlertidig omkjøring", "Vanlig vegviser", "Vegnummer for fylkesveg"
                ]
            ),
            TrafficSign(
                title: "Avstandsskilt for sykkelrute",
                section: "Vegvisningsskilt",
                description: "",
                images: ["757"],
                wrongAnswers: [
                    "Sykkelruteskilt", "Vegviser for sykkelrute", "Tabellvegviser for sykkelrute",
                    "Vegviser for gangtrafikk", "Stedsnavnskilt",
                    "Samleskilt for vegvisning", "Midlertidig omkjøring", "Omkjøring bestemte kjøretøy", "Vanlig vegviser"
                ]
            ),
            TrafficSign(
                title: "Motorveg symbol",
                section: "Vegvisningsskilt",
                description: "",
                images: ["761_0"],
                wrongAnswers: [
                    "Motortrafikkveg symbol", "Bomveg symbol", "Parkering symbol",
                    "Parkeringshus symbol", "Lufthavn/flyplass symbol",
                    "Helikopterplass symbol", "Busstasjon symbol", "Jernbanestasjon symbol", "Bilferje symbol"
                ]
            ),
            TrafficSign(
                title: "Motortrafikkveg symbol",
                section: "Vegvisningsskilt",
                description: "",
                images: ["763_0"],
                wrongAnswers: [
                    "Motorveg symbol", "Bomveg symbol", "Parkering symbol",
                    "Parkeringshus symbol", "Lufthavn/flyplass symbol",
                    "Helikopterplass symbol", "Busstasjon symbol", "Jernbanestasjon symbol", "Godshavn symbol"
                ]
            ),
            TrafficSign(
                title: "Bomveg symbol",
                section: "Vegvisningsskilt",
                description: "",
                images: ["765_0"],
                wrongAnswers: [
                    "Motortrafikkveg symbol", "Motorveg symbol", "Parkering symbol",
                    "Parkeringshus symbol", "Lufthavn/flyplass symbol",
                    "Helikopterplass symbol", "Busstasjon symbol", "Jernbanestasjon symbol", "Bilferje symbol"
                ]
            ),
            TrafficSign(
                title: "Parkering symbol",
                section: "Vegvisningsskilt",
                description: "",
                images: ["767_0"],
                wrongAnswers: [
                    "Parkeringshus symbol", "Motortrafikkveg symbol", "Motorveg symbol",
                    "Bomveg symbol", "Lufthavn/flyplass symbol",
                    "Helikopterplass symbol", "Busstasjon symbol", "Jernbanestasjon symbol", "Godshavn symbol"
                ]
            ),
            TrafficSign(
                title: "Parkeringshus symbol",
                section: "Vegvisningsskilt",
                description: "",
                images: ["769_0"],
                wrongAnswers: [
                    "Parkering symbol", "Motortrafikkveg symbol", "Motorveg symbol",
                    "Bomveg symbol", "Lufthavn/flyplass symbol",
                    "Helikopterplass symbol", "Busstasjon symbol", "Jernbanestasjon symbol", "Bilferje symbol"
                ]
            ),
            TrafficSign(
                title: "Lufthavn/flyplass symbol",
                section: "Vegvisningsskilt",
                description: "",
                images: ["771_0"],
                wrongAnswers: [
                    "Helikopterplass symbol", "Motortrafikkveg symbol", "Motorveg symbol",
                    "Bomveg symbol", "Parkering symbol", "Parkeringshus symbol",
                    "Busstasjon symbol", "Jernbanestasjon symbol", "Godshavn symbol"
                ]
            ),
            TrafficSign(
                title: "Helikopterplass symbol",
                section: "Vegvisningsskilt",
                description: "",
                images: ["772_0"],
                wrongAnswers: [
                    "Lufthavn/flyplass symbol", "Motortrafikkveg symbol", "Motorveg symbol",
                    "Bomveg symbol", "Parkering symbol", "Parkeringshus symbol",
                    "Busstasjon symbol", "Jernbanestasjon symbol", "Bilferje symbol"
                ]
            ),
            TrafficSign(
                title: "Busstasjon symbol",
                section: "Vegvisningsskilt",
                description: "",
                images: ["773_0"],
                wrongAnswers: [
                    "Jernbanestasjon symbol", "Motortrafikkveg symbol", "Motorveg symbol",
                    "Bomveg symbol", "Parkering symbol", "Parkeringshus symbol",
                    "Lufthavn/flyplass symbol", "Helikopterplass symbol", "Godshavn symbol"
                ]
            ),
            TrafficSign(
                title: "Jernbanestasjon symbol",
                section: "Vegvisningsskilt",
                description: "",
                images: ["774_0"],
                wrongAnswers: [
                    "Busstasjon symbol", "Motortrafikkveg symbol", "Motorveg symbol",
                    "Bomveg symbol", "Parkering symbol", "Parkeringshus symbol",
                    "Lufthavn/flyplass symbol", "Helikopterplass symbol", "Bilferje symbol"
                ]
            ),
            TrafficSign(
                title: "Bilferje symbol",
                section: "Vegvisningsskilt",
                description: "",
                images: ["775_0"],
                wrongAnswers: [
                    "Godshavn symbol", "Motortrafikkveg symbol", "Motorveg symbol",
                    "Bomveg symbol", "Parkering symbol", "Parkeringshus symbol",
                    "Lufthavn/flyplass symbol", "Helikopterplass symbol", "Busstasjon symbol"
                ]
            ),
            TrafficSign(
                title: "Godshavn symbol",
                section: "Vegvisningsskilt",
                description: "",
                images: ["776"],
                wrongAnswers: [
                    "Bilferje symbol", "Motortrafikkveg symbol", "Motorveg symbol",
                    "Bomveg symbol", "Parkering symbol", "Parkeringshus symbol",
                    "Lufthavn/flyplass symbol", "Helikopterplass symbol", "Jernbanestasjon symbol"
                ]
            ),
            TrafficSign(
                title: "Kjetting symbol",
                section: "Vegvisningsskilt",
                description: "",
                images: ["780"],
                wrongAnswers: [
                    "Motorveg symbol", "Motortrafikkveg symbol", "Bomveg symbol",
                    "Parkering symbol", "Parkeringshus symbol", "Busstasjon symbol",
                    "Jernbanestasjon symbol", "Bilferje symbol", "Godshavn symbol"
                ]
            ),
            TrafficSign(
                title: "Kirke",
                section: "Vegvisningsskilt",
                description: "",
                images: ["790_10"],
                wrongAnswers: [
                    "Næringsområde", "Kjøpesenter", "Svømmehall",
                    "Alpinanlegg", "Hoppbakke", "Skistadion",
                    "Golfbane", "Betalingsmåte", "Helautomatisk bomstasjon"
                ]
            ),
            TrafficSign(
                title: "Næringsområde",
                section: "Vegvisningsskilt",
                description: "",
                images: ["790_15"],
                wrongAnswers: [
                    "Kirke", "Kjøpesenter", "Svømmehall",
                    "Alpinanlegg", "Hoppbakke", "Skistadion",
                    "Golfbane", "Betalingsmåte", "Helautomatisk bomstasjon"
                ]
            ),
            TrafficSign(
                title: "Kjøpesenter",
                section: "Vegvisningsskilt",
                description: "",
                images: ["790_16"],
                wrongAnswers: [
                    "Næringsområde", "Kirke", "Svømmehall",
                    "Alpinanlegg", "Hoppbakke", "Skistadion",
                    "Golfbane", "Betalingsmåte", "Helautomatisk bomstasjon"
                ]
            ),
            TrafficSign(
                title: "Svømmehall",
                section: "Vegvisningsskilt",
                description: "",
                images: ["790_20"],
                wrongAnswers: [
                    "Kirke", "Næringsområde", "Kjøpesenter",
                    "Alpinanlegg", "Hoppbakke", "Skistadion",
                    "Golfbane", "Betalingsmåte", "Helautomatisk bomstasjon"
                ]
            ),
            TrafficSign(
                title: "Alpinanlegg",
                section: "Vegvisningsskilt",
                description: "",
                images: ["790_30"],
                wrongAnswers: [
                    "Kirke", "Næringsområde", "Kjøpesenter",
                    "Svømmehall", "Hoppbakke", "Skistadion",
                    "Golfbane", "Betalingsmåte", "Helautomatisk bomstasjon"
                ]
            ),
            TrafficSign(
                title: "Hoppbakke",
                section: "Vegvisningsskilt",
                description: "",
                images: ["790_31"],
                wrongAnswers: [
                    "Kirke", "Næringsområde", "Kjøpesenter",
                    "Svømmehall", "Alpinanlegg", "Skistadion",
                    "Golfbane", "Betalingsmåte", "Helautomatisk bomstasjon"
                ]
            ),
            TrafficSign(
                title: "Skistadion",
                section: "Vegvisningsskilt",
                description: "",
                images: ["790_32"],
                wrongAnswers: [
                    "Kirke", "Næringsområde", "Kjøpesenter",
                    "Svømmehall", "Alpinanlegg", "Hoppbakke",
                    "Golfbane", "Betalingsmåte", "Helautomatisk bomstasjon"
                ]
            ),
            TrafficSign(
                title: "Golfbane",
                section: "Vegvisningsskilt",
                description: "",
                images: ["790_40"],
                wrongAnswers: [
                    "Kirke", "Næringsområde", "Kjøpesenter",
                    "Svømmehall", "Alpinanlegg", "Hoppbakke",
                    "Skistadion", "Betalingsmåte", "Helautomatisk bomstasjon"
                ]
            ),
            TrafficSign(
                title: "Betalingsmåte",
                section: "Vegvisningsskilt",
                description: "",
                images: ["792_11","792_12","792_13","792_14","792_15","792_16","792_17"],
                wrongAnswers: [
                    "Helautomatisk bomstasjon", "Motorveg symbol", "Bomveg symbol",
                    "Parkering symbol", "Parkeringshus symbol", "Kjetting symbol",
                    "Kirke", "Næringsområde", "Kjøpesenter"
                ]
            ),
            TrafficSign(
                title: "Helautomatisk bomstasjon",
                section: "Vegvisningsskilt",
                description: "",
                images: ["792_30"],
                wrongAnswers: [
                    "Betalingsmåte", "Motorveg symbol", "Bomveg symbol",
                    "Parkering symbol", "Parkeringshus symbol", "Kjetting symbol",
                    "Kirke", "Næringsområde", "Kjøpesenter"
                ]
            ),
            //            TrafficSign(
            //                title: "AutoPASS betaling",
            //                description: "",
            //                images: ["792_31"],
            //                isPortrait: true
            //            )
        ]
    )
    
//    static let vegvisningsskilt = TrafficSection(
//        name: "Vegvisningsskilt",
//        signs: [
//            TrafficSign(
//                title: "Tabellorienteringstavle",
//                description: "Skiltet forvarsler vegkryss eller avkjøringsveg og viser vegnummer og/eller reisemål.",
//                images: ["701"]
//            ),
//            TrafficSign(
//                title: "Diagramorienteringstavle",
//                description: "Skiltet forvarsler vegkryss eller avkjøringsveg og viser vegnummer og/eller reisemål.",
//                images: ["703"]
//            ),
//            TrafficSign(
//                title: "Avkjøringstavle",
//                description: "Skiltet forvarsler avkjøringsveg og viser vegnummer og/eller reisemål.",
//                images: ["705"]
//            ),
//            TrafficSign(
//                title: "Kjørefeltorienteringstavle",
//                description: "Viser antall kjørefelt fram mot kryss eller avkjøringsveg, og hvilke kjøreretninger eller reisemål de enkelte kjørefelt er beregnet for.",
//                images: ["707"]
//            ),
//            TrafficSign(
//                title: "Portalorienteringstavle",
//                description: "Viser hvilke kjøreretninger eller reisemål kjørefelt er beregnet for.",
//                images: ["709"]
//            ),
//            TrafficSign(
//                title: "Tabellvegviser",
//                description: "Viser vegnummer og/eller reisemål for de enkelte vegarmer i kryss eller for avkjøringsveg.",
//                images: ["711"]
//            ),
//            TrafficSign(
//                title: "Vanlig vegviser",
//                description: "Viser vegnummer og/eller reisemål i kryss eller avkjøringsveg.",
//                images: ["713"]
//            ),
//            //            TrafficSign(
//            //                title: "Avkjøringsvegviser",
//            //                description: "Viser vegnummer og/eller reisemål for avkjøringsveg.",
//            //                images: ["715"],
//            //                isPortrait: true
//            //            ),
//            TrafficSign(
//                title: "Kjørefeltvegviser",
//                description: "Viser hvilke reisemål kjørefelt er beregnet for.",
//                images: ["717"]
//            ),
//            TrafficSign(
//                title: "Portalvegviser",
//                description: "Viser hvilke reisemål kjørefelt er beregnet for.",
//                images: ["719"]
//            ),
//            // §15–16 skilt
//            TrafficSign(
//                title: "Vegnummer for europaveg",
//                description: "",
//                images: ["723_11", "723_12"]
//            ),
//            TrafficSign(
//                title: "Vegnummer for riksveg",
//                description: "",
//                images: ["723_13", "723_14"]
//            ),
//            TrafficSign(
//                title: "Vegnummer for fylkesveg",
//                description: "",
//                images: ["723_15", "723_16"]
//            ),
//            TrafficSign(
//                title: "Ringveg/ringrute",
//                description: "",
//                images: ["723_21", "723_22"]
//            ),
//            TrafficSign(
//                title: "Nasjonal turistveg",
//                description: "",
//                images: ["723_31"]
//            ),
//            TrafficSign(
//                title: "Omkjøringsrute for store kjøretøy",
//                description: "",
//                images: ["723_41"]
//            ),
//            TrafficSign(
//                title: "Rute for farlig gods",
//                description: "",
//                images: ["723_51"]
//            ),
//            TrafficSign(
//                title: "Andre omkjøringsruter",
//                description: "",
//                images: ["723_61","723_62","723_63","723_64","723_65","723_66"]
//            ),
//            TrafficSign(
//                title: "Kryssnummer flerfeltsveg",
//                description: "",
//                images: ["723_71","723_72"]
//            ),
//            TrafficSign(
//                title: "Kryssnummer tofeltsveg",
//                description: "",
//                images: ["723_73"]
//            ),
//            //            TrafficSign(
//            //                title: "Avstandsskilt",
//            //                description: "",
//            //                images: ["725"],
//            //                isPortrait: true
//            //            ),
//        ]
//    )
            

    // MARK: - All Sections
    
    static let all: [TrafficSection] = [
        fareskilt,
        vikeplikt,
        forbudsskilt,
        paabudsskilt,
        opplysningsskilt,
        serviceskilt,
        markeringsskilt,
        vegvisningsskilt
    ]
}

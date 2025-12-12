//
//  TrafficSectionsNorway.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 22/9/25.
//

import Foundation

//struct TrafficSectionsNorway {
//    
//    // MARK: - Sections
//    static let fareskilt = TrafficSection(
//        name: "Fareskilt",
//        description: """
//Fareskilt varsler om farer som kan oppstå langs veien – alt fra skarpe svinger og glatte partier til elg i veibanen. De gir føreren et forvarsel slik at man rekker å reagere i tide og kjøre tryggere.
//
//Skiltene har som regel et svart symbol på hvit bakgrunn med rød kant, og er formet som en likesidet trekant med spissen oppover. Midlertidige fareskilt i forbindelse med veiarbeid har gul bakgrunnsfarge.
//""",
//        subSections: nil,
//        signs: [
//            TrafficSign(
//                title: "Farlig sving",
//                description: "Varsler om en farlig sving i den retningen pila peker. Reduser farten og vær klar til å styre rolig gjennom svingen.",
//                images: ["100_1", "100_2"],
//                wrongAnswers: [
//                    "Bratt bakke", "Smalere veg", "Ujevn veg",
//                    "Fartshump", "Glatt kjørebane", "Vegarbeid", "Steinsprut",
//                    "Rasfare", "Sidevind", "Tunnel", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Farlige svinger",
//                description: "Varsler flere farlige svinger rett etter hverandre – den første i retningen pila viser. Tilpass farten og hold godt grep om rattet.",
//                images: ["102_1", "102_2"],
//                wrongAnswers: [
//                    "Bratt bakke", "Smalere veg", "Ujevn veg",
//                    "Fartshump", "Glatt kjørebane", "Vegarbeid", "Steinsprut",
//                    "Rasfare", "Kø", "Fly", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Bratt bakke",
//                description: "Varsler om bratt stigning eller bratt nedoverbakke. Velg lavt gir og vær klar til å bremse kontrollert.",
//                images: ["104_1", "104_2"],
//                wrongAnswers: [
//                    "Farlig sving", "Smalere veg", "Ujevn veg",
//                    "Fartshump", "Glatt kjørebane", "Vegarbeid", "Steinsprut",
//                    "Rasfare", "Tunnel", "Bevegelig bru", "Kai, strand eller ferjeleie"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Smalere veg",
//                description: "Varsler at vegen blir smalere. Hold deg i egen kjørebane og vær oppmerksom på møtende trafikk.",
//                images: ["106_1", "106_2", "106_3"],
//                wrongAnswers: [
//                    "Bratt bakke", "Farlig sving", "Ujevn veg",
//                    "Fartshump", "Vegarbeid", "Glatt kjørebane", "Møtende trafikk",
//                    "Farlig vegskulder", "Rundkjøring", "Avstand til gangfelt"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Ujevn veg",
//                description: "Varsler om ujevn vegbane. Reduser farten for å unngå tap av kontroll eller skade på kjøretøyet.",
//                images: ["108_0"],
//                wrongAnswers: [
//                    "Fartshump", "Smalere veg", "Bratt bakke", "Glatt kjørebane",
//                    "Vegarbeid", "Steinsprut", "Rasfare", "Kø",
//                    "Barn", "Syklende", "Skiløpere"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Fartshump",
//                description: "Varsler om fartshumper i vegen som skal senke farten. Kjør rolig for å unngå ubehag eller skader.",
//                images: ["109_0"],
//                wrongAnswers: [
//                    "Ujevn veg", "Smalere veg", "Bratt bakke", "Farlig sving",
//                    "Glatt kjørebane", "Vegarbeid", "Steinsprut", "Rasfare",
//                    "Sidevind", "Kø", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Vegarbeid",
//                description: "Varsler at det foregår arbeid på eller langs vegen. Kjør forsiktig og følg midlertidig skilting.",
//                images: ["110_0"],
//                wrongAnswers: [
//                    "Steinsprut", "Rasfare", "Fartshump", "Ujevn veg",
//                    "Farlig vegskulder", "Tunnel", "Planovergang med bom",
//                    "Kai, strand eller ferjeleie", "Barn", "Syklende", "Skiløpere"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Steinsprut",
//                description: "Varsler fare for løse steiner som kan kastes opp av andre kjøretøy. Øk avstanden til bilen foran.",
//                images: ["112_0"],
//                wrongAnswers: [
//                    "Rasfare", "Vegarbeid", "Fartshump", "Ujevn veg",
//                    "Glatt kjørebane", "Farlig vegskulder", "Sidevind",
//                    "Kø", "Militær aktivitet", "Trafikkulykke"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Rasfare",
//                description: "Varsler om fare for ras av stein, jord, snø eller lignende. Det kan også ligge rasmateriale på kjørebanen. Kjør varsomt og vær klar til å stoppe om nødvendig.",
//                images: ["114_1", "114_2"],
//                wrongAnswers: [
//                    "Vegarbeid", "Farlig vegskulder", "Bratt bakke",
//                    "Tunnel", "Kai, strand eller ferjeleie", "Sidevind", "Fartshump",
//                    "Kø", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Glatt kjørebane",
//                description: "Varsler om fare for glatt kjørebane på grunn av særlige forhold som is, snø, regn eller oljesøl. Reduser farten og unngå brå bevegelser med ratt eller bremser.",
//                images: ["116_0"],
//                wrongAnswers: [
//                    "Fartshump", "Rasfare", "Steinsprut",
//                    "Vegarbeid", "Smalere veg", "Farlig vegskulder",
//                    "Sidevind", "Tunnel", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Farlig vegskulder",
//                description: "Varsler om farlig eller svak vegkant. Unngå å komme for langt ut mot kanten, da underlaget kan gi etter.",
//                images: ["117_0"],
//                wrongAnswers: [
//                    "Vegarbeid", "Steinsprut", "Rasfare", "Fartshump",
//                    "Smalere veg", "Bratt bakke", "Tunnel",
//                    "Kai, strand eller ferjeleie", "Bevegelig bru"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Bevegelig bru",
//                description: "Varsler om bru som kan åpnes for båttrafikk. Vær forberedt på stans og følg lyssignal eller bom.",
//                images: ["118_0"],
//                wrongAnswers: [
//                    "Tunnel", "Kai, strand eller ferjeleie", "Farlig vegskulder",
//                    "Vegarbeid", "Rasfare", "Møtende trafikk", "Farlig vegkryss",
//                    "Avstandsskilt", "Rundkjøring", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kai, strand eller ferjeleie",
//                description: "Varsler at vegen ender i vann eller ferjeleie. Kjør forsiktig og vær oppmerksom på ferjetrafikk.",
//                images: ["120_0"],
//                wrongAnswers: [
//                    "Bevegelig bru", "Tunnel", "Vegarbeid", "Rasfare",
//                    "Smalere veg", "Farlig vegskulder", "Bratt bakke",
//                    "Fly", "Militær aktivitet", "Syklende"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Tunnel",
//                description: "Varsler at vegen går inn i tunnel. Husk å slå på lys og fjern solbriller før innkjøring.",
//                images: ["122_0"],
//                wrongAnswers: [
//                    "Bevegelig bru", "Kai, strand eller ferjeleie", "Vegarbeid",
//                    "Rasfare", "Farlig vegskulder", "Farlig vegkryss",
//                    "Avstandsskilt", "Rundkjøring", "Trafikklyssignal"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Farlig vegkryss",
//                description: "Varsler om farlig vegkryss hvor det gjelder vanlig vikeplikt overfor kjørende fra høyre. Reduser farten og vær klar til å stanse.",
//                images: ["124_0"],
//                wrongAnswers: [
//                    "Rundkjøring", "Trafikklyssignal", "Planovergang med bom",
//                    "Planovergang uten bom", "Avstandsskilt", "Jernbanespor",
//                    "Sporvogn", "Barn", "Syklende", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Rundkjøring",
//                description: "Varsler om rundkjøring. Kjør inn i rundkjøringen når det er klart, og følg skiltingen for riktig utkjøring.",
//                images: ["126_0"],
//                wrongAnswers: [
//                    "Farlig vegkryss", "Trafikklyssignal", "Planovergang med bom",
//                    "Planovergang uten bom", "Jernbanespor", "Sporvogn",
//                    "Avstandsskilt", "Barn", "Syklende", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Trafikklyssignal",
//                description: "Varsler at trafikken blir regulert med trafikklyssignal lenger framme. Vær oppmerksom på at signalene kan være vanskelig å se i tide.",
//                images: ["132_0"],
//                wrongAnswers: [
//                    "Rundkjøring", "Farlig vegkryss", "Planovergang med bom",
//                    "Planovergang uten bom", "Jernbanespor", "Sporvogn",
//                    "Avstandsskilt", "Barn", "Syklende", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Planovergang med bom",
//                description: "Varsler om planovergang med bom foran jernbane eller forstadsbane. Stans når bommen er nede eller signal viser stopp.",
//                images: ["134_0"],
//                wrongAnswers: [
//                    "Avstandsskilt",
//                    "Sporvogn", "Farlig vegkryss", "Rundkjøring", "Trafikklyssignal",
//                    "Barn", "Syklende", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Planovergang uten bom",
//                description: "Varsler om planovergang uten bom foran jernbane eller forstadsbane. Se og lytt etter tog før du krysser.",
//                images: ["135_0"],
//                wrongAnswers: [
//                    "Avstandsskilt",
//                    "Farlig vegkryss", "Rundkjøring", "Trafikklyssignal",
//                    "Barn", "Syklende", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Avstandsskilt",
//                description: "Gir forvarsel om planovergang varslet med skilt 134 eller 135. Skiltet viser avstanden i meter til selve planovergangen.",
//                images: ["136_1", "136_2", "136_3"],
//                wrongAnswers: [
//                    "Planovergang med bom", "Planovergang uten bom", "Jernbanespor",
//                    "Sporvogn", "Avstand til gangfelt", "Barn", "Syklende",
//                    "Farlig vegkryss", "Rundkjøring", "Annen fare"
//                ],
//
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Jernbanespor",
//                description: "Angir stedet hvor jernbane eller forstadsbane krysser vegen i plan. Stans hvis tog nærmer seg.",
//                images: ["138_1", "138_2"],
//                wrongAnswers: [
//                    "Avstandsskilt",
//                    "Farlig vegkryss", "Rundkjøring", "Trafikklyssignal",
//                    "Barn", "Syklende", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Sporvogn",
//                description: "Varsler sted hvor sporvogn krysser eller kjører ut på vegen. Vær forberedt på at sporvogn har stor vekt og lengre bremselengde.",
//                images: ["139_0"],
//                wrongAnswers: [
//                    "Avstandsskilt", "Farlig vegkryss", "Rundkjøring",
//                    "Trafikklyssignal", "Barn", "Syklende", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Avstand til gangfelt",
//                description: "Varsler om sted hvor gangfelt finnes lenger framme. Vær oppmerksom på fotgjengere som kan krysse vegen.",
//                images: ["140_0"],
//                wrongAnswers: [
//                    "Barn", "Syklende", "Skiløpere", "Ridende", "Farlig vegkryss",
//                    "Rundkjøring", "Trafikklyssignal", "Avstandsskilt",
//                    "Planovergang med bom", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Barn",
//                description: "Varsler sted på eller langs veg hvor barn ofte ferdes eller oppholder seg, for eksempel ved skole, barnehage eller lekeplass.",
//                images: ["142_0"],
//                wrongAnswers: [
//                    "Syklende", "Skiløpere", "Ridende", "Avstand til gangfelt",
//                    "Kø", "Farlig vegkryss", "Rundkjøring", "Trafikklyssignal",
//                    "Annen fare", "Militær aktivitet"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Syklende",
//                description: "Varsler sted hvor syklende ofte krysser eller kjører ut på vegen, eller om syklende i tunnel.",
//                images: ["144_0"],
//                wrongAnswers: [
//                    "Barn", "Skiløpere", "Ridende", "Avstand til gangfelt",
//                    "Kø", "Farlig vegkryss", "Rundkjøring", "Trafikklyssignal",
//                    "Annen fare", "Dyr"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Dyr",
//                description: "Varsler at dyr ofte ferdes over eller langs vegen. Kjør forsiktig, særlig i skumring og mørke.",
//                images: ["146_1", "146_2", "146_3", "146_4", "146_5"],
//                wrongAnswers: [
//                    "Ridende", "Skiløpere", "Syklende", "Barn", "Kø",
//                    "Farlig vegkryss", "Rundkjøring", "Trafikklyssignal", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Møtende trafikk",
//                description: "Varsler at kjørebanen har kjørende trafikk i begge retninger. Hold til høyre og vær oppmerksom på møtende kjøretøy.",
//                images: ["148_0"],
//                wrongAnswers: [
//                    "Kø", "Farlig vegkryss", "Rundkjøring", "Trafikklyssignal",
//                    "Sidevind", "Militær aktivitet", "Trafikkulykke", "Annen fare"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kø",
//                description: "Varsler fare for plutselig oppstått eller hyppig forekommende kø. Reduser farten og hold god avstand.",
//                images: ["149_0"],
//                wrongAnswers: [
//                    "Møtende trafikk", "Sidevind", "Fly", "Militær aktivitet",
//                    "Trafikkulykke", "Annen fare", "Barn", "Syklende", "Skiløpere"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Fly",
//                description: "Varsler at fly kan fly lavt over eller nær vegen. Vær forberedt på støy og eventuelle visuelle forstyrrelser.",
//                images: ["150_0"],
//                wrongAnswers: [
//                    "Militær aktivitet", "Kø", "Møtende trafikk", "Sidevind",
//                    "Trafikkulykke", "Annen fare", "Syklende", "Barn"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Militær aktivitet",
//                description: "Varsler om område hvor det forekommer militær aktivitet. Vær oppmerksom på kjøretøy eller personell i vegbanen.",
//                images: ["151_0"],
//                wrongAnswers: [
//                    "Fly", "Kø", "Møtende trafikk", "Sidevind", "Trafikkulykke",
//                    "Annen fare", "Ridende", "Skiløpere", "Barn"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Sidevind",
//                description: "Varsler sted hvor det ofte forekommer sterk sidevind. Hold godt grep om rattet, særlig ved åpne områder eller broer.",
//                images: ["152_0"],
//                wrongAnswers: [
//                    "Militær aktivitet", "Fly", "Kø", "Møtende trafikk",
//                    "Trafikkulykke", "Annen fare", "Dyr", "Ridende"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Trafikkulykke",
//                description: "Varsler sted hvor det tidligere har vært mange trafikkulykker, eller hvor risikoen for ulykke er særlig stor.",
//                images: ["153_0"],
//                wrongAnswers: [
//                    "Kø", "Militær aktivitet", "Sidevind", "Møtende trafikk",
//                    "Fly", "Annen fare", "Barn", "Syklende"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Skiløpere",
//                description: "Varsler sted hvor skiløpere ofte krysser vegen. Reduser farten og vis hensyn.",
//                images: ["154_0"],
//                wrongAnswers: [
//                    "Ridende", "Barn", "Syklende", "Dyr", "Kø",
//                    "Annen fare", "Møtende trafikk", "Trafikkulykke"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Ridende",
//                description: "Varsler sted hvor ridende ofte krysser eller rir ut i vegen. Kjør rolig og unngå å skremme hester.",
//                images: ["155_0"],
//                wrongAnswers: [
//                    "Skiløpere", "Barn", "Syklende", "Dyr", "Annen fare",
//                    "Møtende trafikk", "Trafikkulykke", "Sidevind"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Annen fare",
//                description: "Varsler om annen fare enn de som dekkes av de øvrige fareskiltene. Farens art er angitt på underskilt.",
//                images: ["156_0"],
//                wrongAnswers: [
//                    "Rasfare", "Vegarbeid", "Sidevind", "Møtende trafikk",
//                    "Barn", "Dyr", "Kø", "Trafikkulykke"
//                ],
//                sectionName: "Fareskilt",
//                subSectionName: nil
//            ),
//        ]
//    )
//    
//    static let vikeplikt = TrafficSection(
//        name: "Vikeplikt og Forkjørsskilt",
//        description: """
//Vikeplikt- og forkjørsskilt regulerer hvem som skal vike for hvem i trafikken. De brukes for å skape tydelige og trygge situasjoner i kryss, innsnevringer og andre steder der trafikkstrømmer møtes. Skiltene hjelper førere med å forstå hvem som har forkjørsrett, slik at trafikken flyter jevnt og uten misforståelser.
//
//Vikepliktsreglene er fastsatt i trafikkreglene, mens skiltene viser hvor de gjelder. Skiltene plasseres i god tid før krysset eller strekningen de gjelder for, slik at føreren kan tilpasse farten og være forberedt. Sammen bidrar de til trygg og forutsigbar trafikk for alle.
//""",
//        subSections: nil,
//        signs: [
//            TrafficSign(
//                title: "Vikeplikt",
//                description: "Skiltet angir at kjørende har vikeplikt og skal stanse helt.",
//                images: ["202"],
//                wrongAnswers: [
//                    "Forkjørsveg", "Slutt på forkjørsveg",
//                    "Vikeplikt for møtende", "Møtende trafikk har vikeplikt",
//                    "Farlig vegkryss", "Rundkjøring", "Trafikklyssignal",
//                    "Planovergang med bom", "Forkjørskryss", "Tunnel"
//                ],
//                sectionName: "Vikeplikt og Forkjørsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Stopp",
//                description: "Skiltet angir at kjørende har vikeplikt for trafikk i kryss.",
//                images: ["204"],
//                wrongAnswers: [
//                    "Forkjørsveg", "Slutt på forkjørsveg",
//                    "Vikeplikt for møtende", "Møtende trafikk har vikeplikt",
//                    "Barn", "Rundkjøring", "Smalere veg", "Forkjørskryss", "Glatt kjørebane"
//                ],
//                sectionName: "Vikeplikt og Forkjørsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Forkjørsveg",
//                description: "Skiltet angir at kjørende på vegen har forkjørsrett i kryss.",
//                images: ["206"],
//                wrongAnswers: [
//                    "Stopp", "Vikeplikt", "Slutt på forkjørsveg",
//                    "Vikeplikt for møtende", "Møtende trafikk har vikeplikt",
//                    "Avstandsskilt", "Jernbanespor", "Forkjørskryss", "Kai, strand eller ferjeleie"
//                ],
//                sectionName: "Vikeplikt og Forkjørsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Slutt på forkjørsveg",
//                description: "Skiltet angir at forkjørsretten i kryss opphører.",
//                images: ["208"],
//                wrongAnswers: [
//                    "Slutt på motorveg",
//                    "Slutt på motortrafikkveg",
//                    "Slutt på tungtrafikkfelt",
//                    "Slutt på kollektivfelt",
//                    "Slutt på sambruksfelt",
//                    "Slutt på gatetun",
//                    "Slutt på gågate",
//                    "Slutt på fartsgrensesone",
//                    "Slutt på forbikjøringsforbud",
//                    "Slutt på parkeringssone"
//                ],
//                sectionName: "Vikeplikt og Forkjørsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Forkjørskryss",
//                description: "Skiltet varsler om kryss hvor trafikk på vegen har forkjørsrett.",
//                images: ["210"],
//                wrongAnswers: [
//                    "Vikeplikt", "Stopp", "Forkjørsveg",
//                    "Vikeplikt for møtende",
//                    "Møtende trafikk har vikeplikt", "Farlig vegkryss",
//                    "Rundkjøring", "Avstand til gangfelt"
//                ],
//                sectionName: "Vikeplikt og Forkjørsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Vikeplikt for møtende",
//                description: "Skiltet angir at kjørende har vikeplikt for møtende trafikk.",
//                images: ["212"],
//                wrongAnswers: [
//                    "Møtende trafikk har vikeplikt", "Stopp",
//                    "Forkjørsveg", "Slutt på forkjørsveg",
//                    "Smalere veg", "Ujevn veg", "Farlig sving"
//                ],
//                sectionName: "Vikeplikt og Forkjørsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Møtende trafikk har vikeplikt",
//                description: "Skiltet angir at møtende trafikk har vikeplikt.",
//                images: ["214"],
//                wrongAnswers: [
//                    "Vikeplikt for møtende", "Stopp",
//                    "Forkjørsveg", "Slutt på forkjørsveg",
//                    "Møtende trafikk", "Rundkjøring", "Avstand til gangfelt"
//                ],
//                sectionName: "Vikeplikt og Forkjørsskilt",
//                subSectionName: nil
//            )
//        ]
//    )
//    
//    static let forbudsskilt = TrafficSection(
//        name: "Forbudsskilt",
//        description: """
//Forbudsskilt er trafikkskilt som angir et forbud på en bestemt veistrekning eller et sted. De skal bidra til trygg og forutsigbar trafikk ved å regulere adferd som kan skape farlige situasjoner.
//
//Skiltene er som oftest sirkelformede med hvit bunn, rød kant og svart symbol eller tekst. Noen skilt kan ha et rektangulært underskilt som forklarer forbudet nærmere eller angir hvor og når det gjelder.
//""",
//        subSections: nil,
//        signs: [
//            TrafficSign(
//                title: "Innkjøring forbudt",
//                description: "Skiltet angir forbud mot å kjøre forbi skiltet. Sykling og bruk av liten elektrisk motorvogn på fortau kan likevel foregå i samsvar med trafikkreglene.",
//                images: ["302_0"],
//                wrongAnswers: [
//                    "Forbudt for motorvogn", "Forbudt for lastebil og trekkbil",
//                    "Forbudt for traktor og motorredskap", "Forbudt for motorsykkel og moped",
//                    "Forbudt for gående", "Forbudt for ridende", "Forbudt for transport av farlig gods",
//                    "Stans forbudt", "Parkering forbudt"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Forbudt for alle kjøretøy",
//                description: "Forbudet gjelder all motorisert trafikk, samt sykling og bruk av liten elektrisk motorvogn. Bare gående kan ferdes videre.",
//                images: ["306_0"],
//                wrongAnswers: [
//                    "Forbudt for motorvogn", "Forbudt for traktor og motorredskap",
//                    "Forbudt for lastebil og trekkbil", "Forbudt for motorsykkel og moped",
//                    "Forbudt for gående", "Forbudt for ridende", "Forbudt for transport av farlig gods",
//                    "Vektgrense motorvogn", "Breddegrense"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Forbudt for motorvogn\n(unntatt liten elektrisk motorvogn)",
//                description: "Forbudet gjelder alle motorvogner bortsett fra liten elektrisk motorvogn, som kan benyttes der det er tillatt etter trafikkreglene.",
//                images: ["306_1"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for lastebil og trekkbil",
//                    "Forbudt for traktor",
//                    "Forbudt for gående", "Forbudt for ridende", "Forbudt for transport av farlig gods",
//                    "Vektgrense motorvogn", "Lengdegrense"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Forbudt for traktor og motorredskap\n(< 40 km/t)",
//                description: "Forbudet gjelder traktor og motorredskap som har konstruktiv hastighet under 40 km/t.",
//                images: ["306_3"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for lastebil og trekkbil",
//                    "Forbudt for motorsykkel og moped", "Forbudt for motorvogn",
//                    "Forbudt for gående", "Forbudt for ridende", "Forbudt for transport av farlig gods",
//                    "Totalvektgrense (vogntog)", "Aksellastgrense"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Forbudt for motorsykkel og moped",
//                description: "Forbudet gjelder motorsykler og mopeder. Andre motorvogner kan benytte vegen dersom ikke annet er angitt.",
//                images: ["306_4"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for lastebil og trekkbil",
//                    "Forbudt for traktor og motorredskap", "Forbudt for motorvogn",
//                    "Forbudt for gående", "Forbudt for ridende", "Forbudt for transport av farlig gods",
//                    "Stans forbudt", "Svingeforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Forbudt for lastebil og trekkbil",
//                description: "Forbudet gjelder lastebil og trekkbil, men ikke varebil eller personbil med tilhenger.",
//                images: ["306_5"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
//                    "Forbudt for traktor og motorredskap", "Forbudt for motorsykkel og moped",
//                    "Forbudt for gående", "Forbudt for ridende", "Forbudt for transport av farlig gods",
//                    "Vektgrense motorvogn", "Totalvektgrense (vogntog)"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Forbudt for syklende og liten elektrisk motorvogn",
//                description: "Forbudet gjelder syklister og førere av liten elektrisk motorvogn, for eksempel elsparkesykkel.",
//                images: ["306_6"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
//                    "Forbudt for motorsykkel og moped", "Forbudt for gående",
//                    "Forbudt for ridende", "Forbudt for transport av farlig gods",
//                    "Parkeringssone", "Stopp for toll"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Forbudt for gående",
//                description: "Forbudet gjelder gående. Kjørende trafikk kan passere dersom annet ikke er angitt.",
//                images: ["306_7"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
//                    "Forbudt for traktor og motorredskap", "Forbudt for motorsykkel og moped",
//                    "Forbudt for ridende", "Forbudt for transport av farlig gods",
//                    "Stans forbudt", "Parkering forbudt", "Vendingsforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Forbudt for gående, syklende og liten elektrisk motorvogn",
//                description: "Forbudet gjelder både gående, syklister og førere av liten elektrisk motorvogn.",
//                images: ["306_8"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
//                    "Forbudt for traktor og motorredskap", "Forbudt for motorsykkel og moped",
//                    "Forbudt for ridende", "Forbudt for transport av farlig gods",
//                    "Sone med parkeringsforbud for liten elektrisk motorvogn", "Vendingsforbud", "Forbikjøringsforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Forbudt for ridende",
//                description: "Forbudet gjelder ryttere og personer som fører hest eller annet ridedyr.",
//                images: ["306_9"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
//                    "Forbudt for traktor og motorredskap", "Forbudt for motorsykkel og moped",
//                    "Forbudt for gående", "Forbudt for transport av farlig gods",
//                    "Stans forbudt", "Parkering forbudt", "Svingeforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Forbudt for liten elektrisk motorvogn",
//                description: "Forbudet gjelder ferdsel på veg og fortau med liten elektrisk motorvogn.",
//                images: ["306_10"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
//                    "Forbudt for traktor og motorredskap", "Forbudt for motorsykkel og moped",
//                    "Forbudt for gående", "Forbudt for ridende", "Forbudt for transport av farlig gods",
//                    "Fartsgrensesone for liten elektrisk motorvogn", "Sone med bruksforbud for liten elektrisk motorvogn"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Forbudt for transport av farlig gods",
//                description: "Forbudet gjelder kjøretøy som transporterer farlig gods hvor merking med oransje skilter kreves. For vegtunneler gjelder spesifikke ADR-regler.",
//                images: ["308_0"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
//                    "Forbudt for traktor og motorredskap", "Forbudt for lastebil og trekkbil",
//                    "Vektgrense motorvogn", "Aksellastgrense", "Stans forbudt",
//                    "Parkering forbudt", "Stopp for toll"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Vektgrense motorvogn",
//                description: "Forbudet gjelder motorvogn med høyere vekt enn angitt. Vekten beregnes som kjøretøyets aktuelle totalvekt under kjøring, inkludert last og passasjerer.",
//                images: ["310_0"],
//                wrongAnswers: [
//                    "Breddegrense", "Høydegrense", "Lengdegrense",
//                    "Totalvektgrense (vogntog)", "Totalvektgrense (kjøretøy)",
//                    "Aksellastgrense", "Boggilastgrense", "Forbudt for lastebil og trekkbil",
//                    "Forbudt for traktor og motorredskap", "Forbudt for motorsykkel og moped"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Breddegrense",
//                description: "Forbudet gjelder kjøretøy, medregnet gods, med større bredde enn angitt.",
//                images: ["312_0"],
//                wrongAnswers: [
//                    "Vektgrense motorvogn", "Høydegrense", "Lengdegrense",
//                    "Totalvektgrense (vogntog)", "Totalvektgrense (kjøretøy)",
//                    "Aksellastgrense", "Boggilastgrense", "Parkering forbudt",
//                    "Stans forbudt", "Innkjøring forbudt"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Høydegrense",
//                description: "Forbudet gjelder kjøretøy, medregnet gods, med større høyde enn angitt.",
//                images: ["314_0"],
//                wrongAnswers: [
//                    "Vektgrense motorvogn", "Breddegrense", "Lengdegrense",
//                    "Totalvektgrense (vogntog)", "Totalvektgrense (kjøretøy)",
//                    "Aksellastgrense", "Boggilastgrense", "Stopp for toll", "Svingeforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Lengdegrense",
//                description: "Forbudet gjelder kjøretøy eller vogntog, medregnet gods, med større lengde enn angitt.",
//                images: ["316_0"],
//                wrongAnswers: [
//                    "Vektgrense motorvogn", "Breddegrense", "Høydegrense",
//                    "Totalvektgrense (vogntog)", "Totalvektgrense (kjøretøy)",
//                    "Aksellastgrense", "Boggilastgrense", "Forbudt for lastebil og trekkbil", "Vendingsforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Totalvektgrense (kjøretøy)",
//                description: "Forbudet gjelder kjøretøy hvor aktuell totalvekt er høyere enn angitt.",
//                images: ["318_1"],
//                wrongAnswers: [
//                    "Totalvektgrense (vogntog)", "Vektgrense motorvogn", "Breddegrense",
//                    "Høydegrense", "Lengdegrense", "Aksellastgrense", "Boggilastgrense",
//                    "Forbudt for lastebil og trekkbil", "Forbudt for traktor og motorredskap"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Totalvektgrense (vogntog)",
//                description: "Forbudet gjelder vogntog hvor samlet aktuell totalvekt er høyere enn angitt.",
//                images: ["318_2"],
//                wrongAnswers: [
//                    "Totalvektgrense (kjøretøy)", "Vektgrense motorvogn", "Breddegrense",
//                    "Høydegrense", "Lengdegrense", "Aksellastgrense", "Boggilastgrense",
//                    "Forbudt for lastebil og trekkbil", "Forbudt for traktor og motorredskap"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Aksellastgrense",
//                description: "Forbudet gjelder kjøretøy med aktuell aksellast høyere enn angitt.",
//                images: ["320_0"],
//                wrongAnswers: [
//                    "Boggilastgrense", "Vektgrense motorvogn", "Breddegrense",
//                    "Høydegrense", "Lengdegrense", "Totalvektgrense (kjøretøy)", "Totalvektgrense (vogntog)",
//                    "Forbudt for lastebil og trekkbil", "Forbudt for traktor og motorredskap"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Boggilastgrense",
//                description: "Forbudet gjelder kjøretøy med aktuell boggilast høyere enn angitt.",
//                images: ["322_0"],
//                wrongAnswers: [
//                    "Aksellastgrense", "Vektgrense motorvogn", "Breddegrense",
//                    "Høydegrense", "Lengdegrense", "Totalvektgrense (kjøretøy)", "Totalvektgrense (vogntog)",
//                    "Forbudt for lastebil og trekkbil", "Forbudt for traktor og motorredskap"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Stopp for angitt formål",
//                description: "Skiltet angir forbud mot å kjøre videre før det er foretatt stans for det formål som er angitt på skiltet.",
//                images: ["324_1", "324_2"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for transport av farlig gods",
//                    "Stans forbudt", "Parkering forbudt", "Vendingsforbud", "Svingeforbud",
//                    "Forbikjøringsforbud", "Forbudt for alle kjøretøy"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Stopp for toll",
//                description: "Skiltet angir plikt til å stanse for tollklarering.",
//                images: ["326_0"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for transport av farlig gods",
//                    "Stans forbudt", "Parkering forbudt", "Vendingsforbud", "Svingeforbud",
//                    "Forbikjøringsforbud", "Forbudt for alle kjøretøy"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Svingeforbud",
//                description: "Forbudet gjelder bare for det vegkryss skiltet er satt opp ved, eller første vegkryss etter skiltet.",
//                images: ["330_1", "330_2"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for alle kjøretøy",
//                    "Forbudt for motorvogn", "Forbudt for gående", "Stans forbudt",
//                    "Parkering forbudt", "Forbikjøringsforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Vendingsforbud",
//                description: "Forbudet gjelder til og med første vegkryss.",
//                images: ["332_0"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for alle kjøretøy",
//                    "Forbudt for motorvogn", "Forbudt for gående", "Stans forbudt",
//                    "Parkering forbudt", "Forbikjøringsforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Forbikjøringsforbud",
//                description: "Forbudet gjelder forbikjøring av motorvogn med flere enn to hjul. Gjelder ikke forbikjøring til høyre der dette er lovlig.",
//                images: ["334_0"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
//                    "Forbudt for lastebil og trekkbil", "Forbudt for motorsykkel og moped",
//                    "Stans forbudt", "Parkering forbudt", "Vendingsforbud",
//                    "Forbudt for transport av farlig gods"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Forbikjøringsforbud for lastebil",
//                description: "Forbudet gjelder lastebil med totalvekt over 3.500 kg.",
//                images: ["335_0"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Forbudt for alle kjøretøy", "Forbudt for motorvogn",
//                    "Forbudt for traktor og motorredskap", "Vektgrense motorvogn",
//                    "Totalvektgrense (vogntog)", "Lengdegrense", "Svingeforbud", "Vendingsforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Slutt på forbikjøringsforbud",
//                description: "Markerer at forbudet mot forbikjøring av motorvogn med flere enn to hjul opphører. Etter dette skiltet er forbikjøring igjen tillatt der det er lovlig etter trafikkreglene.",
//                images: ["336_0"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Parkering forbudt", "Stans forbudt",
//                    "Vendingsforbud", "Forbudt for gående", "Forbudt for ridende",
//                    "Forbudt for liten elektrisk motorvogn", "Forbudt for traktor og motorredskap"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Slutt på forbikjøringsforbud for lastebil",
//                description: "Markerer at forbudet mot forbikjøring for lastebiler med totalvekt over 3.500 kg opphører. Etter dette skiltet gjelder vanlige regler for forbikjøring.",
//                images: ["337_0"],
//                wrongAnswers: [
//                    "Innkjøring forbudt", "Parkering forbudt", "Stans forbudt",
//                    "Vendingsforbud", "Forbudt for gående", "Forbudt for ridende",
//                    "Forbudt for liten elektrisk motorvogn", "Forbudt for traktor og motorredskap"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Fartsgrense",
//                description: "Forbud mot kjøring med høyere fart enn angitt.",
//                images: ["362_3", "362_4", "362_5", "362_6", "362_7", "362_8", "362_9", "362_100"],
//                wrongAnswers: [
//                    "Slutt på særskilt fartsgrense", "Fartsgrensesone",
//                    "Motorveg", "Motortrafikkveg", "Forkjørsveg",
//                    "Parkering forbudt", "Stans forbudt", "Innkjøring forbudt", "Vendingsforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Slutt på særskilt fartsgrense",
//                description: "Markerer at en særskilt fartsgrense opphører, og at den generelle fartsgrensen igjen gjelder.",
//                images: ["364_3", "364_4", "364_5", "364_6", "364_7", "364_8"],
//                wrongAnswers: [
//                    "Fartsgrense", "Fartsgrensesone",
//                    "Motorveg", "Motortrafikkveg",
//                    "Parkering forbudt", "Stans forbudt", "Innkjøring forbudt", "Vendingsforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Fartsgrensesone",
//                description: "Forbud mot å kjøre med høyere fart enn angitt innenfor sonen.",
//                images: ["366_0"],
//                wrongAnswers: [
//                    "Slutt på fartsgrensesone",
//                    "Forkjørsveg", "Motorveg",
//                    "Parkering forbudt", "Stans forbudt", "Svingeforbud", "Forbikjøringsforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Fartsgrensesone for liten elektrisk motorvogn",
//                description: "Skiltet angir grense for område hvor det gjelder forbud mot kjøring på veg og fortau med større fart enn 6 km/t med liten elektrisk motorvogn.",
//                images: ["367_0"],
//                wrongAnswers: [
//                    "Slutt på fartsgrensesone", "Forkjørsveg", "Motorveg",
//                    "Parkering forbudt", "Stans forbudt", "Svingeforbud", "Forbikjøringsforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Slutt på fartsgrensesone",
//                description: "Markerer at fartsgrensen som gjelder innenfor en fartsgrensesone opphører. Etter dette skiltet gjelder den generelle fartsgrensen eller ny hastighet angitt ved annet skilt.",
//                images: ["368_0"],
//                wrongAnswers: [
//                    "Fartsgrensesone", "Fartsgrense", "Motortrafikkveg", "Forkjørsveg",
//                    "Parkering forbudt", "Stans forbudt", "Vendingsforbud", "Svingeforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Slutt på fartsgrensesone for liten elektrisk motorvogn",
//                description: "Markerer at forbudet mot høyere fart enn 6 km/t for liten elektrisk motorvogn ikke lenger gjelder.",
//                images: ["369_0"],
//                wrongAnswers: [
//                    "Fartsgrensesone", "Fartsgrense", "Motortrafikkveg", "Forkjørsveg",
//                    "Parkering forbudt", "Stans forbudt", "Vendingsforbud", "Svingeforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Stans forbudt",
//                description: "Skiltet angir forbud mot å stanse kjøretøy på den side av vegen hvor skiltet er satt opp.",
//                images: ["370_0"],
//                wrongAnswers: [
//                    "Parkering forbudt", "Slutt på parkeringssone", "Slutt på fartsgrensesone",
//                    "Slutt på særskilt fartsgrense", "Motorveg", "Motortrafikkveg",
//                    "Innkjøring forbudt", "Forkjørsveg", "Vikeplikt"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Parkering forbudt",
//                description: "Skiltet angir forbud mot parkering på den side av vegen hvor skiltet er satt opp.",
//                images: ["372_0"],
//                wrongAnswers: [
//                    "Stans forbudt", "Slutt på parkeringssone", "Fartsgrense",
//                    "Innkjøring forbudt", "Forbudt for motorvogn",
//                    "Forbudt for transport av farlig gods", "Vendingsforbud",
//                    "Forbikjøringsforbud", "Svingeforbud", "Vikeplikt"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Parkeringssone",
//                description: "Skiltet angir grense for område hvor det gjelder særlige bestemmelser om parkering eller stans av kjøretøy. De særlige bestemmelser som gjelder, framgår av symboler og tekst på skiltet.",
//                images: ["376_1", "376_2", "376_2a"],
//                wrongAnswers: [
//                    "Slutt på parkeringssone", "Parkering forbudt", "Stans forbudt",
//                    "Fartsgrensesone", "Slutt på fartsgrensesone",
//                    "Innkjøring forbudt", "Forbudt for motorvogn",
//                    "Svingeforbud", "Vendingsforbud", "Forbikjøringsforbud"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Sone med parkeringsforbud for liten elektrisk motorvogn",
//                description: "Skiltet angir grense for område hvor det er forbudt å parkere liten elektrisk motorvogn. Innenfor området kan det være fastsatt avvikende bestemmelser om parkering eller stans. For disse stedene gjelder ikke soneskiltets bestemmelser.",
//                images: ["377_0"],
//                wrongAnswers: [
//                    "Slutt på sone med parkeringsforbud for liten elektrisk motorvogn",
//                    "Sone med bruksforbud for liten elektrisk motorvogn",
//                    "Slutt på sone med bruksforbud for liten elektrisk motorvogn",
//                    "Parkeringssone", "Slutt på parkeringssone",
//                    "Parkering forbudt", "Stans forbudt", "Forbudt for motorvogn"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Slutt på parkeringssone",
//                description: "Skiltet markerer at bestemmelser angitt ved skilt 376 «Parkeringssone» opphører.",
//                images: ["378_1", "378_2"],
//                wrongAnswers: [
//                    "Parkeringssone", "Sone med parkeringsforbud for liten elektrisk motorvogn",
//                    "Slutt på sone med parkeringsforbud for liten elektrisk motorvogn",
//                    "Sone med bruksforbud for liten elektrisk motorvogn",
//                    "Parkering forbudt", "Stans forbudt",
//                    "Fartsgrensesone", "Slutt på fartsgrensesone"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Slutt på sone med parkeringsforbud for liten elektrisk motorvogn",
//                description: "Skiltet markerer at bestemmelser angitt ved skilt 377 «Sone med parkeringsforbud for liten elektrisk motorvogn» opphører.",
//                images: ["379_0"],
//                wrongAnswers: [
//                    "Sone med parkeringsforbud for liten elektrisk motorvogn",
//                    "Parkeringssone", "Slutt på parkeringssone",
//                    "Sone med bruksforbud for liten elektrisk motorvogn",
//                    "Slutt på sone med bruksforbud for liten elektrisk motorvogn",
//                    "Parkering forbudt", "Stans forbudt"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Sone med bruksforbud for liten elektrisk motorvogn",
//                description: "Skiltet angir grense for område hvor det er forbudt å bruke liten elektrisk motorvogn. Skiltet gjelder til det blir opphevet av skilt 382 «Slutt på sone med bruksforbud for liten elektrisk motorvogn».",
//                images: ["380_0"],
//                wrongAnswers: [
//                    "Slutt på sone med bruksforbud for liten elektrisk motorvogn",
//                    "Sone med parkeringsforbud for liten elektrisk motorvogn",
//                    "Slutt på sone med parkeringsforbud for liten elektrisk motorvogn",
//                    "Parkeringssone", "Slutt på parkeringssone",
//                    "Parkering forbudt", "Stans forbudt"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Slutt på sone med bruksforbud for liten elektrisk motorvogn",
//                description: "Skiltet markerer at bestemmelser angitt ved skilt 380 «Sone med bruksforbud for liten elektrisk motorvogn» opphører.",
//                images: ["382_0"],
//                wrongAnswers: [
//                    "Sone med bruksforbud for liten elektrisk motorvogn",
//                    "Sone med parkeringsforbud for liten elektrisk motorvogn",
//                    "Slutt på sone med parkeringsforbud for liten elektrisk motorvogn",
//                    "Parkeringssone", "Slutt på parkeringssone",
//                    "Parkering forbudt", "Stans forbudt"
//                ],
//                sectionName: "Forbudsskilt",
//                subSectionName: nil,
//            )
//        ]
//    )
//    
//    static let paabudsskilt = TrafficSection(
//        name: "Påbudsskilt",
//        description: """
//Påbudsskilt er veitrafikkskilt som viser at et bestemt påbud gjelder på en strekning eller et sted. De forteller deg hva du må gjøre, i motsetning til forbudsskilt som sier hva du ikke skal gjøre.
//
//Formen er alltid rund med blå bakgrunn og hvite symboler, slik at de lett kan skilles fra andre typer skilt. Påbudsskilt er derfor enkle å kjenne igjen – og viktige å følge for å holde trafikken trygg og flytende.
//""",
//        subSections: nil,
//        signs: [
//            TrafficSign(
//                title: "Påbudt kjøreretning",
//                description: "Skiltet angir at kjørende skal forlate vegkrysset i den retning som er angitt på skiltet.",
//                images: ["402_1", "402_2", "402_3", "402_4", "402_5", "402_6", "402_7", "402_8"],
//                wrongAnswers: [
//                    "Påbudt kjørefelt", "Påbudt rundkjøring", "Påbudt kjøreretning i rundkjøring",
//                    "Påbudt kollektivfelt", "Påbudt sykkelveg", "Påbudt gangveg",
//                    "Påbudt gang- og sykkelveg", "Påbudt motorveg", "Påbudt forbikjøringsfelt",
//                    "Forbudt for motorvogn"
//                ],
//                sectionName: "Påbudsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Påbudt kjørefelt",
//                description: "Skiltet angir at kjørende skal passere skiltet på den side som pilen peker mot.",
//                images: ["404_1", "404_2"],
//                wrongAnswers: [
//                    "Påbudt kjøreretning", "Påbudt rundkjøring", "Påbudt kjøreretning i rundkjøring",
//                    "Påbudt sykkelveg", "Påbudt gangveg", "Påbudt gang- og sykkelveg",
//                    "Påbudt motorveg", "Påbudt kollektivfelt", "Påbudt forbikjøringsfelt",
//                    "Innkjøring forbudt"
//                ],
//                sectionName: "Påbudsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Påbudt rundkjøring",
//                description: "Skiltet angir at kjørende skal kjøre inn i rundkjøring og følge den.",
//                images: ["406_0"],
//                wrongAnswers: [
//                    "Påbudt kjøreretning", "Påbudt kjørefelt", "Påbudt kjøreretning i rundkjøring",
//                    "Påbudt kollektivfelt", "Påbudt sykkelveg", "Påbudt gangveg",
//                    "Påbudt gang- og sykkelveg", "Påbudt motorveg", "Påbudt forbikjøringsfelt",
//                    "Parkering forbudt"
//                ],
//                sectionName: "Påbudsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Påbudt kjøreretning i rundkjøring",
//                description: "Skiltet angir hvilken retning som skal følges i rundkjøringen.",
//                images: ["408"],
//                wrongAnswers: [
//                    "Påbudt kjøreretning", "Påbudt kjørefelt", "Påbudt rundkjøring",
//                    "Påbudt kollektivfelt", "Påbudt sykkelveg", "Påbudt gangveg",
//                    "Påbudt gang- og sykkelveg", "Påbudt motorveg", "Påbudt forbikjøringsfelt",
//                    "Stans forbudt"
//                ],
//                sectionName: "Påbudsskilt",
//                subSectionName: nil
//            )
//        ]
//    )
//    
//    static let opplysningsskilt = TrafficSection(
//        name: "Opplysningsskilt",
//        description: """
//            Opplysningsskilt er en gruppe trafikkskilt som angir at særlige veitrafikkregler (forbud eller påbud) gjelder eller slutter å gjelde. 
//            
//            De har kvadratisk eller rektangulær form og vanligvis blå bunn, hvit bord og hvitt symbol eller tekst. De kan ha underskilt for å klargjøre betydningen, gi utfyllende regulering eller unntak.
//            """,
//        subSections: nil,
//        signs: [
//            TrafficSign(
//                title: "Motorveg",
//                description: "Skiltet angir at trafikkreglenes bestemmelser om motorveg gjelder fra skiltet og til skilt 504 «Slutt på motorveg», til skilt 503 «Motortrafikkveg» eller til kryss mellom avkjøringsveg fra motorveg og veg som ikke er motorveg.",
//                images: ["502_0"],
//                wrongAnswers: [
//                    "Slutt på motorveg", "Tungtrafikkfelt",
//                    "Kollektivfelt (buss)", "Sambruksfelt", "Gatetun", "Parkering",
//                    "Feil kjøreretning", "Blindveg"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Motortrafikkveg",
//                description: "Skiltet angir at trafikkreglenes bestemmelser om motortrafikkveg gjelder fra skiltet og til skilt 505 «Slutt på motortrafikkveg», til skilt 502 «Motorveg» eller til kryss mellom avkjøringsveg fra motortrafikkveg og veg som ikke er motortrafikkveg.",
//                images: ["503_0"],
//                wrongAnswers: [
//                    "Slutt på motortrafikkveg", "Tungtrafikkfelt",
//                    "Kollektivfelt (buss og drosje)", "Sambruksfelt", "Gågate", "Blindveg",
//                    "Møteplass", "Gangfelt"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Slutt på motorveg",
//                description: "Markerer at motorveg opphører. Etter dette skiltet gjelder ikke lenger de særlige trafikkreglene for motorveg, og fartsgrense eller kjørefeltregulering kan endres.",
//                images: ["504_0"],
//                wrongAnswers: [
//                    "Motorveg", "Slutt på tungtrafikkfelt",
//                    "Kollektivfelt (buss)", "Sambruksfelt", "Gatetun", "Blindveg",
//                    "Gangveg", "Valgfritt kjørefelt"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Slutt på motortrafikkveg",
//                description: "Markerer at motortrafikkveg opphører. Etter dette skiltet gjelder ikke lenger de særskilte trafikkreglene for motortrafikkveg, og andre trafikanter kan forekomme.",
//                images: ["505_0"],
//                wrongAnswers: [
//                    "Motortrafikkveg", "Slutt på tungtrafikkfelt",
//                    "Kollektivfelt (buss og drosje)", "Sambruksfelt", "Gågate", "Blindveg",
//                    "Gangfelt", "Møteplass"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Tungtrafikkfelt",
//                description: "Kjørefelt for motorvogn med tillatt totalvekt høyere enn angitt. Skiltet angir at kjørefelt for tungtrafikk begynner og at trafikkreglenes bestemmelser om tungtrafikkfelt gjelder.",
//                images: ["506"],
//                wrongAnswers: [
//                    "Slutt på tungtrafikkfelt", "Kollektivfelt (buss)", "Kollektivfelt (buss og drosje)",
//                    "Sambruksfelt", "Motorveg", "Motortrafikkveg", "Gatetun", "Møteplass",
//                    "Parkering", "Sykkelveg"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Slutt på tungtrafikkfelt",
//                description: "Markerer at eget kjørefelt for tungtrafikk opphører. Etter dette skiltet gjelder vanlige regler for kjøring og feltbruk for alle kjøretøy.",
//                images: ["507"],
//                wrongAnswers: [
//                    "Tungtrafikkfelt", "Slutt på kollektivfelt", "Slutt på sambruksfelt",
//                    "Motorveg", "Motortrafikkveg", "Sambruksfelt", "Gågate",
//                    "Blindveg", "Gangveg", "Gatetun"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kollektivfelt (buss)",
//                description: "Skiltet angir at kollektivfelt begynner og at trafikkreglenes bestemmelser om kollektivfelt gjelder.",
//                images: ["508_1"],
//                wrongAnswers: [
//                    "Sambruksfelt", "Tungtrafikkfelt",
//                    "Motorveg", "Motortrafikkveg", "Slutt på kollektivfelt", "Slutt på sambruksfelt",
//                    "Gangveg", "Sykkelfelt – sideplassert", "Parkering"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kollektivfelt (buss og drosje)",
//                description: "Skiltet angir at kollektivfelt begynner og at trafikkreglenes bestemmelser om kollektivfelt gjelder.",
//                images: ["508_2"],
//                wrongAnswers: [
//                    "Sambruksfelt", "Tungtrafikkfelt",
//                    "Motorveg", "Motortrafikkveg", "Slutt på kollektivfelt", "Slutt på sambruksfelt",
//                    "Gangveg", "Sykkelfelt – midtstilt", "Parkering"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Sambruksfelt",
//                description: "Skiltet angir at sambruksfelt begynner og at trafikkreglenes bestemmelser om sambruksfelt gjelder.",
//                images: ["509_0"],
//                wrongAnswers: [
//                    "Kollektivfelt (buss)", "Tungtrafikkfelt",
//                    "Motorveg", "Motortrafikkveg", "Slutt på sambruksfelt", "Slutt på kollektivfelt",
//                    "Gangveg", "Sykkelveg", "Parkering"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Slutt på kollektivfelt",
//                description: "Markerer at kollektivfeltet opphører. Etter dette skiltet gjelder vanlige trafikkregler, og feltet kan brukes av alle kjøretøy med mindre annet er angitt.",
//                images: ["510_1", "510_2"],
//                wrongAnswers: [
//                    "Kollektivfelt (buss og drosje)", "Sambruksfelt",
//                    "Slutt på sambruksfelt", "Motorveg", "Motortrafikkveg", "Tungtrafikkfelt",
//                    "Gågate", "Parkering", "Gangfelt"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Slutt på sambruksfelt",
//                description: "Markerer at sambruksfeltet opphører. Etter dette skiltet gjelder vanlige regler for bruk av kjørefelt, og adgangen for kjøretøy med flere personer opphører.",
//                images: ["511_0"],
//                wrongAnswers: [
//                    "Sambruksfelt", "Kollektivfelt (buss)",
//                    "Slutt på kollektivfelt", "Tungtrafikkfelt", "Motorveg", "Motortrafikkveg",
//                    "Gangveg", "Sykkelfelt – midtstilt", "Parkering"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Holdeplass for buss",
//                description: "Skiltet angir at det er holdeplass for buss på stedet og at trafikkreglenes bestemmelser om holdeplass gjelder. Skiltet kan plasseres på leskur og på rutetavle.",
//                images: ["512_0"],
//                wrongAnswers: [
//                    "Holdeplass for sporvogn", "Holdeplass for drosje", "Parkering",
//                    "Kollektivfelt (buss)", "Møteplass",
//                    "Blindveg", "Gangfelt", "Gågate", "Sykkelveg"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Holdeplass for sporvogn",
//                description: "Skiltet angir at det er holdeplass for sporvogn på stedet og at trafikkreglenes bestemmelser om holdeplass gjelder. Skiltet kan plasseres på leskur og på rutetavle.",
//                images: ["513_0"],
//                wrongAnswers: [
//                    "Holdeplass for buss", "Holdeplass for drosje", "Parkering",
//                    "Kollektivfelt (buss og drosje)", "Møteplass",
//                    "Blindveg", "Gangfelt", "Gågate", "Sykkelveg"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Holdeplass for drosje",
//                description: "Skiltet angir at det er holdeplass for drosje på stedet og at trafikkreglenes bestemmelser om holdeplass gjelder. Skiltet kan plasseres på leskur.",
//                images: ["514_0"],
//                wrongAnswers: [
//                    "Holdeplass for buss", "Holdeplass for sporvogn", "Parkering",
//                    "Kollektivfelt (buss)", "Møteplass",
//                    "Blindveg", "Gangfelt", "Gågate", "Sykkelveg"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Gangfelt",
//                description: "Skiltet angir kryssingssted for gående hvor trafikkreglenes bestemmelser om gangfelt gjelder.",
//                images: ["516_H", "516_V"],
//                wrongAnswers: [
//                    "Sykkelveg", "Møteplass", "Blindveg", "Valgfritt kjørefelt",
//                    "Parkering", "Holdeplass for buss"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Gangveg",
//                description: "Skiltet angir veg som er anlagt for gående. Skiltet angir dessuten at trafikkreglenes bestemmelser om bruk av slik veg gjelder.",
//                images: ["518_0"],
//                wrongAnswers: [
//                    "Sykkelveg", "Møteplass", "Blindveg", "Valgfritt kjørefelt",
//                    "Parkering", "Holdeplass for buss"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Sykkelveg",
//                description: "Skiltet angir veg som er anlagt for syklende og fører av liten elektrisk motorvogn.",
//                images: ["520_0"],
//                wrongAnswers: [
//                    "Gangveg", "Møteplass", "Blindveg", "Valgfritt kjørefelt",
//                    "Parkering", "Holdeplass for buss"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Sykkelfelt",
//                description: "Skiltet angir at kjørebanen har eget kjørefelt for syklende og fører av liten elektrisk motorvogn. Kan være sideplassert eller midtstilt.",
//                images: ["521_0", "521_1"],
//                wrongAnswers: [
//                    "Gangveg", "Gangfelt", "Gågate", "Møteplass", "Blindveg", "Valgfritt kjørefelt",
//                    "Parkering", "Holdeplass for buss"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Gang- og sykkelveg",
//                description: "Skiltet angir veg som er anlagt for gående, syklende og fører av liten elektrisk motorvogn.",
//                images: ["522_0"],
//                wrongAnswers: [
//                    "Sykkelveg", "Møteplass", "Blindveg", "Valgfritt kjørefelt",
//                    "Parkering", "Holdeplass for buss"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Møteplass",
//                description: "Skiltet angir sted hvor trafikkreglenes bestemmelser om møteplass gjelder.",
//                images: ["524_0"],
//                wrongAnswers: [
//                    "Gangfelt", "Blindveg", "Valgfritt kjørefelt",
//                    "Parkering", "Holdeplass for buss", "Gågate"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Envegskjøring",
//                description: "Skiltet angir at kjøring bare er tillatt i pilens retning fram til første vegkryss.",
//                images: ["526_1", "526_2"],
//                wrongAnswers: [
//                    "Blindveg", "Valgfritt kjørefelt", "Sammenfletting", "Kjørefelt slutter",
//                    "Kjørefelt begynner", "Endret kjøremønster", "Møteplass", "Parkering",
//                    "Gatetun", "Feil kjøreretning"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Blindveg",
//                description: "Skiltet viser at vegen er fysisk stengt, eller kun stengt for biltrafikk men åpen for gående/syklende.",
//                images: ["527_1", "527_2", "527_3", "527_4"],
//                wrongAnswers: [
//                    "Envegskjøring", "Valgfritt kjørefelt", "Sammenfletting", "Kjørefelt slutter",
//                    "Kjørefelt begynner", "Endret kjøremønster", "Møteplass", "Parkering",
//                    "Gatetun", "Feil kjøreretning"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Valgfritt kjørefelt",
//                description: "Angir at kjørende fritt kan velge hvilket kjørefelt de vil benytte i kjøreretningen videre. Skiltet brukes der flere felt fører til samme reisemål eller retning.",
//                images: ["528_0"],
//                wrongAnswers: [
//                    "Blindveg", "Envegskjøring", "Sammenfletting", "Kjørefelt slutter",
//                    "Kjørefelt begynner", "Endret kjøremønster", "Møteplass", "Parkering",
//                    "Gatetun", "Feil kjøreretning"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Sammenfletting",
//                description: "Skiltet angir at kjørefelt føres sammen til ett med gjensidig tilpassing i samsvar med trafikkreglenes bestemmelser (fletting).",
//                images: ["530a", "530b"],
//                wrongAnswers: [
//                    "Valgfritt kjørefelt", "Blindveg", "Envegskjøring", "Kjørefelt slutter",
//                    "Kjørefelt begynner", "Endret kjøremønster", "Møteplass", "Parkering",
//                    "Gatetun", "Feil kjøreretning"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Felt for fartsøkning",
//                description: "Skiltet angir at felt for fartsøkning føres inn på annet kjørefelt med gjensidig tilpassing.",
//                images: ["531_1", "531_2"],
//                wrongAnswers: [
//                    "Kjørefelt slutter", "Kjørefelt begynner", "Sammenfletting", "Valgfritt kjørefelt",
//                    "Blindveg", "Envegskjøring", "Endret kjøremønster", "Parkering",
//                    "Gatetun", "Feil kjøreretning"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kjørefelt slutter",
//                description: "Kjørende i felt som slutter skal skifte felt og har vikeplikt i samsvar med trafikkreglene.",
//                images: ["532a", "532b"],
//                wrongAnswers: [
//                    "Kjørefelt begynner", "Felt for fartsøkning", "Sammenfletting", "Valgfritt kjørefelt",
//                    "Blindveg", "Envegskjøring", "Endret kjøremønster", "Parkering",
//                    "Gatetun", "Feil kjøreretning"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kjørefelt begynner",
//                description: "Angir at et nytt kjørefelt begynner. Skiltet viser hvordan kjørefeltene er ordnet, og brukes blant annet der antall kjørefelt økes før kryss eller ved påkjøringsrampe.",
//                images: ["534a", "534b", "534c"],
//                wrongAnswers: [
//                    "Kjørefelt slutter", "Felt for fartsøkning", "Sammenfletting", "Valgfritt kjørefelt",
//                    "Blindveg", "Envegskjøring", "Endret kjøremønster", "Parkering",
//                    "Gatetun", "Feil kjøreretning"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Påkjøring fortsetter i eget kjørefelt",
//                description: "Viser at kjørefelt fra påkjøringsvei fortsetter som eget kjørefelt uten sammenfletting med trafikken på hovedveien.",
//                images: ["536_1", "536_2", "536_3", "536_4"],
//                wrongAnswers: [
//                    "Kjørefelt slutter", "Felt for fartsøkning", "Sammenfletting",
//                    "Valgfritt kjørefelt", "Blindveg", "Envegskjøring", "Endret kjøremønster"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kjørefeltinndeling",
//                description: "Skiltet angir antall kjørefelt på kjørebanen, og kjøreretningen for de enkelte felt.",
//                images: ["538_0", "538_1", "538_2"],
//                wrongAnswers: [
//                    "Kjørefelt begynner", "Kjørefelt slutter", "Felt for fartsøkning", "Sammenfletting",
//                    "Valgfritt kjørefelt", "Blindveg", "Envegskjøring", "Endret kjøremønster"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Endret kjøremønster",
//                description: "Varsler at kjøremønsteret på stedet er endret. Skiltet brukes midlertidig eller permanent for å gjøre trafikantene oppmerksomme på ny kjørefeltinndeling, endret kjøreretning eller annen omlegging av trafikken.",
//                images: ["539_0"],
//                wrongAnswers: [
//                    "Kjørefeltinndeling", "Kjørefelt begynner", "Kjørefelt slutter", "Felt for fartsøkning",
//                    "Sammenfletting", "Valgfritt kjørefelt", "Blindveg", "Envegskjøring"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Gatetun",
//                description: "Skiltet angir grense for område hvor trafikkreglenes bestemmelser om gatetun gjelder.",
//                images: ["540_0"],
//                wrongAnswers: [
//                    "Parkering", "Blindveg",
//                    "Møteplass", "Gangfelt", "Gangveg", "Sykkelveg",
//                    "Feil kjøreretning", "Holdeplass for buss"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Slutt på gatetun",
//                description: "Markerer at området med gatetun opphører. Etter dette skiltet gjelder vanlige trafikkregler, og kjørende skal ikke lenger ta særlig hensyn til gående på samme måte som innenfor gatetunet.",
//                images: ["542_0"],
//                wrongAnswers: [
//                    "Slutt på motorveg",
//                    "Slutt på motortrafikkveg",
//                    "Slutt på tungtrafikkfelt",
//                    "Slutt på kollektivfelt",
//                    "Slutt på sambruksfelt",
//                    "Slutt på fartsgrensesone",
//                    "Slutt på parkeringssone",
//                    "Slutt på sone med bruksforbud",
//                    "Slutt på særskilt fartsgrense"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Gågate",
//                description: "Skiltet angir grense for område hvor det er forbudt å kjøre motorvogn unntatt liten elektrisk motorvogn.",
//                images: ["548_0"],
//                wrongAnswers: [
//                    "Parkering",
//                    "Blindveg", "Møteplass",
//                    "Sykkelveg", "Holdeplass for buss"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Slutt på gågate",
//                description: "Markerer at området med gågate opphører. Etter dette skiltet gjelder vanlige trafikkregler, og kjøring, stans og parkering følger de generelle bestemmelsene for vanlig veg.",
//                images: ["550_0"],
//                wrongAnswers: [
//                    "Slutt på motorveg",
//                    "Slutt på motortrafikkveg",
//                    "Slutt på tungtrafikkfelt",
//                    "Slutt på kollektivfelt",
//                    "Slutt på sambruksfelt",
//                    "Slutt på fartsgrensesone",
//                    "Slutt på parkeringssone",
//                    "Slutt på sone med bruksforbud",
//                    "Slutt på særskilt fartsgrense"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Parkering",
//                description: "Skiltet angir at parkering er tillatt på stedet, dersom parkeringen ikke er i strid med trafikkreglene.",
//                images: ["552_0"],
//                wrongAnswers: [
//                    "Gågate", "Gatetun", "Slutt på gågate", "Slutt på gatetun",
//                    "Blindveg", "Møteplass", "Gangfelt", "Gangveg",
//                    "Sykkelveg", "Holdeplass for buss"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Havarilomme",
//                description: "Skiltet angir plass for nødstans på motorveg eller motortrafikkveg. Havarilommer brukes ved nødstilfeller, for eksempel ved motorstopp eller tekniske problemer.",
//                images: ["555_0"],
//                wrongAnswers: [
//                    "Parkering", "Møteplass", "Blindveg", "Envegskjøring",
//                    "Valgfritt kjørefelt", "Gangfelt", "Sykkelveg",
//                    "Gatetun", "Gågate"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Automatisk trafikkontroll – punktmåling",
//                description: "Varsler at det foretas automatisk trafikkontroll ved punktmåling av fart på stedet. Målingen skjer med kamera, og hensikten er å redusere fartsoverskridelser og øke trafikksikkerheten.",
//                images: ["556_1"],
//                wrongAnswers: [
//                    "Opplysningstavle",
//                    "Feil kjøreretning", "Nødutgang", "Parkering", "Blindveg",
//                    "Gågate", "Gatetun", "Møteplass"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Automatisk trafikkontroll – strekningsmåling",
//                description: "Varsler at det foretas automatisk trafikkontroll med strekningsmåling av fart. Gjennomsnittsfarten beregnes mellom to målepunkter, og hensikten er å sikre jevn og trygg fart over lengre strekninger.",
//                images: ["556_2"],
//                wrongAnswers: [
//                    "Opplysningstavle",
//                    "Feil kjøreretning", "Nødutgang", "Parkering", "Blindveg",
//                    "Gågate", "Gatetun", "Møteplass"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Videokontroll/-overvåking",
//                description: "Varsler at området er underlagt videokontroll eller overvåking. Skiltet brukes for å informere trafikanter om at videoopptak kan foretas for sikkerhet eller trafikkregulering.",
//                images: ["558_0"],
//                wrongAnswers: [
//                    "Opplysningstavle",
//                    "Feil kjøreretning", "Nødutgang", "Parkering", "Blindveg",
//                    "Gågate", "Gatetun", "Møteplass"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Opplysningstavle",
//                description: "Skiltet kan gi opplysning om veg- og trafikkforhold som ikke kan formidles ved andre trafikkskilt.",
//                images: ["560_0"],
//                wrongAnswers: [
//                    "Videokontroll/-overvåking",
//                    "Feil kjøreretning", "Nødutgang", "Parkering", "Blindveg",
//                    "Gågate", "Gatetun", "Møteplass"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Feil kjøreretning",
//                description: "Advarer førere om at de kjører i feil retning. Skiltet settes opp ved avkjøringer eller påkjøringsramper for å forhindre kjøring mot kjøreretningen på motorveg eller annen envegskjørt veg.",
//                images: ["565_0"],
//                wrongAnswers: [
//                    "Nødutgang", "Parkering", "Blindveg", "Gågate",
//                    "Gatetun", "Møteplass"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Nødutgang",
//                description: "Angir retning til nødutgang i tunnel eller annet avgrenset område. Skiltet hjelper trafikanter med å finne nærmeste rømningsvei ved brann eller annen nødsituasjon.",
//                images: ["570_1V", "570_1H"],
//                wrongAnswers: [
//                    "Opplysningstavle", "Parkering", "Blindveg", "Gågate",
//                    "Gatetun", "Møteplass"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Retning og avstand til nødutgang",
//                description: "Viser både retningen og avstanden til nærmeste nødutgang i tunnel eller annet lukket område. Skiltet hjelper trafikanter med å raskt finne ut hvor langt det er til utgangen i en nødsituasjon.",
//                images: ["570_2V", "570_2H"],
//                wrongAnswers: [
//                    "Opplysningstavle", "Parkering", "Blindveg", "Gågate",
//                    "Gatetun", "Møteplass"
//                ],
//                sectionName: "Opplysningsskilt",
//                subSectionName: nil
//            )
//        ],
//        
//    )
//    
//    static let serviceskilt = TrafficSection(
//        name: "Serviceskilt",
//        description: """
//            Serviceskilt er en gruppe trafikkskilt som gir opplysninger om blant annet nødhjelp, vegservice, og severdigheter. Hensikten med serviceskilt er å fortelle trafikantene om servicetilbud som ligger like ved vegen de ferdes på.
//            
//            Blå serviceskilt gir opplysning om nødhjelp og vegservice og retter seg mot alle trafikanter.
//            
//            Brune serviceskilt gir opplysning om severdigheter, aktiviteter, friluftsliv, med mer, og retter seg mot turister og andre fritidsreisende
//            """,
//        subSections: nil,
//        signs: [
//            // A. Skilt for nødhjelp og vegservice
//            TrafficSign(
//                title: "Lytt til radio",
//                description: "Angir at trafikanter bør lytte til radio for viktige meldinger om trafikkforhold, vær eller hendelser i området.",
//                images: ["601_1"],
//                wrongAnswers: [
//                    "Førstehjelp", "Nødtelefon", "Brannslokningsapparat",
//                    "Informasjon", "Turistkontor", "Drivstoff",
//                    "Rasteplass", "Overnattingssted", "Toalett", "Campingplass"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Førstehjelp",
//                description: "Viser hvor det finnes utstyr eller hjelp for å gi førstehjelp ved ulykker eller skader.",
//                images: ["602"],
//                wrongAnswers: [
//                    "Lytt til radio", "Nødtelefon", "Brannslokningsapparat",
//                    "Kjøretøyverksted", "Informasjon", "Turistkontor",
//                    "Toalett", "Rasteplass", "Campingplass", "Spisested"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Nødtelefon",
//                description: "Angir plassering av nødtelefon som kan brukes for å tilkalle hjelp ved ulykke eller nødsituasjon.",
//                images: ["605_0"],
//                wrongAnswers: [
//                    "Førstehjelp", "Brannslokningsapparat", "Lytt til radio",
//                    "Informasjon", "Turistkontor", "Kjøretøyverksted",
//                    "Rasteplass", "Toalett", "Overnattingssted", "Campingplass"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Brannslokningsapparat",
//                description: "Viser hvor brannslokningsapparat er plassert, vanligvis i tunneler eller på rasteplasser for bruk ved brann eller røykutvikling.",
//                images: ["606_0"],
//                wrongAnswers: [
//                    "Førstehjelp", "Nødtelefon", "Lytt til radio",
//                    "Kjøretøyverksted", "Hurtiglading av motorvogn", "Drivstoff",
//                    "Informasjon", "Rasteplass", "Campingplass", "Overnattingssted"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Kjøretøyverksted",
//                description: "Angir hvor det finnes verksted for reparasjon eller vedlikehold av kjøretøy.",
//                images: ["608_0"],
//                wrongAnswers: [
//                    "Drivstoff", "Hurtiglading av motorvogn", "Rasteplass",
//                    "Lytt til radio", "Førstehjelp", "Nødtelefon",
//                    "Campingplass", "Overnattingssted", "Toalett", "Informasjon"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Hurtiglading av motorvogn",
//                description: "Viser hvor det finnes hurtiglader for elektriske kjøretøy.",
//                images: ["609"],
//                wrongAnswers: [
//                    "Drivstoff", "Kjøretøyverksted", "Toalett",
//                    "Rasteplass", "Campingplass", "Overnattingssted",
//                    "Lytt til radio", "Førstehjelp", "Informasjon", "Turistkontor"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Drivstoff",
//                description: "Angir hvor det finnes bensinstasjon eller annen energiforsyning for motorkjøretøy.",
//                images: ["610_0", "610_1", "610_2"],
//                wrongAnswers: [
//                    "Hurtiglading av motorvogn", "Kjøretøyverksted", "Rasteplass",
//                    "Campingplass", "Overnattingssted", "Toalett",
//                    "Spisested", "Informasjon", "Turistkontor", "Lytt til radio"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Toalett",
//                description: "Angir plassering av toalett for publikum, ofte i tilknytning til rasteplass eller servicested.",
//                images: ["612_0"],
//                wrongAnswers: [
//                    "Toalettømmeanlegg", "Rasteplass", "Campingplass",
//                    "Bobilplass", "Overnattingssted", "Rom og frokost",
//                    "Drivstoff", "Informasjon", "Spisested", "Campinghytter"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Rasteplass",
//                description: "Viser hvor det finnes rasteplass der trafikanter kan ta pause. Plassen kan ha bord, benker eller toalett, og er ment for kortere stopp.",
//                images: ["613_1", "613_2"],
//                wrongAnswers: [
//                    "Bobilplass", "Overnattingssted",
//                    "Toalett", "Informasjon",
//                    "Turistkontor", "Drivstoff", "Lytt til radio"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Enklere servering",
//                description: "Viser sted hvor det tilbys enkel servering, som kiosk, kafé eller lignende. Skiltet brukes der tilbudet ikke regnes som fullverdig restaurant.",
//                images: ["614_0"],
//                wrongAnswers: [
//                    "Campingplass", "Rasteplass",
//                    "Toalett", "Overnattingssted",
//                    "Informasjon", "Turistkontor", "Drivstoff", "Vandrerhjem"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Spisested",
//                description: "Angir sted hvor det finnes restaurant eller annet serveringssted med varm mat og drikke.",
//                images: ["616_0"],
//                wrongAnswers: [
//                    "Rasteplass", "Campingplass",
//                    "Overnattingssted", "Toalett",
//                    "Informasjon", "Turistkontor", "Campinghytter", "Bobilplass"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Campingplass",
//                description: "Viser hvor det finnes campingplass for telt, campingvogner eller bobiler.",
//                images: ["618_0"],
//                wrongAnswers: [
//                    "Toalettømmeanlegg", "Toalett",
//                    "Vandrerhjem", "Rom og frokost", "Spisested", "Turistkontor"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Bobilplass",
//                description: "Angir oppstillingsplass for bobiler, med mulighet for overnatting og eventuelt tilkobling til vann og strøm.",
//                images: ["621_0"],
//                wrongAnswers: [
//                    "Campinghytter", "Rasteplass",
//                    "Toalettømmeanlegg", "Toalett", "Overnattingssted",
//                    "Rom og frokost", "Spisested", "Informasjon", "Vandrerhjem"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Campinghytter",
//                description: "Viser hvor det tilbys overnatting i hytter, ofte i tilknytning til campingplass.",
//                images: ["622_0"],
//                wrongAnswers: [
//                    "Bobilplass", "Rasteplass",
//                    "Overnattingssted", "Rom og frokost", "Vandrerhjem",
//                    "Spisested", "Enklere servering", "Turistkontor", "Toalett"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Vandrerhjem",
//                description: "Angir overnattingssted med rimelig innkvartering, vanligvis med selvhushold eller enkle rom.",
//                images: ["624_0"],
//                wrongAnswers: [
//                    "Rom og frokost", "Campingplass",
//                    "Bobilplass", "Rasteplass",
//                    "Toalett", "Informasjon", "Turistkontor", "Spisested"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Rom og frokost",
//                description: "Viser overnattingssted der det tilbys rom med frokost, ofte i privat bolig eller mindre gjestehus.",
//                images: ["625_0"],
//                wrongAnswers: [
//                    "Vandrerhjem", "Overnattingssted", "Campingplass",
//                    "Campinghytter", "Bobilplass", "Rasteplass",
//                    "Toalett", "Turistkontor"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Overnattingssted",
//                description: "Angir hotell, motell eller annet overnattingssted med full service.",
//                images: ["626_0"],
//                wrongAnswers: [
//                    "Vandrerhjem", "Campingplass",
//                    "Campinghytter", "Bobilplass", "Rasteplass",
//                    "Toalett", "Spisested", "Informasjon", "Turistkontor"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Informasjon",
//                description: "Viser sted hvor det finnes generell informasjon for trafikanter og reisende, for eksempel om ruter eller tjenester.",
//                images: ["635_0"],
//                wrongAnswers: [
//                    "Severdighet", "Museum/galleri",
//                    "Utsiktspunkt", "Naturvernområde", "Verdensarv",
//                    "Rasteplass", "Toalett", "Campingplass", "Overnattingssted"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Turistkontor",
//                description: "Angir sted hvor reisende kan få turistinformasjon, brosjyrer og veiledning om aktiviteter og overnatting.",
//                images: ["637_0"],
//                wrongAnswers: [
//                    "Severdighet", "Museum/galleri",
//                    "Utsiktspunkt", "Naturvernområde", "Verdensarv",
//                    "Rasteplass", "Toalett", "Campingplass", "Overnattingssted"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil
//            ),
//            //            TrafficSign(title: "Døgnhvileplass", description: "", images: ["638_0"]),
//            
//            // B. Skilt for severdigheter, aktiviteter, friluftsliv m.m.
//            TrafficSign(
//                title: "Museum/galleri",
//                description: "Viser hvor det finnes museum eller galleri som er åpent for publikum. Skiltet brukes for kulturinstitusjoner som formidler kunst, historie eller naturvitenskap.",
//                images: ["640_12"],
//                wrongAnswers: [
//                    "Severdighet", "Utsiktspunkt", "Naturvernområde",
//                    "Verdensarv", "Nasjonale festningsverk", "Informasjon",
//                    "Turistkontor", "Campingplass", "Spisested", "Overnattingssted"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Utsiktspunkt",
//                description: "Angir sted med utsikt over landskap, by eller annet område av interesse. Skiltet markerer stoppested for å nyte utsikten eller ta bilder.",
//                images: ["640_20"],
//                wrongAnswers: [
//                    "Museum/galleri", "Turistkontor",
//                    "Informasjon", "Rasteplass", "Campingplass", "Spisested"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil,
//            ),
//            TrafficSign(
//                title: "Naturvernområde",
//                description: "Viser vei til eller grense for et område som er vernet på grunn av naturverdier. Området kan være nasjonalpark, naturreservat eller landskapsvernområde.",
//                images: ["640_30"],
//                wrongAnswers: [
//                    "Utsiktspunkt", "Museum/galleri",
//                    "Nasjonale festningsverk", "Turistkontor",
//                    "Informasjon", "Campingplass", "Spisested", "Overnattingssted"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Verdensarv",
//                description: "Markerer at stedet er oppført på UNESCOs verdensarvliste, og dermed har kultur- eller naturverdier av særlig internasjonal betydning.",
//                images: ["640_101"],
//                wrongAnswers: [
//                    "Utsiktspunkt",
//                    "Museum/galleri", "Nasjonale festningsverk", "Turistkontor",
//                    "Informasjon", "Campingplass", "Spisested", "Overnattingssted"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Nasjonale festningsverk",
//                description: "Viser vei til et av landets nasjonale festningsverk, som har historisk og kulturell verdi og ofte er åpne for publikum.",
//                images: ["640_102"],
//                wrongAnswers: [
//                    "Museum/galleri", "Utsiktspunkt", "Turistkontor",
//                    "Informasjon", "Campingplass", "Spisested", "Overnattingssted"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Badeplass",
//                description: "Viser vei til offentlig badeplass for bading i sjø, innsjø eller elv. Skiltet brukes der det er tilrettelagt for bading.",
//                images: ["650_10"],
//                wrongAnswers: [
//                    "Fiskeplass", "Tursti", "Skiløype",
//                    "Sykkelløype", "Campingplass", "Rasteplass",
//                    "Spisested", "Severdighet", "Utsiktspunkt", "Overnattingssted"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Fiskeplass",
//                description: "Viser vei til område hvor det er tilrettelagt for fritidsfiske fra land eller båt.",
//                images: ["650_11"],
//                wrongAnswers: [
//                    "Badeplass", "Tursti", "Skiløype",
//                    "Sykkelløype", "Campingplass", "Rasteplass",
//                    "Spisested", "Severdighet", "Utsiktspunkt", "Overnattingssted"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Tursti",
//                description: "Angir startpunkt eller adkomst til merket tursti i skog, fjell eller annet turområde.",
//                images: ["650_20"],
//                wrongAnswers: [
//                    "Skiløype", "Sykkelløype", "Fiskeplass",
//                    "Badeplass", "Naturvernområde", "Severdighet",
//                    "Utsiktspunkt", "Campingplass", "Spisested", "Overnattingssted"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Skiløype",
//                description: "Viser hvor det finnes preparert løype for langrenn eller annen skiaktivitet, gjerne som del av større løypenett.",
//                images: ["650_21"],
//                wrongAnswers: [
//                    "Tursti", "Sykkelløype", "Fiskeplass",
//                    "Badeplass", "Naturvernområde", "Severdighet",
//                    "Utsiktspunkt", "Campingplass", "Spisested", "Overnattingssted"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Sykkelløype",
//                description: "Angir startpunkt eller adkomst til merket sykkelløype. Skiltet brukes for ruter som er tilrettelagt for sykling i natur- og friluftsområder.",
//                images: ["650_22"],
//                wrongAnswers: [
//                    "Skiløype", "Tursti", "Fiskeplass",
//                    "Badeplass", "Naturvernområde", "Severdighet",
//                    "Utsiktspunkt", "Campingplass", "Spisested", "Overnattingssted"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Gardsmat/bygdeturisme",
//                description: "Viser vei til gård som tilbyr lokalprodusert mat, overnatting eller opplevelser knyttet til landbruk og bygdekultur.",
//                images: ["650_40"],
//                wrongAnswers: [
//                    "Campingplass", "Spisested", "Enklere servering",
//                    "Rom og frokost", "Overnattingssted", "Turistkontor",
//                    "Informasjon", "Severdighet", "Museum/galleri", "Rasteplass"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Olavsrosa",
//                description: "Markerer attraksjon eller bedrift som har fått kvalitetsmerket Olavsrosa fra Norsk Kulturarv for å formidle norsk kulturarv på autentisk vis.",
//                images: ["650_41"],
//                wrongAnswers: [
//                    "Severdighet", "Museum/galleri", "Naturvernområde",
//                    "Verdensarv", "Nasjonale festningsverk", "Turistkontor",
//                    "Informasjon", "Utsiktspunkt", "Campingplass", "Spisested"
//                ],
//                sectionName: "Serviceskilt",
//                subSectionName: nil
//            ),
//        ]
//    )
////    
//    static let underskilt = TrafficSection(
//        name: "Underskilt",
//        description: """
//            Underskilt er et skilt som brukes sammen med et trafikkskilt. Som navnet tilsier, er underskilt plassert under et hovedskilt. Underskiltet gir nærmere klargjøring, utviding, utfylling eller begrensning av hovedskiltets betydning eller gyldighetsområde.
//            
//            De fleste underskilt har svart tekst eller svarte symboler på hvit bunn. Hvis hovedskiltet har gul bunnfarge i forbindelse med veiarbeid, skal underskiltet også ha gul bunnfarge.
//            """,
//        subSections: nil,
//        signs: [
//            // A. Alminnelige underskilt
//            TrafficSign(
//                title: "Avstand",
//                description: "Underskiltet angir avstanden til det sted hvor hovedskiltet begynner å gjelde, eller til sted hvor tilsvarende hovedskilt er satt opp (forvarsling).",
//                images: ["802_0"],
//                wrongAnswers: [
//                    "Utstrekning", "Tid", "Svingpil",
//                    "Forvarsling av stopp", "Oppstilling av parkert kjøretøy",
//                    "Kombinert regulering", "Anbefalt fart", "Stigningsgrad"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Utstrekning",
//                description: "Underskiltet angir at hovedskiltet gjelder for bestemt vegstrekning.",
//                images: ["804_0"],
//                wrongAnswers: [
//                    "Avstand", "Tid", "Svingpil",
//                    "Utstrekning av stans- og parkeringsregulering", "Kombinert regulering",
//                    "Forløp av forkjørsveg", "Oppstilling av parkert kjøretøy", "Sykkeltrafikk i begge retninger"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Tid",
//                description: "Underskiltet angir at hovedskiltet bare gjelder i det eller de tidsrom som er angitt med klokkeslett.",
//                images: ["806_0"],
//                wrongAnswers: [
//                    "Avstand", "Utstrekning", "Svingpil",
//                    "Parkeringsskive/gratisbillett", "Kombinert regulering",
//                    "Forvarsling av stopp", "Oppstilling av parkert kjøretøy", "Anbefalt fart"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Personbil",
//                description: "Underskiltet brukes når hovedskiltet gjelder personbiler. Det angir at bestemmelsen kun omfatter kjøretøy i denne kategorien.",
//                images: ["807_1"],
//                wrongAnswers: [
//                    "Varebil, lastebil og trekkbil", "Buss", "Vogntog",
//                    "Campingtilhenger og trekkvogn", "Bobil", "Motorsykkel og moped",
//                    "Sykkel og liten elektrisk motorvogn", "Liten elektrisk motorvogn"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Varebil, lastebil og trekkbil",
//                description: "Underskiltet viser at reguleringen gjelder for varebiler, lastebiler og trekkbiler.",
//                images: ["807_2"],
//                wrongAnswers: [
//                    "Personbil", "Buss", "Vogntog",
//                    "Campingtilhenger og trekkvogn", "Bobil", "Motorsykkel og moped",
//                    "Sykkel og liten elektrisk motorvogn", "Liten elektrisk motorvogn"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Buss",
//                description: "Underskiltet angir at reguleringen gjelder for busser, både rutebusser og turbusser.",
//                images: ["807_3"],
//                wrongAnswers: [
//                    "Personbil", "Varebil, lastebil og trekkbil", "Vogntog",
//                    "Campingtilhenger og trekkvogn", "Bobil", "Motorsykkel og moped",
//                    "Sykkel og liten elektrisk motorvogn", "Liten elektrisk motorvogn"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Vogntog",
//                description: "Underskiltet viser at bestemmelsen gjelder vogntog, det vil si motorvogn med tilhenger.",
//                images: ["807_4"],
//                wrongAnswers: [
//                    "Personbil", "Buss", "Varebil, lastebil og trekkbil",
//                    "Campingtilhenger og trekkvogn", "Bobil", "Motorsykkel og moped",
//                    "Sykkel og liten elektrisk motorvogn", "Forflytningshemmede", "Liten elektrisk motorvogn"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Campingtilhenger og trekkvogn",
//                description: "Underskiltet brukes når reguleringen gjelder kjøretøy som trekker campingtilhenger, eller kombinasjoner av bil og tilhenger.",
//                images: ["807_5"],
//                wrongAnswers: [
//                    "Personbil", "Buss", "Vogntog",
//                    "Varebil, lastebil og trekkbil", "Bobil", "Motorsykkel og moped",
//                    "Sykkel og liten elektrisk motorvogn", "Forflytningshemmede", "Liten elektrisk motorvogn"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Sykkel og liten elektrisk motorvogn",
//                description: "Underskiltet viser at hovedskiltet gjelder for syklende og førere av liten elektrisk motorvogn, som el-sparkesykkel.",
//                images: ["807_6"],
//                wrongAnswers: [
//                    "Personbil", "Buss", "Vogntog",
//                    "Campingtilhenger og trekkvogn", "Bobil", "Motorsykkel og moped",
//                    "Forflytningshemmede", "Liten elektrisk motorvogn", "Varebil, lastebil og trekkbil"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Motorsykkel og moped",
//                description: "Underskiltet angir at reguleringen gjelder for motorsykler og mopeder.",
//                images: ["807_7"],
//                wrongAnswers: [
//                    "Personbil", "Buss", "Vogntog",
//                    "Campingtilhenger og trekkvogn", "Bobil", "Sykkel og liten elektrisk motorvogn",
//                    "Forflytningshemmede", "Liten elektrisk motorvogn", "Varebil, lastebil og trekkbil"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Forflytningshemmede",
//                description: "Underskiltet viser at hovedskiltet gjelder eller er unntatt for personer med gyldig parkeringstillatelse for forflytningshemmede.",
//                images: ["807_8"],
//                wrongAnswers: [
//                    "Personbil", "Buss", "Vogntog",
//                    "Campingtilhenger og trekkvogn", "Bobil", "Motorsykkel og moped",
//                    "Sykkel og liten elektrisk motorvogn", "Liten elektrisk motorvogn", "Varebil, lastebil og trekkbil"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Bobil",
//                description: "Underskiltet angir at reguleringen gjelder for bobiler, det vil si kjøretøy som er innredet for overnatting.",
//                images: ["807_9"],
//                wrongAnswers: [
//                    "Personbil", "Buss", "Vogntog",
//                    "Campingtilhenger og trekkvogn", "Varebil, lastebil og trekkbil", "Motorsykkel og moped",
//                    "Sykkel og liten elektrisk motorvogn", "Forflytningshemmede", "Liten elektrisk motorvogn"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Liten elektrisk motorvogn",
//                description: "Underskiltet viser at hovedskiltet gjelder for liten elektrisk motorvogn, som elektriske sparkesykler eller selvbalanserende kjøretøy.",
//                images: ["807_10"],
//                wrongAnswers: [
//                    "Personbil", "Buss", "Vogntog",
//                    "Campingtilhenger og trekkvogn", "Bobil", "Motorsykkel og moped",
//                    "Forflytningshemmede", "Varebil, lastebil og trekkbil"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Tekst",
//                description: "Underskiltet brukes når det ikke er hensiktsmessig å gi regulering eller informasjon med symbol, tall eller annet.",
//                images: ["808_42b"],
//                wrongAnswers: [
//                    "Tid", "Avstand", "Utstrekning",
//                    "Svingpil", "Kombinert regulering",
//                    "Parkeringsskive/gratisbillett", "Oppstilling av parkert kjøretøy", "Forvarsling av stopp", "Sykkeltrafikk i begge retninger"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Svingpil",
//                description: "Underskiltet angir at hovedskiltet gjelder etter sving i vegkryss.",
//                images: ["810_H45", "810_H90", "810_H135", "810_R", "810_V45", "810_V90", "810_V135"],
//                wrongAnswers: [
//                    "Tid", "Avstand", "Utstrekning",
//                    "Tekst", "Utstrekning av stans- og parkeringsregulering",
//                    "Forvarsling av stopp", "Forløp av forkjørsveg", "Oppstilling av parkert kjøretøy", "Sykkeltrafikk i begge retninger"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            
//            // B. Spesielle underskilt
//            // I. Til fareskilt
//            TrafficSign(
//                title: "Anbefalt fart",
//                description: "Underskiltet angir den høyeste fart som den varslede fare tilsier under normale forhold.",
//                images: ["812_0"],
//                wrongAnswers: [
//                    "Stigningsgrad", "Virkelig fri vegbredde", "Kryssende tømmertransport",
//                    "Særlig ulykkesfare", "Avstand", "Utstrekning",
//                    "Forvarsling av stopp", "Forløp av forkjørsveg", "Sykkeltrafikk i begge retninger"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Stigningsgrad",
//                description: "Underskiltet angir stigningens eller fallens prosentvise verdi på den aktuelle vegstrekningen.",
//                images: ["813_1", "813_2"],
//                wrongAnswers: [
//                    "Anbefalt fart", "Virkelig fri vegbredde", "Kryssende tømmertransport",
//                    "Særlig ulykkesfare", "Avstand", "Utstrekning",
//                    "Svingpil", "Forløp av forkjørsveg", "Sykkeltrafikk i begge retninger"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Virkelig fri vegbredde",
//                description: "Underskiltet viser den reelle frie bredden på vegen eller kjørefeltet, der plassforholdene kan være begrenset.",
//                images: ["814_0"],
//                wrongAnswers: [
//                    "Anbefalt fart", "Stigningsgrad", "Kryssende tømmertransport",
//                    "Særlig ulykkesfare", "Avstand", "Utstrekning",
//                    "Svingpil", "Tekst", "Sykkeltrafikk i begge retninger"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kryssende tømmertransport",
//                description: "Underskiltet varsler at kjøretøy med tømmerlasting krysser vegen, ofte i forbindelse med skogsdrift.",
//                images: ["816_0"],
//                wrongAnswers: [
//                    "Anbefalt fart", "Stigningsgrad", "Virkelig fri vegbredde",
//                    "Særlig ulykkesfare", "Avstand", "Utstrekning",
//                    "Svingpil", "Tekst", "Oppstilling av parkert kjøretøy"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Særlig ulykkesfare",
//                description: "Utformingen tilpasses den aktuelle faresituasjonen.",
//                images: ["817_1", "817_2", "817_3", "817_4", "817_5"],
//                wrongAnswers: [
//                    "Anbefalt fart", "Stigningsgrad", "Virkelig fri vegbredde",
//                    "Kryssende tømmertransport", "Avstand", "Utstrekning",
//                    "Svingpil",  "Forvarsling av stopp"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            
//            // II. Til vikeplikt- og forkjørsskilt
//            TrafficSign(
//                title: "Forløp av forkjørsveg",
//                description: "Underskiltet viser et skjematisk bilde av krysset, hvor tykk strek angir forkjørsveg og tynn strek angir sideveg.",
//                images: ["822_1", "822_2", "822_3", "822_4", "822_5", "822_6", "822_7"],
//                wrongAnswers: [
//                    "Forvarsling av stopp", "Sykkeltrafikk i begge retninger", "Utstrekning",
//                    "Avstand", "Tid", "Svingpil", "Tekst", "Anbefalt fart", "Kombinert regulering"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Forvarsling av stopp",
//                description: "Underskiltet brukes sammen med skilt 202 «Vikeplikt» for å varsle om at skilt 204 «Stopp» er satt opp i angitt avstand.",
//                images: ["824_0"],
//                wrongAnswers: [
//                    "Forløp av forkjørsveg", "Sykkeltrafikk i begge retninger", "Utstrekning",
//                    "Avstand", "Tid", "Svingpil", "Tekst", "Anbefalt fart", "Oppstilling av parkert kjøretøy"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Sykkeltrafikk i begge retninger",
//                description: "Underskiltet viser at det er trafikk med sykkel og liten elektrisk motorvogn i begge retninger.",
//                images: ["826_0"],
//                wrongAnswers: [
//                    "Forvarsling av stopp", "Forløp av forkjørsveg", "Utstrekning",
//                    "Avstand", "Tid", "Svingpil", "Tekst", "Anbefalt fart", "Stigningsgrad"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            
//            // III. Til stans- og parkeringsskilt
//            TrafficSign(
//                title: "Utstrekning av stans- og parkeringsregulering",
//                description: "Underskiltet angir at reguleringen gjelder i pilens retning eller i angitt avstand.",
//                images: ["828_1", "828_2", "828_3"],
//                wrongAnswers: [
//                    "Oppstilling av parkert kjøretøy", "Parkeringsskive/gratisbillett", "Kombinert regulering",
//                    "Avstand", "Utstrekning", "Tid", "Svingpil", "Tekst", "Forvarsling av stopp"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Oppstilling av parkert kjøretøy",
//                description: "Underskiltet viser hvordan kjøretøy skal plasseres ved parkering, for eksempel parallelt eller på skrå i forhold til fortauskant.",
//                images: ["829_0"],
//                wrongAnswers: [
//                    "Utstrekning av stans- og parkeringsregulering", "Parkeringsskive/gratisbillett", "Kombinert regulering",
//                    "Avstand", "Utstrekning", "Tid", "Svingpil", "Tekst", "Sykkeltrafikk i begge retninger"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Parkeringsskive/gratisbillett",
//                description: "Underskiltet angir at parkering bare er tillatt med synlig parkeringsskive eller billett som viser tidspunkt.",
//                images: ["831_0"],
//                wrongAnswers: [
//                    "Oppstilling av parkert kjøretøy", "Utstrekning av stans- og parkeringsregulering", "Kombinert regulering",
//                    "Avstand", "Utstrekning", "Tid", "Svingpil", "Forvarsling av stopp"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kombinert regulering",
//                description: "Underskiltet angir parkeringsregulering ved kombinasjon av tekst, tall og symboler.",
//                images: ["834_0"],
//                wrongAnswers: [
//                    "Oppstilling av parkert kjøretøy", "Parkeringsskive/gratisbillett", "Utstrekning av stans- og parkeringsregulering",
//                    "Avstand", "Utstrekning", "Tid", "Svingpil", "Anbefalt fart"
//                ],
//                sectionName: "Underskilt",
//                subSectionName: nil
//            ),
//            
//            // IV. Til opplysningsskilt
//            // TrafficSign(
//            //     title: "Generell fartsgrense i miniatyr",
//            //     description: "Underskiltet brukes sammen med skilt 556.2 «Automatisk trafikkontroll – strekningsmåling» for å vise hvilken fartsgrense som gjelder på strekningen.",
//            //     images: ["856_0"]
//            // )
//        ]
//    )
//    
//    static let markeringsskilt = TrafficSection(
//        name: "Markeringsskilt",
//        description: """
//        Markeringsskilt, skiltgruppe som gir informasjon om hvordan veien går videre. For eksempel svinger eller hindringer, i eller nær veien.
//        
//        De fleste markeringsskilt har gule vinkler eller striper på svart bunn. Midlertidige markeringsskilt har rød bunnfarge, og brukes for eksempel i forbindelse med veiarbeid.
//        """,
//        subSections: nil,
//        signs: [
//            TrafficSign(
//                title: "Bakgrunnsmarkering",
//                description: "Brukes som bakgrunn for andre trafikkskilt for å gjøre dem mer synlige, særlig på steder med dårlig kontrast eller mange visuelle forstyrrelser.",
//                images: ["902_0H", "902_0V"],
//                wrongAnswers: [
//                    "Retningsmarkering", "Hindermarkering", "Tunnelmarkering",
//                    "Avkjøringsmarkering", "Avstandsmarkering i tunnel",
//                    "Kantstolpe", "Trafikkjegle", "Trafikksylinder", "Fartsgrensemarkering"
//                ],
//                sectionName: "Markeringsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Retningsmarkering",
//                description: "Viser hvordan veien svinger videre, og brukes særlig i skarpe kurver for å hjelpe føreren å holde riktig kurs gjennom svingen.",
//                images: ["904_0H", "904_0V"],
//                wrongAnswers: [
//                    "Bakgrunnsmarkering", "Hindermarkering (skråstriper)", "Tunnelmarkering",
//                    "Avkjøringsmarkering", "Avstandsmarkering i tunnel",
//                    "Kantstolpe", "Trafikkjegle", "Vegarbeidsmarkering"
//                ],
//                sectionName: "Markeringsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Hindermarkering (skråstriper)",
//                description: "Skråstripene peker ned mot den siden hindringen kan passeres på. Brukes der veien er innsnevret eller der det finnes en hindring i kjørebanen.",
//                images: ["906_0V", "906_0H", "906_0VH"],
//                wrongAnswers: [
//                    "Retningsmarkering", "Bakgrunnsmarkering",
//                    "Tunnelmarkering", "Avkjøringsmarkering",
//                    "Kantstolpe", "Trafikksylinder", "Avstandsmarkering i tunnel"
//                ],
//                sectionName: "Markeringsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Hindermarkering",
//                description: "Markerer midtstilte hindringer eller øyer i veien. Skiltet viser at hindringen kan passeres på begge sider.",
//                images: ["908_0"],
//                wrongAnswers: [
//                    "Retningsmarkering", "Bakgrunnsmarkering",
//                    "Tunnelmarkering", "Avkjøringsmarkering",
//                    "Avstandsmarkering i tunnel", "Kantstolpe", "Trafikkjegle"
//                ],
//                sectionName: "Markeringsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Avkjøringsmarkering",
//                description: "Markerer avkjøringsvei fra motorvei eller annen vei med høy standard. Hjelper føreren med å identifisere avkjøringspunktet tydelig.",
//                images: ["912_0"],
//                wrongAnswers: [
//                    "Bakgrunnsmarkering", "Retningsmarkering", "Hindermarkering",
//                    "Tunnelmarkering", "Avstandsmarkering i tunnel",
//                    "Kantstolpe", "Trafikksylinder", "Fartsgrensemarkering"
//                ],
//                sectionName: "Markeringsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Tunnelmarkering",
//                description: "Viser tunnelens form og forløp, og hjelper føreren å holde seg i riktig posisjon i kjørebanen gjennom tunnelen.",
//                images: ["914_V", "914_H"],
//                wrongAnswers: [
//                    "Avstandsmarkering i tunnel", "Bakgrunnsmarkering", "Retningsmarkering",
//                    "Hindermarkering", "Avkjøringsmarkering",
//                    "Kantstolpe", "Trafikkjegle", "Vegarbeidsmarkering"
//                ],
//                sectionName: "Markeringsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Avstandsmarkering i tunnel",
//                description: "Markerer avstanden til tunnelåpningen. Skiltene er plassert med jevne mellomrom slik at føreren får et visuelt inntrykk av avstanden som gjenstår.",
//                images: ["916_0"],
//                wrongAnswers: [
//                    "Bakgrunnsmarkering", "Retningsmarkering",
//                    "Hindermarkering", "Avkjøringsmarkering",
//                    "Kantstolpe", "Trafikkjegle", "Fartsgrensemarkering"
//                ],
//                sectionName: "Markeringsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kantstolpe",
//                description: "Markerer veikanten og hjelper føreren med å se veibanens forløp, spesielt i mørke eller dårlig sikt. Kantstolper har refleksmarkeringer som varierer etter kjøreretning.",
//                images: ["920_VE", "920_H", "920_VM"],
//                wrongAnswers: [
//                    "Bakgrunnsmarkering", "Retningsmarkering", "Hindermarkering",
//                    "Tunnelmarkering", "Avkjøringsmarkering",
//                    "Avstandsmarkering i tunnel", "Trafikksylinder", "Vegarbeidsmarkering"
//                ],
//                sectionName: "Markeringsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Trafikkjegle",
//                description: "Kjegle som brukes midlertidig for å regulere trafikken ved for eksempel veiarbeid eller hindringer. Viser at trafikantene må holde seg innenfor oppmerket felt.",
//                images: ["940_0"],
//                wrongAnswers: [
//                    "Bakgrunnsmarkering", "Retningsmarkering",
//                    "Hindermarkering", "Tunnelmarkering", "Avkjøringsmarkering",
//                    "Avstandsmarkering i tunnel", "Kantstolpe", "Vegarbeidsmarkering"
//                ],
//                sectionName: "Markeringsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Trafikksylinder",
//                description: "Sylinder som brukes midlertidig for å regulere trafikk eller markere kjørefelt. Viser at trafikantene skal holde seg innenfor feltet som de er ledet inn i.",
//                images: ["942_0"],
//                wrongAnswers: [
//                    "Bakgrunnsmarkering", "Retningsmarkering",
//                    "Hindermarkering", "Tunnelmarkering", "Avkjøringsmarkering",
//                    "Avstandsmarkering i tunnel", "Kantstolpe", "Vegarbeidsmarkering"
//                ],
//                sectionName: "Markeringsskilt",
//                subSectionName: nil
//            )
//        ]
//    )
////    
//    static let vegvisningsskilt = TrafficSection(
//        name: "Vegvisningsskilt",
//        description: """
//Vegvisningsskilt er trafikkskilt som gir opplysninger om stedsnavn, virksomheter, vegruter, valg av kjørefelt, valg av veg og avstand til reisemål.
//
//Formålet med vegvisningen er å lede trafikantene fra start til reisemålet og fremme en sikker og effektiv trafikkavvikling. Den skal også differensiere vegnettet, gi trafikantene beskjed om hvor de er, og bekrefte at de er på rett veg.”
//
//Det brukes ulike farger på vegvisningsskiltene, for å gjøre det lettere å finne riktig vegvisning.
//""",
//        subSections: nil,
//        signs: [
//            TrafficSign(
//                title: "Tabellorienteringstavle",
//                description: "Forvarsler vegkryss eller avkjøringsveg og viser vegnummer og/eller reisemål i tabellform.",
//                images: ["701"],
//                wrongAnswers: [
//                    "Vanlig vegviser", "Stedsnavnskilt", "Vegviser for sykkelrute",
//                    "Vegnummer for europaveg", "Midlertidig omkjøring",
//                    "Omkjøring bestemte kjøretøy", "Portalvegviser",
//                    "Nasjonal turistveg", "Ringveg/ringrute"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Diagramorienteringstavle",
//                description: "Forvarsler vegkryss eller avkjøringsveg ved å vise et diagram over vegforløpet med vegnummer og/eller reisemål.",
//                images: ["703"],
//                wrongAnswers: [
//                    "Tabellvegviser", "Vegnummer for riksveg", "Kjørefeltvegviser",
//                    "Omkjøringsrute for store kjøretøy", "Samleskilt for vegvisning",
//                    "Avstandsskilt for sykkelrute", "Ringveg/ringrute",
//                    "Kryssnummer flerfeltsveg", "Vegviser for gangtrafikk"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Avkjøringstavle",
//                description: "Forvarsler avkjøringsveg og viser vegnummer og/eller reisemål for avkjøringen.",
//                images: ["705"],
//                wrongAnswers: [
//                    "Stedsnavnskilt", "Vegviser for gangtrafikk", "Vegnummer for fylkesveg",
//                    "Vanlig vegviser", "Kjørefeltorienteringstavle",
//                    "Samleskilt for vegvisning", "Midlertidig omkjøring",
//                    "Portalorienteringstavle", "Vegnummer for europaveg"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kjørefeltorienteringstavle",
//                description: "Viser antall kjørefelt fram mot kryss eller avkjøringsveg, og hvilke reisemål hvert kjørefelt leder til.",
//                images: ["707"],
//                wrongAnswers: [
//                    "Avkjøringstavle", "Portalvegviser", "Tabellorienteringstavle",
//                    "Vegnummer for europaveg", "Stedsnavnskilt",
//                    "Omkjøring bestemte kjøretøy", "Kryssnummer tofeltsveg",
//                    "Vegviser for sykkelrute", "Samleskilt for vegvisning"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Portalorienteringstavle",
//                description: "Viser hvilke kjøreretninger eller reisemål de ulike kjørefelt er beregnet for, montert over kjørebanen.",
//                images: ["709"],
//                wrongAnswers: [
//                    "Kjørefeltvegviser", "Tabellvegviser", "Vanlig vegviser",
//                    "Vegnummer for fylkesveg", "Ringveg/ringrute",
//                    "Omkjøring bestemte kjøretøy", "Midlertidig omkjøring",
//                    "Stedsnavnskilt", "Vegviser for sykkelrute"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Tabellvegviser",
//                description: "Viser vegnummer og/eller reisemål for de enkelte vegarmer i et kryss eller for en avkjøringsveg.",
//                images: ["711"],
//                wrongAnswers: [
//                    "Portalorienteringstavle", "Kjørefeltorienteringstavle",
//                    "Stedsnavnskilt", "Vegviser for sykkelrute",
//                    "Vegnummer for riksveg", "Samleskilt for vegvisning",
//                    "Vegviser for gangtrafikk", "Midlertidig omkjøring"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Vanlig vegviser",
//                description: "Viser vegnummer og/eller reisemål og peker ut retningen til reisemålet.",
//                images: ["713"],
//                wrongAnswers: [
//                    "Stedsnavnskilt", "Vegviser for sykkelrute",
//                    "Omkjøring bestemte kjøretøy", "Ringveg/ringrute",
//                    "Vegnummer for europaveg", "Samleskilt for vegvisning",
//                    "Midlertidig omkjøring", "Vegviser for gangtrafikk"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kjørefeltvegviser",
//                description: "Viser hvilke reisemål de ulike kjørefeltene fører til, plassert før et kryss eller avkjøring.",
//                images: ["717"],
//                wrongAnswers: [
//                    "Stedsnavnskilt", "Samleskilt for vegvisning",
//                    "Omkjøring bestemte kjøretøy", "Vegnummer for riksveg",
//                    "Ringveg/ringrute", "Vegviser for sykkelrute"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Portalvegviser",
//                description: "Viser hvilke reisemål de enkelte kjørefelt fører til, plassert over kjørefeltene ved selve krysset.",
//                images: ["719"],
//                wrongAnswers: [
//                    "Vegnummer for europaveg", "Ringveg/ringrute",
//                    "Stedsnavnskilt", "Omkjøring bestemte kjøretøy",
//                    "Midlertidig omkjøring", "Vegviser for sykkelrute"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Vegnummer for europaveg",
//                description: "Angir at vegen er en europaveg (E-veg). Skiltet brukes i kombinasjon med vegvisningsskilt.",
//                images: ["723_11", "723_12"],
//                wrongAnswers: [
//                    "Vegnummer for riksveg", "Vegnummer for fylkesveg", "Ringveg/ringrute",
//                    "Nasjonal turistveg", "Omkjøringsrute for store kjøretøy",
//                    "Rute for farlig gods", "Andre omkjøringsruter", "Kryssnummer flerfeltsveg", "Stedsnavnskilt"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Vegnummer for riksveg",
//                description: "Angir at vegen er en riksveg. Skiltet brukes som symbol sammen med vegvisningsskilt.",
//                images: ["723_13", "723_14"],
//                wrongAnswers: [
//                    "Vegnummer for europaveg", "Vegnummer for fylkesveg", "Ringveg/ringrute",
//                    "Nasjonal turistveg", "Omkjøringsrute for store kjøretøy",
//                    "Andre omkjøringsruter", "Kryssnummer tofeltsveg", "Gate-/vegnavnskilt", "Samleskilt for vegvisning"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Vegnummer for fylkesveg",
//                description: "Angir at vegen er en fylkesveg. Skiltet brukes sammen med vegvisning for å vise vegens nummer.",
//                images: ["723_15", "723_16"],
//                wrongAnswers: [
//                    "Vegnummer for europaveg", "Vegnummer for riksveg", "Ringveg/ringrute",
//                    "Nasjonal turistveg", "Andre omkjøringsruter",
//                    "Rute for farlig gods", "Stedsnavnskilt", "Gate-/vegnavnskilt", "Omkjøring bestemte kjøretøy"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Ringveg/ringrute",
//                description: "Angir at vegen er en ringveg eller ringrute rundt et tettsted.",
//                images: ["723_21", "723_22"],
//                wrongAnswers: [
//                    "Vegnummer for europaveg", "Vegnummer for riksveg", "Vegnummer for fylkesveg",
//                    "Nasjonal turistveg", "Andre omkjøringsruter",
//                    "Kryssnummer flerfeltsveg", "Samleskilt for vegvisning", "Midlertidig omkjøring", "Vegviser for sykkelrute"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Nasjonal turistveg",
//                description: "Angir at vegen er en nasjonal turistveg, spesielt utvalgt for naturopplevelser og vakre kjørestrekninger.",
//                images: ["723_31"],
//                wrongAnswers: [
//                    "Vegnummer for europaveg", "Vegnummer for fylkesveg", "Vegnummer for riksveg",
//                    "Ringveg/ringrute", "Andre omkjøringsruter",
//                    "Stedsnavnskilt", "Omkjøring bestemte kjøretøy", "Vegviser for gangtrafikk", "Samleskilt for vegvisning"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Omkjøringsrute for store kjøretøy",
//                description: "Angir en anbefalt omkjøringsrute for store kjøretøy som ikke kan benytte den ordinære vegen.",
//                images: ["723_41"],
//                wrongAnswers: [
//                    "Andre omkjøringsruter", "Rute for farlig gods", "Vegnummer for europaveg",
//                    "Vegnummer for riksveg", "Ringveg/ringrute",
//                    "Kryssnummer tofeltsveg", "Midlertidig omkjøring", "Stedsnavnskilt", "Samleskilt for vegvisning"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Rute for farlig gods",
//                description: "Angir vegstrekning som er tillatt eller anbefalt for transport av farlig gods.",
//                images: ["723_51"],
//                wrongAnswers: [
//                    "Omkjøringsrute for store kjøretøy", "Andre omkjøringsruter", "Vegnummer for europaveg",
//                    "Vegnummer for fylkesveg", "Ringveg/ringrute",
//                    "Kryssnummer flerfeltsveg", "Midlertidig omkjøring", "Stedsnavnskilt", "Vegviser for sykkelrute"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Andre omkjøringsruter",
//                description: "Angir andre faste omkjøringsruter, for eksempel ved stenging av hovedveg.",
//                images: ["723_61","723_62","723_63","723_64","723_65","723_66"],
//                wrongAnswers: [
//                    "Omkjøringsrute for store kjøretøy", "Rute for farlig gods", "Midlertidig omkjøring",
//                    "Vegnummer for europaveg", "Vegnummer for fylkesveg",
//                    "Ringveg/ringrute", "Kryssnummer tofeltsveg", "Vegviser for gangtrafikk", "Stedsnavnskilt"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kryssnummer",
//                description: "Brukes på motorveg, flerfeltsveg eller tofeltsveg for å angi nummer på krysset eller avkjøringen.",
//                images: ["723_71","723_72","723_73"],
//                wrongAnswers: [
//                    "Vegnummer for europaveg", "Vegnummer for riksveg", "Vegnummer for fylkesveg",
//                    "Ringveg/ringrute", "Samleskilt for vegvisning",
//                    "Stedsnavnskilt", "Gate-/vegnavnskilt", "Vegviser for gangtrafikk",
//                    "Midlertidig omkjøring", "Omkjøring bestemte kjøretøy"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Stedsnavnskilt",
//                description: "Angir navn på tettsted, by eller bydel som man kjører inn i.",
//                images: ["727"],
//                wrongAnswers: [
//                    "Gate-/vegnavnskilt", "Samleskilt for vegvisning", "Vegnummer for europaveg",
//                    "Vegnummer for riksveg", "Vegnummer for fylkesveg",
//                    "Ringveg/ringrute", "Vegviser for sykkelrute", "Vegviser for gangtrafikk", "Omkjøring bestemte kjøretøy"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Gate-/vegnavnskilt",
//                description: "Viser navnet på gate eller veg, vanligvis plassert i starten av vegen.",
//                images: ["729"],
//                wrongAnswers: [
//                    "Stedsnavnskilt", "Samleskilt for vegvisning", "Vegnummer for europaveg",
//                    "Vegnummer for riksveg", "Vegnummer for fylkesveg",
//                    "Ringveg/ringrute", "Midlertidig omkjøring", "Vegviser for gangtrafikk", "Vegviser for sykkelrute"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Samleskilt for vegvisning",
//                description: "Samler flere vegvisningsopplysninger på ett skilt for bedre oversikt.",
//                images: ["731"],
//                wrongAnswers: [
//                    "Tabellvegviser", "Vanlig vegviser", "Tabellorienteringstavle",
//                    "Avkjøringstavle", "Portalorienteringstavle",
//                    "Kjørefeltvegviser", "Vegviser for gangtrafikk", "Vegviser for sykkelrute", "Stedsnavnskilt"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Omkjøring bestemte kjøretøy",
//                description: "Viser omkjøringsrute for bestemte typer kjøretøy, for eksempel tungtransport.",
//                images: ["741"],
//                wrongAnswers: [
//                    "Midlertidig omkjøring", "Slutt på midlertidig omkjøring", "Omkjøringsrute for store kjøretøy",
//                    "Andre omkjøringsruter", "Vegnummer for fylkesveg",
//                    "Vegnummer for riksveg", "Stedsnavnskilt", "Samleskilt for vegvisning", "Vegviser for gangtrafikk"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Midlertidig omkjøring",
//                description: "Angir midlertidig omkjøringsrute ved stenging eller arbeid på vegen.",
//                images: ["743_1", "743_2"],
//                wrongAnswers: [
//                    "Slutt på midlertidig omkjøring", "Omkjøring bestemte kjøretøy", "Andre omkjøringsruter",
//                    "Omkjøringsrute for store kjøretøy", "Vegnummer for europaveg",
//                    "Ringveg/ringrute", "Samleskilt for vegvisning", "Stedsnavnskilt", "Vegviser for sykkelrute"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Slutt på midlertidig omkjøring",
//                description: "Markerer slutten på en midlertidig omkjøringsrute.",
//                images: ["745_0"],
//                wrongAnswers: [
//                    "Midlertidig omkjøring", "Omkjøring bestemte kjøretøy", "Andre omkjøringsruter",
//                    "Omkjøringsrute for store kjøretøy", "Vegnummer for riksveg",
//                    "Vegnummer for fylkesveg", "Stedsnavnskilt", "Samleskilt for vegvisning", "Vegviser for gangtrafikk"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Vegviser for gangtrafikk",
//                description: "Viser retning og eventuelt avstand til reisemål for fotgjengere.",
//                images: ["749"],
//                wrongAnswers: [
//                    "Vegviser for sykkelrute",
//                    "Tabellvegviser for sykkelrute", "Sykkelruteskilt",
//                    "Avstandsskilt for sykkelrute", "Stedsnavnskilt",
//                    "Gate-/vegnavnskilt", "Samleskilt for vegvisning",
//                    "Vanlig vegviser", "Vegnummer for fylkesveg"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Vegviser for sykkelrute",
//                description: "Viser retning og eventuelt avstand til reisemål for syklister.",
//                images: ["751"],
//                wrongAnswers: [
//                    "Tabellvegviser for sykkelrute", "Sykkelruteskilt", "Avstandsskilt for sykkelrute",
//                    "Vegviser for gangtrafikk", "Stedsnavnskilt",
//                    "Samleskilt for vegvisning", "Midlertidig omkjøring",
//                    "Vanlig vegviser", "Kryssnummer tofeltsveg"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Tabellvegviser for sykkelrute",
//                description: "Viser flere reisemål og avstander for sykkelruter i tabellform.",
//                images: ["753"],
//                wrongAnswers: [
//                    "Vegviser for sykkelrute", "Sykkelruteskilt", "Avstandsskilt for sykkelrute",
//                    "Vegviser for gangtrafikk", "Stedsnavnskilt",
//                    "Samleskilt for vegvisning", "Midlertidig omkjøring",
//                    "Omkjøring bestemte kjøretøy", "Gate-/vegnavnskilt"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Sykkelruteskilt",
//                description: "Viser nummer eller navn på en skiltet sykkelrute.",
//                images: ["755"],
//                wrongAnswers: [
//                    "Vegviser for sykkelrute", "Tabellvegviser for sykkelrute",
//                    "Avstandsskilt for sykkelrute", "Vegviser for gangtrafikk",
//                    "Stedsnavnskilt", "Samleskilt for vegvisning",
//                    "Midlertidig omkjøring", "Vanlig vegviser", "Vegnummer for fylkesveg"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Avstandsskilt for sykkelrute",
//                description: "Angir avstand til reisemål på en skiltet sykkelrute.",
//                images: ["757"],
//                wrongAnswers: [
//                    "Sykkelruteskilt", "Vegviser for sykkelrute",
//                    "Tabellvegviser for sykkelrute", "Vegviser for gangtrafikk",
//                    "Stedsnavnskilt", "Samleskilt for vegvisning",
//                    "Midlertidig omkjøring", "Omkjøring bestemte kjøretøy", "Vanlig vegviser"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Motorveg symbol",
//                description: "Viser at vegen er motorveg eller leder til motorveg.",
//                images: ["761_0"],
//                wrongAnswers: [
//                    "Motortrafikkveg symbol", "Bomveg symbol", "Parkering symbol",
//                    "Parkeringshus symbol", "Lufthavn/flyplass symbol",
//                    "Helikopterplass symbol", "Busstasjon symbol",
//                    "Jernbanestasjon symbol", "Bilferje symbol"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Motortrafikkveg symbol",
//                description: "Viser at vegen er motortrafikkveg eller leder til en motortrafikkveg.",
//                images: ["763_0"],
//                wrongAnswers: [
//                    "Motorveg symbol", "Bomveg symbol", "Parkering symbol",
//                    "Parkeringshus symbol", "Lufthavn/flyplass symbol",
//                    "Helikopterplass symbol", "Busstasjon symbol",
//                    "Jernbanestasjon symbol", "Godshavn symbol"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Bomveg symbol",
//                description: "Angir at vegen er bompengeveg eller leder til en bomstasjon.",
//                images: ["765_0"],
//                wrongAnswers: [
//                    "Motortrafikkveg symbol", "Motorveg symbol", "Parkering symbol",
//                    "Parkeringshus symbol", "Lufthavn/flyplass symbol",
//                    "Helikopterplass symbol", "Busstasjon symbol",
//                    "Jernbanestasjon symbol", "Bilferje symbol"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Parkering symbol",
//                description: "Viser at vegen leder til parkeringsplass.",
//                images: ["767_0"],
//                wrongAnswers: [
//                    "Parkeringshus symbol", "Motortrafikkveg symbol", "Motorveg symbol",
//                    "Bomveg symbol", "Lufthavn/flyplass symbol",
//                    "Helikopterplass symbol", "Busstasjon symbol",
//                    "Jernbanestasjon symbol", "Godshavn symbol"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Parkeringshus symbol",
//                description: "Viser at vegen leder til parkeringshus.",
//                images: ["769_0"],
//                wrongAnswers: [
//                    "Parkering symbol", "Motortrafikkveg symbol", "Motorveg symbol",
//                    "Bomveg symbol", "Lufthavn/flyplass symbol",
//                    "Helikopterplass symbol", "Busstasjon symbol",
//                    "Jernbanestasjon symbol", "Bilferje symbol"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Lufthavn symbol",
//                description: "Viser at vegen leder til lufthavn eller flyplass.",
//                images: ["771_0"],
//                wrongAnswers: [
//                    "Helikopterplass symbol", "Motortrafikkveg symbol", "Motorveg symbol",
//                    "Bomveg symbol", "Parkering symbol", "Parkeringshus symbol",
//                    "Busstasjon symbol", "Jernbanestasjon symbol", "Godshavn symbol"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Helikopterplass symbol",
//                description: "Viser at vegen leder til helikopterplass.",
//                images: ["772_0"],
//                wrongAnswers: [
//                    "Lufthavn/flyplass symbol", "Motortrafikkveg symbol", "Motorveg symbol",
//                    "Bomveg symbol", "Parkering symbol", "Parkeringshus symbol",
//                    "Busstasjon symbol", "Jernbanestasjon symbol", "Bilferje symbol"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Busstasjon symbol",
//                description: "Viser at vegen leder til busstasjon eller bussterminal.",
//                images: ["773_0"],
//                wrongAnswers: [
//                    "Jernbanestasjon symbol", "Motortrafikkveg symbol", "Motorveg symbol",
//                    "Bomveg symbol", "Parkering symbol", "Parkeringshus symbol",
//                    "Lufthavn/flyplass symbol", "Helikopterplass symbol", "Godshavn symbol"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Jernbanestasjon symbol",
//                description: "Viser at vegen leder til jernbanestasjon.",
//                images: ["774_0"],
//                wrongAnswers: [
//                    "Busstasjon symbol", "Motortrafikkveg symbol", "Motorveg symbol",
//                    "Bomveg symbol", "Parkering symbol", "Parkeringshus symbol",
//                    "Lufthavn/flyplass symbol", "Helikopterplass symbol", "Bilferje symbol"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Bilferje symbol",
//                description: "Viser at vegen leder til ferjeleie for bilferje.",
//                images: ["775_0"],
//                wrongAnswers: [
//                    "Godshavn symbol", "Motortrafikkveg symbol", "Motorveg symbol",
//                    "Bomveg symbol", "Parkering symbol", "Parkeringshus symbol",
//                    "Lufthavn/flyplass symbol", "Helikopterplass symbol", "Busstasjon symbol"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Godshavn symbol",
//                description: "Viser at vegen leder til godshavn eller lasteområde for skipstrafikk.",
//                images: ["776"],
//                wrongAnswers: [
//                    "Bilferje symbol", "Motortrafikkveg symbol", "Motorveg symbol",
//                    "Bomveg symbol", "Parkering symbol", "Parkeringshus symbol",
//                    "Lufthavn/flyplass symbol", "Helikopterplass symbol", "Jernbanestasjon symbol"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kjetting symbol",
//                description: "Viser at vegen leder til sted hvor kjetting kan legges på eller tas av kjøretøy.",
//                images: ["780"],
//                wrongAnswers: [
//                    "Motorveg symbol", "Motortrafikkveg symbol", "Bomveg symbol",
//                    "Parkering symbol", "Parkeringshus symbol", "Busstasjon symbol",
//                    "Jernbanestasjon symbol", "Bilferje symbol", "Godshavn symbol"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kirke",
//                description: "Viser at vegen leder til kirke eller religiøst bygg.",
//                images: ["790_10"],
//                wrongAnswers: [
//                    "Næringsområde", "Kjøpesenter", "Svømmehall",
//                    "Alpinanlegg", "Hoppbakke", "Skistadion",
//                    "Golfbane", "Betalingsmåte", "Helautomatisk bomstasjon"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Næringsområde",
//                description: "Viser at vegen leder til næringsområde med bedrifter eller industri.",
//                images: ["790_15"],
//                wrongAnswers: [
//                    "Kirke", "Kjøpesenter", "Svømmehall",
//                    "Alpinanlegg", "Hoppbakke", "Skistadion",
//                    "Golfbane", "Betalingsmåte", "Helautomatisk bomstasjon"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Kjøpesenter",
//                description: "Viser at vegen leder til kjøpesenter eller større handelsområde.",
//                images: ["790_16"],
//                wrongAnswers: [
//                    "Næringsområde", "Kirke", "Svømmehall",
//                    "Alpinanlegg", "Hoppbakke", "Skistadion",
//                    "Golfbane", "Betalingsmåte", "Helautomatisk bomstasjon"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Svømmehall",
//                description: "Viser at vegen leder til svømmehall eller badeanlegg.",
//                images: ["790_20"],
//                wrongAnswers: [
//                    "Kirke", "Næringsområde", "Kjøpesenter",
//                    "Alpinanlegg", "Hoppbakke", "Skistadion",
//                    "Golfbane", "Betalingsmåte", "Helautomatisk bomstasjon"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Alpinanlegg",
//                description: "Viser at vegen leder til alpinanlegg eller skiheis.",
//                images: ["790_30"],
//                wrongAnswers: [
//                    "Kirke", "Næringsområde", "Kjøpesenter",
//                    "Svømmehall", "Hoppbakke", "Skistadion",
//                    "Golfbane", "Betalingsmåte", "Helautomatisk bomstasjon"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Hoppbakke",
//                description: "Viser at vegen leder til hoppbakke eller skianlegg.",
//                images: ["790_31"],
//                wrongAnswers: [
//                    "Kirke", "Næringsområde", "Kjøpesenter",
//                    "Svømmehall", "Alpinanlegg", "Skistadion",
//                    "Golfbane", "Betalingsmåte", "Helautomatisk bomstasjon"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Skistadion",
//                description: "Viser at vegen leder til skistadion eller treningsområde for ski.",
//                images: ["790_32"],
//                wrongAnswers: [
//                    "Kirke", "Næringsområde", "Kjøpesenter",
//                    "Svømmehall", "Alpinanlegg", "Hoppbakke",
//                    "Golfbane", "Betalingsmåte", "Helautomatisk bomstasjon"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Golfbane",
//                description: "Viser at vegen leder til golfbane eller golfanlegg.",
//                images: ["790_40"],
//                wrongAnswers: [
//                    "Kirke", "Næringsområde", "Kjøpesenter",
//                    "Svømmehall", "Alpinanlegg", "Hoppbakke",
//                    "Skistadion", "Betalingsmåte", "Helautomatisk bomstasjon"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Betalingsmåte",
//                description: "Viser hvilke betalingsmåter som aksepteres ved bomstasjon eller parkering.",
//                images: ["792_11","792_12","792_13","792_14","792_15","792_16","792_17"],
//                wrongAnswers: [
//                    "Helautomatisk bomstasjon", "Motorveg symbol", "Bomveg symbol",
//                    "Parkering symbol", "Parkeringshus symbol", "Kjetting symbol",
//                    "Kirke", "Næringsområde", "Kjøpesenter"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            ),
//            TrafficSign(
//                title: "Helautomatisk bomstasjon",
//                description: "Viser at bomstasjonen er helautomatisk og at passering registreres uten stopp.",
//                images: ["792_30"],
//                wrongAnswers: [
//                    "Betalingsmåte", "Motorveg symbol", "Bomveg symbol",
//                    "Parkering symbol", "Parkeringshus symbol", "Kjetting symbol",
//                    "Kirke", "Næringsområde", "Kjøpesenter"
//                ],
//                sectionName: "Vegvisningsskilt",
//                subSectionName: nil
//            )
//        ]
//    )
//    
//            
//
//    // MARK: - All Sections
//    
//    static let all: [TrafficSection] = [
//        fareskilt,
//        vikeplikt,
//        forbudsskilt,
//        paabudsskilt,
//        opplysningsskilt,
//        serviceskilt,
//        markeringsskilt,
//        underskilt,
//        vegvisningsskilt
//    ]
//}


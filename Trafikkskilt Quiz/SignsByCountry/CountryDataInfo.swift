////
////  CountryData.swift
////  Trafikkskilt Quiz
////
////  Created by Thomas Frank on 5/10/25.
////
//
//import Foundation
//
//struct CountryDataInfo {
//    static let all: [CountryInfo] = [norway, spain]
//    
//    static let norway = CountryInfo(
//        country: .norway,
//        generalInformation: """
//Trafikkskilt er en sentral del av det norske vei- og trafikksystemet. De informerer, varsler, leder og styrer trafikanter for å sikre trygg og effektiv trafikkavvikling. Skiltingen i Norge følger både internasjonale avtaler og nasjonalt regelverk, der vegtrafikkloven og skiltforskriften fastsatt av Samferdselsdepartementet danner det juridiske grunnlaget. Skiltforskriften, som ble vedtatt i 2005, beskriver hvordan trafikkskilt skal se ut, hva de betyr, og hvem som har myndighet til å sette dem opp.
//
//I Norge deles trafikkskiltene inn i flere hovedgrupper: fareskilt, vikeplikt- og forkjørsskilt, forbudsskilt, påbudsskilt, opplysningsskilt, serviceskilt, vegvisningsskilt, underskilt, markeringsskilt og skilt med trafikksikkerhetsinformasjon. I tillegg finnes det variable trafikkskilt som kan endre budskap etter trafikkforholdene – en viktig del av dagens intelligente transportsystemer (ITS).
//
//Historisk sett har Norge hatt en gradvis utvikling av trafikkskiltregelverket, med forskrifter som strekker seg helt tilbake til 1930-tallet. Den nåværende forskriften fra 2005 bygger på erfaringer fra tidligere generasjoner og internasjonale konvensjoner om trafikkskilt og signaler. Samlet sett utgjør dette et moderne og helhetlig system som gjør det enkelt for trafikanter å forstå og følge regler på tvers av landegrenser.
//""",
//        speedLimits: [
//            SpeedLimit(roadType: "Innenfor tettbygd strøk", limit: 50, unit: "km/t", icon: "building.2.fill"),
//            SpeedLimit(roadType: "Utenfor tettbygd strøk", limit: 80, unit: "km/t", icon: "leaf.fill"),
//            SpeedLimit(roadType: "Motorvei", limit: 110, unit: "km/t", icon: "car.rear.waves.up.fill")
//        ],
//        drivingSide: .right,
//        alcoholLimit: 0.2,
//        alcoholUnit: .permille,
//        emergencyNumber: "112",
//        commonRules: [
//            "Kjørelys skal være på hele døgnet – både dag og natt.",
//            "Bilbelte er påbudt for alle passasjerer.",
//            "Bruk av håndholdt mobiltelefon under kjøring er forbudt.",
//            "Barn under 135 cm skal bruke godkjent barnesete eller beltestol.",
//            "Varseltrekant skal alltid være med i bilen."
//        ],
//        specialRegulations: [
//            "Vinterdekk er påbudt fra 1. november til første søndag etter påske, eller fra 15. oktober til 1. mai i Nord-Norge.",
//            "Piggdekk er tillatt i samme periode, men det kan kreves piggdekkavgift i byer som Oslo og Bergen.",
//            "Fartsbøter er høye og kan føre til umiddelbart førerkortbeslag.",
//            "Elg, hjort og rein forekommer ofte langs veien – vær oppmerksom på fareskilt, spesielt i skumringen.",
//            "Elbiler kan bruke kollektivfelt i enkelte byer, men lokale regler kan variere."
//        ]
//    )
//    
//    static let spain = CountryInfo(
//        country: .spain,
//        generalInformation: "España cuenta con una extensa red de carreteras, autovías y autopistas bien señalizadas. La DGT regula la normativa de tráfico y aplica sanciones estrictas por exceso de velocidad o conducción bajo los efectos del alcohol.",
//
//        drivingSide: .right,
//        alcoholLimit: 0.5,
//        alcoholUnit: .permille, // España mide en gramos por litro (equivalente a ‰)
//        emergencyNumber: "112",
//        commonRules: [
//            "El cinturón de seguridad es obligatorio para todos los ocupantes.",
//            "Está prohibido el uso de teléfonos móviles en la mano mientras se conduce.",
//            "Es obligatorio utilizar los faros en condiciones de poca visibilidad.",
//            "Los niños menores de 135 cm deben usar un sistema de retención infantil homologado.",
//            "Debe llevarse un triángulo de emergencia y un chaleco reflectante en el vehículo."
//        ],
//        specialRegulations: [
//            "El límite legal de alcohol es 0,5 g/l para conductores particulares y 0,3 g/l para profesionales y noveles (pendiente de reforma a 0,2 g/l para todos).",
//            "El uso de neumáticos de invierno no es obligatorio, pero sí recomendable en zonas de montaña.",
//            "Algunas autopistas y autovías son de peaje; las tarifas varían según la ruta.",
//            "Las sanciones por exceso de velocidad o conducción bajo los efectos del alcohol son severas.",
//            "Es obligatorio respetar las zonas de bajas emisiones (ZBE) en grandes ciudades como Madrid y Barcelona."
//        ]
//    )
//}

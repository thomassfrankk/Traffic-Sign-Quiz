//
//  Models.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 12/10/25.
//

import Foundation

enum Language: String, CaseIterable, Codable, Identifiable {
    
    // Full supported languages
    case vietnamese = "vi-VN"
    case portugueseBrazil = "pt-BR"
    case ukrainian = "uk-UA"
    case italian = "it-IT"
    case chineseTraditional = "zh-TW"
    case korean = "ko-KR"
    case englishGB = "en-GB"
    case german = "de-DE"
    case chineseSimplified = "zh-CN"
    case japanese = "ja-JP"
    case indonesian = "id-ID"
    case dutch = "nl-NL"
    case french = "fr-FR"
    case thai = "th-TH"
    case spanish = "es-ES"
    case turkish = "tr-TR"
    case polish = "pl-PL"
    case arabic = "ar-AE"
    case russian = "ru-RU"
    case englishUS = "en-US"
    case hindi = "hi-IN"
    
    // Limited supported languages
    case norwegian = "nb-NO"
    
    var id: String { rawValue }
    
    var logoName: String {
        switch self {
        case .norwegian:
            return "LogoNorwegian"
        case .spanish:
            return "LogoSpanish"
        case .french:
            return "LogoFrench"
        case .arabic:
            return "LogoArabic"
        case .chineseSimplified:
            return "LogoChineseSimplified"
        case .chineseTraditional:
            return "LogoChineseTraditional"
        case .dutch:
            return "LogoDutch"
        case .german:
            return "LogoGerman"
        case .hindi:
            return "LogoHindi"
        case .indonesian:
            return "LogoIndonesian"
        case .italian:
            return "LogoItalian"
        case .japanese:
            return "LogoJapanese"
        case .korean:
            return "LogoKorean"
        case .polish:
            return "LogoPolish"
        case .portugueseBrazil:
            return "LogoBrazilianPortuguese"
        case .russian:
            return "LogoRussian"
        case .thai:
            return "LogoThai"
        case .turkish:
            return "LogoTurkish"
        case .ukrainian:
            return "LogoUkrainian"
        case .vietnamese:
            return "LogoVietnamese"
            
            // Default fallback
        default:
            return "LogoEnglish"
        }
    }
    
    /// Extracts base language only → "nb", "es", "en", etc.
    var languageCode: String {
        String(rawValue.prefix(2))
    }
    
    // MARK: - User Friendly Description
    var displayName: String {
        switch self {
        case .englishGB, .englishUS:
            return "English"
        case .vietnamese: return "Vietnamese"
        case .portugueseBrazil: return "Portuguese (Brazil)"
        case .ukrainian: return "Ukrainian"
        case .italian: return "Italian"
        case .chineseTraditional: return "Chinese (Traditional)"
        case .korean: return "Korean"
        case .german: return "German"
        case .chineseSimplified: return "Chinese (Simplified)"
        case .japanese: return "Japanese"
        case .indonesian: return "Indonesian"
        case .dutch: return "Dutch"
        case .french: return "French"
        case .thai: return "Thai"
        case .spanish: return "Spanish"
        case .turkish: return "Turkish"
        case .polish: return "Polish"
        case .arabic: return "Arabic"
        case .russian: return "Russian"
        case .hindi: return "Hindi"
        case .norwegian: return "Norwegian"
        }
    }
    
    // MARK: - Language Support Level
    var isFullySupported: Bool {
        switch self {
        case .norwegian:
            return false
        default:
            return true
        }
    }
    
    var isLimitedSupport: Bool {
        !isFullySupported
    }
}

// MARK: - Enums (Type-safe, use throughout your app)
enum Country: String, CaseIterable, Identifiable, Codable {
    case andorra = "Andorra"
    case austria = "Austria"
    case australia = "Australia"
    case bahamas = "Bahamas"
    case barbados = "Barbados"
    case belgium = "Belgium"
    case belize = "Belize"
    case botswana = "Botswana"
    case brunei = "Brunei"
    case bulgaria = "Bulgaria"
    case canada = "Canada"
    case croatia = "Croatia"
    case cyprus = "Cyprus"
    case czechRepublic = "Czech Republic"
    case denmark = "Denmark"
    case dominica = "Dominica"
    case estonia = "Estonia"
    case fiji = "Fiji"
    case finland = "Finland"
    case france = "France"
    case gambia = "Gambia"
    case germany = "Germany"
    case ghana = "Ghana"
    case greece = "Greece"
    case grenada = "Grenada"
    case guyana = "Guyana"
    case hungary = "Hungary"
    case iceland = "Iceland"
    case india = "India"
    case ireland = "Ireland"
    case italy = "Italy"
    case jamaica = "Jamaica"
    case japan = "Japan"
    case kenya = "Kenya"
    case latvia = "Latvia"
    case lesotho = "Lesotho"
    case liberia = "Liberia"
    case liechtenstein = "Liechtenstein"
    case lithuania = "Lithuania"
    case luxembourg = "Luxembourg"
    case malta = "Malta"
    case malaysia = "Malaysia"
    case mauritius = "Mauritius"
    case monaco = "Monaco"
    case namibia = "Namibia"
    case netherlands = "Netherlands"
    case newZealand = "New Zealand"
    case nigeria = "Nigeria"
    case norway = "Norway"
    case pakistan = "Pakistan"
    case papuaNewGuinea = "Papua New Guinea"
    case philippines = "Philippines"
    case poland = "Poland"
    case portugal = "Portugal"
    case romania = "Romania"
    case rwanda = "Rwanda"
    case saintLucia = "Saint Lucia"
    case sanMarino = "San Marino"
    case seychelles = "Seychelles"
    case sierraLeone = "Sierra Leone"
    case singapore = "Singapore"
    case slovakia = "Slovakia"
    case slovenia = "Slovenia"
    case southAfrica = "South Africa"
    case southKorea = "South Korea"
    case spain = "Spain"
    case sriLanka = "Sri Lanka"
    case sweden = "Sweden"
    case switzerland = "Switzerland"
    case tanzania = "Tanzania"
    case thailand = "Thailand"
    case trinidadAndTobago = "Trinidad and Tobago"
    case uganda = "Uganda"
    case uk = "United Kingdom"
    case ukraine = "Ukraine"
    case usa = "United States"
    case vaticanCity = "Vatican City"
    case zambia = "Zambia"
    case zimbabwe = "Zimbabwe"
    
    var id: String { rawValue }
    
    var supportedLanguages: [Language] {
        switch self {
        case .norway:
            return [.norwegian, .englishGB]
        case .spain:
            return [.spanish]
        case .usa:
            return [.englishUS]
        default:
            return [.englishGB]
        }
    }
    
    func supports(_ language: Language) -> Bool {
        if language.isFullySupported { return true }
        return supportedLanguages.contains(language)
    }
    
    var flag: String {
        switch self {
        case .andorra: return "🇦🇩"
        case .australia: return "🇦🇺"
        case .austria: return "🇦🇹"
        case .bahamas: return "🇧🇸"
        case .barbados: return "🇧🇧"
        case .belgium: return "🇧🇪"
        case .belize: return "🇧🇿"
        case .botswana: return "🇧🇼"
        case .brunei: return "🇧🇳"
        case .bulgaria: return "🇧🇬"
        case .canada: return "🇨🇦"
        case .croatia: return "🇭🇷"
        case .cyprus: return "🇨🇾"
        case .czechRepublic: return "🇨🇿"
        case .denmark: return "🇩🇰"
        case .dominica: return "🇩🇲"
        case .estonia: return "🇪🇪"
        case .fiji: return "🇫🇯"
        case .finland: return "🇫🇮"
        case .france: return "🇫🇷"
        case .gambia: return "🇬🇲"
        case .germany: return "🇩🇪"
        case .ghana: return "🇬🇭"
        case .greece: return "🇬🇷"
        case .grenada: return "🇬🇩"
        case .guyana: return "🇬🇾"
        case .hungary: return "🇭🇺"
        case .iceland: return "🇮🇸"
        case .india: return "🇮🇳"
        case .ireland: return "🇮🇪"
        case .italy: return "🇮🇹"
        case .jamaica: return "🇯🇲"
        case .japan: return "🇯🇵"
        case .kenya: return "🇰🇪"
        case .latvia: return "🇱🇻"
        case .lesotho: return "🇱🇸"
        case .liberia: return "🇱🇷"
        case .liechtenstein: return "🇱🇮"
        case .lithuania: return "🇱🇹"
        case .luxembourg: return "🇱🇺"
        case .malaysia: return "🇲🇾"
        case .malta: return "🇲🇹"
        case .mauritius: return "🇲🇺"
        case .monaco: return "🇲🇨"
        case .namibia: return "🇳🇦"
        case .netherlands: return "🇳🇱"
        case .newZealand: return "🇳🇿"
        case .nigeria: return "🇳🇬"
        case .norway: return "🇳🇴"
        case .pakistan: return "🇵🇰"
        case .papuaNewGuinea: return "🇵🇬"
        case .philippines: return "🇵🇭"
        case .poland: return "🇵🇱"
        case .portugal: return "🇵🇹"
        case .romania: return "🇷🇴"
        case .rwanda: return "🇷🇼"
        case .saintLucia: return "🇱🇨"
        case .sanMarino: return "🇸🇲"
        case .seychelles: return "🇸🇨"
        case .sierraLeone: return "🇸🇱"
        case .singapore: return "🇸🇬"
        case .slovakia: return "🇸🇰"
        case .slovenia: return "🇸🇮"
        case .southAfrica: return "🇿🇦"
        case .southKorea: return "🇰🇷"
        case .spain: return "🇪🇸"
        case .sriLanka: return "🇱🇰"
        case .sweden: return "🇸🇪"
        case .switzerland: return "🇨🇭"
        case .tanzania: return "🇹🇿"
        case .thailand: return "🇹🇭"
        case .trinidadAndTobago: return "🇹🇹"
        case .uganda: return "🇺🇬"
        case .uk: return "🇬🇧"
        case .ukraine: return "🇺🇦"
        case .usa: return "🇺🇸"
        case .vaticanCity: return "🇻🇦"
        case .zambia: return "🇿🇲"
        case .zimbabwe: return "🇿🇼"
        }
    }
    
    var localizedName: String {
        switch self {
        case .andorra: return "Andorra"
        case .australia: return "Australia" // Official English
        case .austria: return "Österreich"
        case .bahamas: return "Bahamas" // Official English
        case .barbados: return "Barbados" // Official English
        case .belgium: return "België"
        case .belize: return "Belize" // Official English
        case .botswana: return "Botswana" // Official English
        case .brunei: return "Brunei" // Official English
        case .bulgaria: return "България"
        case .canada: return "Canada" // Official English & French
        case .croatia: return "Hrvatska"
        case .cyprus: return "Κύπρος" // Secondary English
        case .czechRepublic: return "Česko"
        case .denmark: return "Danmark"
        case .dominica: return "Dominica" // Official English
        case .estonia: return "Eesti"
        case .fiji: return "Fiji" // Official English
        case .finland: return "Suomi"
        case .france: return "France"
        case .gambia: return "Gambia" // Official English
        case .germany: return "Deutschland"
        case .ghana: return "Ghana" // Official English
        case .greece: return "Ελλάδα"
        case .grenada: return "Grenada" // Official English
        case .guyana: return "Guyana" // Official English
        case .hungary: return "Magyarország"
        case .iceland: return "Ísland"
        case .india: return "India" // Official English
        case .ireland: return "Ireland" // Official English
        case .italy: return "Italia"
        case .jamaica: return "Jamaica" // Official English
        case .japan: return "日本"
        case .kenya: return "Kenya" // Official English
        case .latvia: return "Latvija"
        case .lesotho: return "Lesotho" // Official English
        case .liberia: return "Liberia" // Official English
        case .liechtenstein: return "Liechtenstein"
        case .lithuania: return "Lietuva"
        case .luxembourg: return "Luxembourg"
        case .malaysia: return "Malaysia" // Official English
        case .malta: return "Malta" // Official English
        case .mauritius: return "Mauritius" // Official English
        case .monaco: return "Monaco"
        case .namibia: return "Namibia" // Official English
        case .netherlands: return "Nederland"
        case .newZealand: return "New Zealand" // Official English
        case .nigeria: return "Nigeria" // Official English
        case .norway: return "Norge"
        case .pakistan: return "Pakistan" // Secondary English
        case .papuaNewGuinea: return "Papua New Guinea" // Official English
        case .philippines: return "Philippines" // Official English
        case .poland: return "Polska"
        case .portugal: return "Portugal"
        case .romania: return "România"
        case .rwanda: return "Rwanda" // Official English
        case .saintLucia: return "Saint Lucia" // Official English
        case .sanMarino: return "San Marino"
        case .seychelles: return "Seychelles" // Official English
        case .sierraLeone: return "Sierra Leone" // Official English
        case .singapore: return "Singapore" // Official English
        case .slovakia: return "Slovensko"
        case .slovenia: return "Slovenija"
        case .southAfrica: return "South Africa" // Official English
        case .southKorea: return "대한민국"
        case .spain: return "España"
        case .sriLanka: return "Sri Lanka" // Official English
        case .sweden: return "Sverige"
        case .switzerland: return "Schweiz"
        case .tanzania: return "Tanzania" // Official English
        case .thailand: return "ประเทศไทย"
        case .trinidadAndTobago: return "Trinidad and Tobago" // Official English
        case .uganda: return "Uganda" // Official English
        case .uk: return "United Kingdom" // Official English
        case .ukraine: return "Україна"
        case .usa: return "United States" // Official English
        case .vaticanCity: return "Città del Vaticano"
        case .zambia: return "Zambia" // Official English
        case .zimbabwe: return "Zimbabwe" // Official English
        }
    }
    
    var countryCode: String {
        switch self {
        case .andorra: return "AD"
        case .austria: return "AT"
        case .australia: return "AU"
        case .bahamas: return "BS"
        case .barbados: return "BB"
        case .belgium: return "BE"
        case .belize: return "BZ"
        case .botswana: return "BW"
        case .brunei: return "BN"
        case .bulgaria: return "BG"
        case .canada: return "CA"
        case .croatia: return "HR"
        case .cyprus: return "CY"
        case .czechRepublic: return "CZ"
        case .denmark: return "DK"
        case .dominica: return "DM"
        case .estonia: return "EE"
        case .fiji: return "FJ"
        case .finland: return "FI"
        case .france: return "FR"
        case .gambia: return "GM"
        case .germany: return "DE"
        case .ghana: return "GH"
        case .greece: return "GR"
        case .grenada: return "GD"
        case .guyana: return "GY"
        case .hungary: return "HU"
        case .iceland: return "IS"
        case .india: return "IN"
        case .ireland: return "IE"
        case .italy: return "IT"
        case .jamaica: return "JM"
        case .japan: return "JP"
        case .kenya: return "KE"
        case .latvia: return "LV"
        case .lesotho: return "LS"
        case .liberia: return "LR"
        case .liechtenstein: return "LI"
        case .lithuania: return "LT"
        case .luxembourg: return "LU"
        case .malta: return "MT"
        case .malaysia: return "MY"
        case .mauritius: return "MU"
        case .monaco: return "MC"
        case .namibia: return "NA"
        case .netherlands: return "NL"
        case .newZealand: return "NZ"
        case .nigeria: return "NG"
        case .norway: return "NO"
        case .pakistan: return "PK"
        case .papuaNewGuinea: return "PG"
        case .philippines: return "PH"
        case .poland: return "PL"
        case .portugal: return "PT"
        case .romania: return "RO"
        case .rwanda: return "RW"
        case .saintLucia: return "LC"
        case .sanMarino: return "SM"
        case .seychelles: return "SC"
        case .sierraLeone: return "SL"
        case .singapore: return "SG"
        case .slovakia: return "SK"
        case .slovenia: return "SI"
        case .southAfrica: return "ZA"
        case .southKorea: return "KR"
        case .spain: return "ES"
        case .sriLanka: return "LK"
        case .sweden: return "SE"
        case .switzerland: return "CH"
        case .tanzania: return "TZ"
        case .thailand: return "TH"
        case .trinidadAndTobago: return "TT"
        case .uganda: return "UG"
        case .uk: return "GB"
        case .ukraine: return "UA"
        case .usa: return "US"
        case .vaticanCity: return "VA"
        case .zambia: return "ZM"
        case .zimbabwe: return "ZW"
        }
    }
    
    var alpha3Code: String {
        switch self {
        case .andorra: return "AND"
        case .austria: return "AUT"
        case .australia: return "AUS"
        case .bahamas: return "BHS"
        case .barbados: return "BRB"
        case .belgium: return "BEL"
        case .belize: return "BLZ"
        case .botswana: return "BWA"
        case .brunei: return "BRN"
        case .bulgaria: return "BGR"
        case .canada: return "CAN"
        case .croatia: return "HRV"
        case .cyprus: return "CYP"
        case .czechRepublic: return "CZE"
        case .denmark: return "DNK"
        case .dominica: return "DMA"
        case .estonia: return "EST"
        case .fiji: return "FJI"
        case .finland: return "FIN"
        case .france: return "FRA"
        case .gambia: return "GMB"
        case .germany: return "DEU"
        case .ghana: return "GHA"
        case .greece: return "GRC"
        case .grenada: return "GRD"
        case .guyana: return "GUY"
        case .hungary: return "HUN"
        case .iceland: return "ISL"
        case .india: return "IND"
        case .ireland: return "IRL"
        case .italy: return "ITA"
        case .jamaica: return "JAM"
        case .japan: return "JPN"
        case .kenya: return "KEN"
        case .latvia: return "LVA"
        case .lesotho: return "LSO"
        case .liberia: return "LBR"
        case .liechtenstein: return "LIE"
        case .lithuania: return "LTU"
        case .luxembourg: return "LUX"
        case .malta: return "MLT"
        case .malaysia: return "MYS"
        case .mauritius: return "MUS"
        case .monaco: return "MCO"
        case .namibia: return "NAM"
        case .netherlands: return "NLD"
        case .newZealand: return "NZL"
        case .nigeria: return "NGA"
        case .norway: return "NOR"
        case .pakistan: return "PAK"
        case .papuaNewGuinea: return "PNG"
        case .philippines: return "PHL"
        case .poland: return "POL"
        case .portugal: return "PRT"
        case .romania: return "ROU"
        case .rwanda: return "RWA"
        case .saintLucia: return "LCA"
        case .sanMarino: return "SMR"
        case .seychelles: return "SYC"
        case .sierraLeone: return "SLE"
        case .singapore: return "SGP"
        case .slovakia: return "SVK"
        case .slovenia: return "SVN"
        case .southAfrica: return "ZAF"
        case .southKorea: return "KOR"
        case .spain: return "ESP"
        case .sriLanka: return "LKA"
        case .sweden: return "SWE"
        case .switzerland: return "CHE"
        case .tanzania: return "TZA"
        case .thailand: return "THA"
        case .trinidadAndTobago: return "TTO"
        case .uganda: return "UGA"
        case .uk: return "GBR"
        case .ukraine: return "UKR"
        case .usa: return "USA"
        case .vaticanCity: return "VAT"
        case .zambia: return "ZMB"
        case .zimbabwe: return "ZWE"
        }
    }
    
}

enum DrivingSide: String, Codable, CaseIterable {
    case left = "left"
    case right = "right"
}

enum AlcoholUnit: String, Codable, CaseIterable {
    case permille = "‰"
    case percentage = "%"
    
    var description: String {
        switch self {
        case .permille: return "Permille"
        case .percentage: return "Percentage"
        }
    }
    
    var symbol: String {
        return self.rawValue
    }
}

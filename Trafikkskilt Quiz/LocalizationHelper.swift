//
//  LocalizationHelper.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 22/9/25.
//

import Foundation

struct LocalizationHelper {
    static func localizedString(for key: String, country: String) -> String {
        let languageCode: String
        
        switch country {
        case "Norway":
            languageCode = "nb"   // Norwegian Bokmål
        case "Sweden":
            languageCode = "sv"
        case "Denmark":
            languageCode = "da"
        default:
            languageCode = "en"
        }
        
        // Load the bundle for that language
        if let path = Bundle.main.path(forResource: languageCode, ofType: "lproj"),
           let bundle = Bundle(path: path) {
            return NSLocalizedString(key, bundle: bundle, comment: "")
        }
        
        // Fallback → English
        return NSLocalizedString(key, comment: "")
    }
}

//
//  LanguageManager.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 15/11/25.
//

import Foundation
import SwiftUI

/// Helper to get localized strings based on user settings or system language
struct LanguageManager {
    
    let settings: GameSettings?
    
    /// Returns the effective language code to use for translations
    var effectiveLanguageCode: String {
        guard let settings = settings, !settings.userLanguage.isEmpty else {
            return Locale.current.identifier
        }
        return settings.userLanguage
    }
    
    /// Fetches a localized string from Localizable.strings using effective language
    func localizedString(for key: String) -> String {
        let bundle: Bundle
        
        if let settings = settings, !settings.userLanguage.isEmpty {
            let userLang = settings.userLanguage
            
            // For Chinese, use the full locale code to distinguish Simplified vs Traditional
            let langCode: String
            if userLang.starts(with: "pt-BR") {
                langCode = "pt-BR"
            }
            else if userLang.starts(with: "zh-Hans") || userLang == "zh-CN" || userLang == "zh-SG" {
                langCode = "zh-Hans"
            } else if userLang.starts(with: "zh-Hant") || userLang == "zh-TW" || userLang == "zh-HK" || userLang == "zh-MO" {
                langCode = "zh-Hant"
            } else {
                langCode = String(userLang.prefix(2))
            }
            
            if let path = Bundle.main.path(forResource: langCode, ofType: "lproj"),
               let langBundle = Bundle(path: path) {
                bundle = langBundle
            } else {
                bundle = .main
            }
        } else {
            bundle = .main
        }
        
        return NSLocalizedString(key, bundle: bundle, comment: "")
    }
}

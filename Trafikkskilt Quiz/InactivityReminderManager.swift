//
//  InactivityReminderManager.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 14/10/25.
//

import Foundation
import UserNotifications

final class InactivityReminderManager {
    static let shared = InactivityReminderManager()
    private let reminderID = "inactivityReminder"
    private init() {}
    
    func requestPermission(completion: ((Bool) -> Void)? = nil) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("❌ Notification permission error: \(error.localizedDescription)")
                completion?(false)
            } else {
                print("✅ Notification permission granted: \(granted)")
                completion?(granted)
            }
        }
    }
    
    func scheduleInactivityReminder(languageManager: LanguageManager) {
        requestPermission { granted in
            guard granted else { return }
            
            let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: [self.reminderID])
            
            let content = UNMutableNotificationContent()
            content.title = languageManager.localizedString(for: "It's Quiz Time!")
            content.body = languageManager.localizedString(for: "Jump back in and test your traffic sign knowledge 🚗💨")
            content.sound = .default
            
            // 5 days trigger
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5 * 24 * 60 * 60, repeats: false)
            let request = UNNotificationRequest(identifier: self.reminderID, content: content, trigger: trigger)
            
            center.add(request) { error in
                if let error = error {
                    print("❌ Failed to schedule inactivity reminder: \(error.localizedDescription)")
                } else {
                    print("✅ Inactivity reminder scheduled for 5 days from now.")
                }
            }
        }
    }
}

//
//  SoundManager.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 23/9/25.
//

import AVFoundation
import SwiftUI

class SoundManager {
    static var player: AVAudioPlayer?
    
    static func playSound(named name: String) {
        if let url = Bundle.main.url(forResource: name, withExtension: "wav") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
}

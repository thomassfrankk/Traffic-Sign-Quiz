//
//  SoundManager.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 23/9/25.
//

import AVFoundation
import SwiftUI

class SoundManager {
    private static var player: AVAudioPlayer?
    
    static func playSound(named name: String, withExtension ext: String = "wav") {
        // Configure audio session for ducking
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playback, options: [.duckOthers])
            try session.setActive(true)
        } catch {
            print("❌ Failed to set audio session: \(error.localizedDescription)")
        }
        
        guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {
            print("❌ Could not find sound file: \(name).\(ext)")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = AudioSessionRestorer.shared  // restore after playback
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("❌ Error playing sound: \(error.localizedDescription)")
        }
    }
}

/// Helper to restore audio session after playback
class AudioSessionRestorer: NSObject, AVAudioPlayerDelegate {
    static let shared = AudioSessionRestorer()
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        do {
            try AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
        } catch {
            print("❌ Failed to deactivate session: \(error.localizedDescription)")
        }
    }
}

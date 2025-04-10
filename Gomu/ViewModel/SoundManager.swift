//
//  SoundManager.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 09/04/25.
//

import Foundation
import AVFoundation

class SoundManager: NSObject, AVAudioPlayerDelegate {
    static let shared = SoundManager()
    private var audioPlayer: AVAudioPlayer?

    private override init() {}

    func playSound(named soundName: String) {
        guard let path = Bundle.main.path(forResource: soundName, ofType: "mp3") else {
            print("Error: Sound file \(soundName).mp3 not found")
            return
        }

        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }

    func stopSound() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}

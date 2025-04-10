//
//  SoundRun.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 09/04/25.
//

import Foundation
import AVFoundation
import SwiftUI

class SoundRunManager: ObservableObject {
    static let shared = SoundRunManager()
    
    @Published var currentMessage: String = ""
    private var hasPlayed: Set<Int> = []
    private var audioPlayer: AVAudioPlayer?

    let messages: [RunMotivationModel] = [
        RunMotivationModel(index: 1, text: "Okay, Let's go!", soundName: "soundStartRun1", triggerTime: 1),
        RunMotivationModel(index: 2, text: "Bruh, you're literally unstoppable right now.", soundName: "soundStartRun2", triggerTime: 10),
        RunMotivationModel(index: 3, text: "Keep it up, Captain.", soundName: "soundStartRun3", triggerTime: 20),
        RunMotivationModel(index: 4, text: "Two clicks in and still cruisin.", soundName: "soundStartRun4", triggerTime: 30)
    ]
    
//    func checkAndPlay(for duration: TimeInterval) {
//        for message in messages {
//            if Int(duration) == Int(message.triggerTime), !hasPlayed.contains(message.index) {
//                playSound(named: message.soundName)
//                DispatchQueue.main.async {
//                    self.currentMessage = message.text
//                }
//                hasPlayed.insert(message.index)
//            }
//        }
//    }
    
    func checkAndPlay(for duration: TimeInterval) {
        for message in messages {
            if duration >= message.triggerTime, !hasPlayed.contains(message.index) {
                playSound(named: message.soundName)
                DispatchQueue.main.async {
                    self.currentMessage = message.text
                }
                hasPlayed.insert(message.index)
            }
        }
    }


    private func playSound(named soundName: String) {
        guard let path = Bundle.main.path(forResource: soundName, ofType: "mp3") else {
            print("⚠️ Sound \(soundName) not found")
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("❌ Error playing sound: \(error.localizedDescription)")
        }
    }
}

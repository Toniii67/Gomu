//
//  ChatViewModel.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 27/03/25.
//

import AVFoundation
import SwiftUI

class ChatViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var currentMessage: String = ""
    @Published var isFinished: Bool = false
    
    private var messages: [ChatModel] = []
    private var audioPlayer: AVAudioPlayer?
    private var currentIndex = 0
    
    override init() {
        super.init()
        messages = [
            ChatModel(text: "Back for another walk? Love that energy.", soundName: "soundRun1"),
            ChatModel(text: "What if we crush a quick 6k steps today?", soundName: "soundRun3"),
            ChatModel(text: "Ready for another walk?", soundName: "soundRun2")
        ]
        startChatLoop()
    }
    
    func stopAudio() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    
    func startChatLoop() {
        currentIndex = 0
        isFinished = false
        playNextMessage()
    }
    
    private func playNextMessage() {
        guard currentIndex < messages.count else {
            isFinished = true
            return
        }
        
        let message = messages[currentIndex]
        DispatchQueue.main.async {
            self.currentMessage = message.text
        }
        
        playSound(named: message.soundName)
        currentIndex += 1
    }
    
    private func playSound(named soundName: String) {
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
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.playNextMessage()
        }
    }
}

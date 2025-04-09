//import SwiftUI
//
//struct Onboarding: View {
//    @State private var gomuText = "I'm Gomu"
//    
//    var body: some View {
//        ZStack {
//            Color.gomuBlue
//                .edgesIgnoringSafeArea(.all)
//            
//            VStack {
//                Spacer()
//                
//                Text("hello")
//                    .font(.system(size: 60, design: .rounded))
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .padding(.bottom, 50)
//                
//                Image("GOMU_5X")
//                    .resizable()
//                    .frame(width: 427.61, height: 444)
//                    .padding(.bottom, 20)
//                
//                Text(gomuText)
//                    .font(.system(.title2, design: .rounded))
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .multilineTextAlignment(.center)
//                    .padding(.horizontal, 40)
//                
//                Spacer()
//            }
//        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                gomuText = "I’m here to motivate you to reach your daily walk target"
//            }
//        }
//    }
//}
//
//#Preview {
//    Onboarding()
//}

import SwiftUI
import AVFoundation

struct Onboarding: View {
    @State private var gomuText = "I'm Gomu"
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        ZStack {
            Color.gomuBlue
                .edgesIgnoringSafeArea(.all)

            // Top "hello!" text
            VStack {
                Text("hello!")
                    .font(.system(size: 60, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.bottom, 350)
                    .onAppear {
                        playSound(named: "Hello")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            playSound(named: "I'm Gomu")
                        }
                    }
            }

            // GOMU image stays fixed at bottom
            Image("GOMU-HI-5X")
                .resizable()
                .padding(.top, 350)

            // Gomu speaking text, fixed position
            Text(gomuText)
                .font(.system(size: gomuText == "I'm Gomu" ? 20 : 18, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, gomuText == "I'm Gomu" ? 250 : 220)

            Spacer()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                gomuText = "I’m here to motivate you to reach your daily walk target"
                playSound(named: "Motivate")
            }
        }
    }

    // MARK: - Sound Playback
    func playSound(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("⚠️ Sound file '\(name).mp3' not found")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("❌ Could not play sound: \(error.localizedDescription)")
        }
    }
}

#Preview {
    Onboarding()
}
//class ChatViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
//    @Published var currentMessage: String = ""
//    @Published var isFinished: Bool = false
//
//    private var messages: [ChatModel] = []
//    private var audioPlayer: AVAudioPlayer?
//    private var currentIndex = 0
//
//    override init() {
//        super.init()
//        messages = [
//            ChatModel(text: "Back for another walk? Love that energy.", soundName: "soundRun1"),
//            ChatModel(text: "What if we crush a quick 6k steps today?", soundName: "soundRun3"),
//            ChatModel(text: "Ready for another walk?", soundName: "soundRun2")
//        ]
//        startChatLoop()
//    }
//

//// Centered text
//VStack {
//    Spacer()
//    Text(gomuText)
//        .font(.system(.title2, design: .rounded))
//        .fontWeight(.bold)
//        .foregroundColor(.white)
//        .multilineTextAlignment(.center)
//        .padding(.horizontal, 40)
//    Spacer()
//}
//
//// Bottom image, stays fixed
//VStack {
//    Spacer()
//    Image("GOMU_5X")
//        .resizable()
//        .frame(width: 427.61, height: 444)
//        .padding(.bottom, 20)
//}
//}
//.onAppear {
//DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//    gomuText = "I’m here to motivate you to reach your daily walk target"

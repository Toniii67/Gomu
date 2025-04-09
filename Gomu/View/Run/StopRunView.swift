//
//  RunPauseView.swift
//  Gomu
//
//  Created by Asad on 26/03/25.
//

import SwiftUI
import SwiftData

struct StopRunView: View {
    @ObservedObject var viewModel: RunViewModel
    @Binding var isPaused: Bool
    @State private var navigateToReport = false
    @Binding var selectedTab: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Map")
                    .frame(height: 500)

                ZStack {
                    Color("primary")
                        .ignoresSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        Image("BackgroundRun")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .ignoresSafeArea(.all)
                    }

                    VStack {
                        RunDetails()
                        
                        Gauge(value: 2.1, in: 0...5) {}
                            .tint(Color("secondary"))
                            .padding()
                        
                        HStack {
                            // 🟢 Continue Button with Haptic
                            Button(action: {
                                triggerMediumHaptic()
                                print("resume")
                                isPaused = false
                                viewModel.resumeRun()
                            }) {
                                Image(systemName: "play")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .padding(30)
                                    .foregroundColor(.white)
                                    .background(Color("secondary"))
                                    .clipShape(Circle())
                            }

                            // 🔴 Stop Button with Haptic
                            Button(action: {
                                triggerMediumHaptic()
                                print("stop")
                                viewModel.stopRun()
                                selectedTab = 2
                            }) {
                                Image(systemName: "stop")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .padding(30)
                                    .foregroundColor(.white)
                                    .background(Color("secondary"))
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .padding(.bottom, 30)
                }
            }
        }
    }

    // MARK: - Haptic Function
    private func triggerMediumHaptic() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()
    }
}

struct RunDetails: View {
    var body: some View {
        VStack {
            HStack {
                InformationText(label: "Time", data: "", fontSize: 30)
                InformationText(label: "Avg. Pace", data: "", fontSize: 30)
                InformationText(label: "Kilometres", data: "", fontSize: 30)
            }
            HStack {
                InformationText(label: "Elevation", data: "", fontSize: 30)
                InformationText(label: "BPM", data: "", fontSize: 30)
                InformationText(label: "Calories", data: "", fontSize: 30)
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var selectedTab = 1
        
        var body: some View {
            do {
                let container = try ModelContainer(for: RunModel.self)
                return AnyView(
                    StopRunView(
                        viewModel: RunViewModel(context: container.mainContext),
                        isPaused: .constant(false),
                        selectedTab: $selectedTab
                    )
                    .modelContainer(container)
                )
            } catch {
                return AnyView(Text("Preview Error: \(error.localizedDescription)"))
            }
        }
    }

    return PreviewWrapper()
}



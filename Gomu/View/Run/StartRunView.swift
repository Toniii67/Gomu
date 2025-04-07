//
//  RunView.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 25/03/25.
//

import SwiftUI
import SwiftData


public struct StartRunView: View {
    @ObservedObject var viewModel: RunViewModel
    @State private var isPaused: Bool = false
    @Binding var selectedTab: Int
    
    public var body: some View {
        ZStack{
            Color("primary")
                .ignoresSafeArea(.all)
            VStack{
                Spacer()
                Image("BackgroundRun")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(.all)
            }
            
            VStack{
                VStack{
                    InformationText(label: "kilometers", data: String(format: "%.2f", viewModel.distance))
                    HStack{
                        InformationText(label: "Time", data: formatTime(viewModel.duration))
                        InformationText(label: "Avg. Pace",
                                        data: viewModel.distance >= 1.6 ?
                                        formatPace(viewModel.duration, viewModel.distance)
                                        : "--")
                    }
                }
                .padding()
                
                Spacer()
                
                VStack{
                    Image("ChatBallon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 160)
                    
                    Image("Gomu")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                }
                
                Button(action: {
                    print("pause")
                    viewModel.pauseRun()
                    isPaused = true
                    
                }){
                    Image(systemName: "pause")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(30)
                        .foregroundColor(.white)
                        .background(Color("secondary"))
                        .clipShape(Circle())
                }
            }
            .padding(.bottom, 20)
        }
        .fullScreenCover(isPresented: $isPaused){
            StopRunView(viewModel: viewModel, isPaused: $isPaused, selectedTab: $selectedTab)
        }
        
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func formatPace(_ duration: TimeInterval, _ distance: Double) -> String {
        let distanceInMiles = distance / 1.6
        guard distanceInMiles >= 1 else { return "--" }
        
        let paceInSeconds = duration / distanceInMiles
        let minutes = Int(paceInSeconds) / 60
        let seconds = Int(paceInSeconds) % 60
        
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var selectedTab = 1 

        var body: some View {
            StartRunView(viewModel: RunViewModel(), selectedTab: $selectedTab)
                .modelContainer(try! ModelContainer(for: RunModel.self))
        }
    }
    
    return PreviewWrapper()
}

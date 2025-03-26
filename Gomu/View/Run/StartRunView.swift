//
//  RunView.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 25/03/25.
//

import SwiftUI


public struct StartRunView: View {
    @ObservedObject var viewModel: RunViewModel
    
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
                        InformationText(label: "Avg. Pace", data: String(format: "%.2f", viewModel.duration/(viewModel.distance + 0.001)))
                    }
                }
                .padding()
                
                Spacer()
                
                VStack{ // Gomu
                    Image("ChatBallon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 241, height: 158)
                    
                    Image("Gomu")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                }
                
                Button(action: {
                    print("pause")
                    viewModel.pauseRun()
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
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    StartRunView(viewModel: RunViewModel())
}

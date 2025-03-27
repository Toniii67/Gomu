//
//  RunView.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 25/03/25.
//


/**
 start ke stop itu turun animasinya
 stop ke start itu naik animasinya
 
 alternatif solusi adalah run ke start modal, sisanya navigation ntr back nya pake dismiss jdi cmn ada 1 modal
 **/
import SwiftUI


public struct RunView: View {
    @StateObject private var viewModel = RunViewModel()
    @State private var isShowingSettings = false
    @State private var isRunning = false
    
    public var body: some View {
        ZStack{
            Color("primary")
                .ignoresSafeArea(.all)
            
            Image("BackgroundRun")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            
            VStack{
                HStack{
                    Button(action: {
                        print("person")
                    }) {
                        Image(systemName: "person.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        print("settings")
                        isShowingSettings = true
                    }) {
                        Image(systemName: "gearshape.fill")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                    }
                }
                .padding()
                
                VStack{
                    Image("ChatBallon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                    
                    Image("Gomu")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                    
                    Spacer()
                }
                
                ZStack{
                    Button(action: {
                        isRunning = true
                        viewModel.startRun()
                    }){
                        Text("Start")
                            .font(.system(.title2, design: .rounded))
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 180, height: 50)
                            .background(Color("secondary"))
                            .cornerRadius(25)
                    }
                    
                    
                    Button(action: {
                        print("music")
                    }) {
                        Image(systemName: "music.note")
                            .font(.title2)
                            .foregroundColor(Color("secondary"))
                            .padding()
                            .frame(width: 50, height: 50)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }.padding(.leading, 250)
                    
                    
                }
                
                Text("Set Goal")
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                
                Spacer()
            }
            .padding(.bottom, 80)
        }
        .fullScreenCover(isPresented: $isShowingSettings) {
            SettingsView()
        }
        .fullScreenCover(isPresented: $isRunning){
            StartRunView(viewModel: viewModel)
        }
    }
}

#Preview {
    RunView()
}

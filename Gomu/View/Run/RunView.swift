//
//  RunView.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 25/03/25.
//

import SwiftUI


public struct RunView: View {
    @State private var isShowingSettings = false
    
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
                        print("start")
                    }){
                        Text("Start")
                            .font(.title2)
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
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                
                Spacer()
            }
            .padding(.bottom, 80)
        }
        .fullScreenCover(isPresented: $isShowingSettings) {
            SettingsView()
        }
    }
}

#Preview {
    RunView()
}

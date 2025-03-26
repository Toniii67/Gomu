//
//  RunView.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 25/03/25.
//

import SwiftUI


public struct StartRunView: View {
//    @State var runData = RunModel()
    
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
                VStack{ //Details
                    InformationText(label: "kilometers", data: "0,0", fontSize: 68)
                    HStack{
                        InformationText(label: "Time", data: "00:30 ")
                        InformationText(label: "Pace", data: "6'30''")
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
                
                Button(action: { // Pause Button
                    print("pause")
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
}

#Preview {
    StartRunView()
}

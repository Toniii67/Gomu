//
//  RunPauseView.swift
//  Gomu
//
//  Created by Asad on 26/03/25.
//

import SwiftUI

struct StopRunView: View {
//    @State var runData: RunModel
//    @State var targetData:
    var body: some View {
        VStack{
            Text("Map")
                .frame(height: 500)
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
                    RunDetails()
                    Gauge(value: 2.1, in: 0...5){
                        
                    }
                    .tint(Color("secondary"))
                    .padding()
//                    .background(Color.yellow)
//                    Spacer()

                }
            }
        }
    }
}

struct RunDetails: View{
//    var runData: RunModel
    var body: some View{
        VStack{
            HStack{
                InformationText(label: "Time", data: "00:21", fontSize: 30)
                InformationText(label: "Avg. Pace", data: "6'30''", fontSize: 30)
                InformationText(label: "Kilometres", data: "0,00", fontSize: 30)
            }
            HStack{
                InformationText(label: "Elevation", data: "00:21", fontSize: 30)
                InformationText(label: "BPM", data: "89", fontSize: 30)
                InformationText(label: "Calories", data: "0", fontSize: 30)
            }
            
        }
    }
}

struct ActionButtons: View{
    var body: some View{
        HStack{
            Button(action:{
                print("Stop")
            }){
                Text("Stop")
            }
        }
    }
}

#Preview {
    StopRunView()
}

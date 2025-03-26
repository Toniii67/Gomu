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
                    
                    HStack{
                        Button(action: {
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
                        
                        Button(action: {
                            print("stop")
                        }){
                            Image(systemName: "stop")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding(30)
                                .foregroundColor(.white)
                                .background(Color("secondary"))
                                .clipShape(Circle())
                        }
                    }
                }.padding(.bottom, 30)
                
            }
        }
    }
}

struct RunDetails: View{
//    var runData: RunModel
    var body: some View{
        VStack{
            HStack{
                InformationText(label: "Time", data: "", fontSize: 30)
                InformationText(label: "Avg. Pace", data: "", fontSize: 30)
                InformationText(label: "Kilometres", data: "", fontSize: 30)
            }
            HStack{
                InformationText(label: "Elevation", data: "", fontSize: 30)
                InformationText(label: "BPM", data: "", fontSize: 30)
                InformationText(label: "Calories", data: "", fontSize: 30)
            }
            
            
        }
    }
}

//struct ActionButtons: View{
//    var body: some View{
//        HStack{
//            Button(action:{
//                print("Stop")
//            }){
//                Text("Stop")
//            }
//        }
//    }
//}

#Preview {
    StopRunView()
}

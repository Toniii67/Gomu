//
//  RunPauseView.swift
//  Gomu
//
//  Created by Asad on 26/03/25.
//

import SwiftUI
import MapKit

struct StopRunView: View {
//    @State var runData: RunModel
//    @State var targetData:
    var body: some View {
        VStack{
            MapView()
                .ignoresSafeArea(.all)
                .scaledToFill()
                .frame(height:500)
                .padding(0)
            ZStack{
                Color("primary")
                    .ignoresSafeArea(.all)
                Image("BackgroundRun")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                VStack{
                    RunDetails()
//                        .padding(.top, 20)
                    VStack{
                        Gauge(value: 2.5, in: 0...5){
                        }
                        .tint(Color("secondary"))
                        .overlay(content: {
                            Capsule()
                                .foregroundStyle(Color("secondary"))
                                .opacity(0.2)
                        })
                        .padding()
                        ActionButtons()
                    }
                    .padding(.horizontal)
                    HStack{
                        Image("Gomu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 284)
                            .position(x:70, y:200)
                        Image("ChatBallonSecond")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 224, height: 132)
                            .position(x:50, y:80)
                    }
                    Spacer()
//                    Spacer()
                }
            }
            .padding(0)
        }
    }
}

struct RunDetails: View{
//    var runData: RunModel
    var body: some View{
        VStack{
            HStack{
                InformationText(label: "Time", data: "00:21", fontSize: 30)
                Spacer()
                InformationText(label: "Avg. Pace", data: "6'30''", fontSize: 30)
                Spacer()
                InformationText(label: "Kilometres", data: "0,00", fontSize: 30)
            }
            HStack{
                InformationText(label: "Elevation", data: "00:21", fontSize: 30)
                Spacer()
                InformationText(label: "BPM", data: "89", fontSize: 30)
                Spacer()
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
                Image(systemName: "stop.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.horizontal, 30)
                    .padding(.vertical,15)
                    .foregroundStyle(Color.white)
                    .background(Color.black)
                    .clipShape(.capsule)
            }
            Spacer()
            Button(action:{
                print("Continue")
            }){
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .foregroundStyle(Color.white)
                    .background(Color("secondary"))
                    .clipShape(.capsule)
            }
//            .background(Color.black)
        }
        .padding(.horizontal)
    }
}

struct MapView: View {
    let position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -6.200000, longitude: 106.816666),
        span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.1)
    ))

    var body: some View {
        Map(initialPosition: position)
//            .frame(height: 500)
//        MapZoomStepper
    }
}


#Preview {
    StopRunView()
}

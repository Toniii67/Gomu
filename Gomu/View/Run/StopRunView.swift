//
//  RunPauseView.swift
//  Gomu
//
//  Created by Asad on 26/03/25.
//

import SwiftUI
import MapKit

struct StopRunView: View {
    @ObservedObject var viewModel: RunViewModel
    @Binding var isPaused: Bool
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            Color("primary")
                .ignoresSafeArea(.all)
            Image("BackgroundRun")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            VStack{
                MapView()
//                MapView()
                RunDetails(viewModel: viewModel)
                    .ignoresSafeArea()
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
                    ActionButtons(isPaused: $isPaused,
                                  viewModel: viewModel)
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
                        .frame(width: 250)
                        .position(x:20, y:80)
                }
                Spacer()
            }
        }
        .padding(0)
    }
}

struct RunDetails: View{
//    var runData: RunModel
    var viewModel: RunViewModel
    var body: some View{
        VStack{
            HStack{
                InformationText(label: "Time",
                                data: DateComponentsFormatter().string(from: viewModel.duration) ?? "00:00",
                                fontSize: 30
                                )
                Spacer()
                InformationText(label: "Avg. Pace", data: "6'30''", fontSize: 30)
                Spacer()
                InformationText(label: "Kilometres",
                                data: String(format: "%.2f", viewModel.distance),
                                fontSize: 30)
            }
            HStack{
                InformationText(label: "Elevation", data: "21", fontSize: 30)
                Spacer()
                InformationText(label: "BPM", data: viewModel.bpm.formatted(), fontSize: 30)
                Spacer()
                InformationText(label: "Calories", data: viewModel.calories.formatted(), fontSize: 30)
            }
            
            
        }
    }
}

struct ActionButtons: View{
    @Binding var isPaused: Bool
    @ObservedObject var viewModel: RunViewModel
    var body: some View{
        HStack{
            Button(action:{
                print("Stop")
            }){
                Image(systemName: "stop.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(20)
                    .foregroundStyle(Color.white)
                    .background(Color.black)
                    .clipShape(.capsule)
            }.padding(.horizontal)
            Button(action:{
                print("resume")
                isPaused = false
                viewModel.resumeRun()
            }){
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(20)
                    .foregroundStyle(Color.white)
                    .background(Color("secondary"))
                    .clipShape(.circle)
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    let initPosition = CLLocationCoordinate2D(latitude: -6.1754, longitude: 106.8272)

    var body: some View {
        Map(position: .constant(
            MapCameraPosition.region(
                MKCoordinateRegion(
                    center: locationManager.locations.last ?? initPosition,
                    span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
                )
            )
        )){
            Annotation(
                "Your Location",
                coordinate: locationManager.locations.last ?? initPosition
            ){
                Image(systemName: "figure.walk")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(10)
                    .foregroundStyle(Color.white)
                    .background(Color.red)
                    .clipShape(Circle())
            }
            MapPolyline(coordinates: locationManager.locations, contourStyle: .straight)
                .stroke(.blue, lineWidth: 2)
        }
        .preferredColorScheme(.light)
    }
}


#Preview {
    StopRunView(
        viewModel: RunViewModel(),
        isPaused: .constant(false)
    )
}

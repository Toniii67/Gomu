//
//  RunView.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 25/03/25.
//

import SwiftUI
import SwiftData

//
//public struct RunView: View {
//    @ObservedObject var viewModel: RunViewModel
//    @State private var isShowingSettings = false
//    @State private var isShowingProfile = false
//    @State private var isRunning = false
//    @StateObject private var chatViewModel = ChatViewModel()
//    
//    @Binding var selectedTab: Int
//    
//    public var body: some View {
//        ZStack{
//            Color("primary")
//                .ignoresSafeArea(.all)
//            
//            Image("BackgroundRun")
//                .resizable()
////                .scaledToFill()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .ignoresSafeArea(.all)
//            
//            VStack{
//                HStack{
//                    Button(action: {
//                        print("person")
//                        isShowingProfile = true
//                    }) {
//                        Image(systemName: "person.circle.fill")
//                            .font(.largeTitle)
//                            .foregroundColor(.orange)
//                    }
//                    
//                    Spacer()
//                    
//                    Button(action: {
//                        print("settings")
//                        isShowingSettings = true
//                    }) {
//                        Image(systemName: "gearshape.fill")
//                            .font(.largeTitle)
//                            .foregroundColor(.orange)
//                    }
//                }
//                .padding(.horizontal)
//                
//                VStack{
//                    Image("ChatBallon")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 250, height: 250)
//                        .overlay(
//                            GeometryReader { geometry in
//                                Text(chatViewModel.currentMessage)
//                                    .font(.headline)
//                                    .fontWeight(.semibold)
//                                    .multilineTextAlignment(.center)
//                                    .minimumScaleFactor(0.5)
//                                    .lineLimit(3)
//                                    .foregroundColor(Color("message"))
//                                    .frame(width: 230, height: 110)
//                                //                                    .background(Color.green)
//                                    .position(x: 127, y: 104)
//                            }
//                        )
//                    
//                    Image("Gomu")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 250)
//                    
////                    Spacer()
//                }
//                
//                ZStack{
//                    Button(action: {
//                        isRunning = true
//                        viewModel.startRun()
//                    }){
//                        Text("Start")
//                            .font(.system(.title2, design: .rounded))
//                            .foregroundColor(.white)
//                            .fontWeight(.semibold)
//                            .padding()
//                            .frame(width: 180, height: 50)
//                            .background(Color("secondary"))
//                            .cornerRadius(25)
//                    }
//                    
//                    
//                    Button(action: {
//                        print("music")
//                    }) {
//                        Image(systemName: "music.note")
//                            .font(.title2)
//                            .foregroundColor(Color("secondary"))
//                            .padding()
//                            .frame(width: 50, height: 50)
//                            .background(Color.white)
//                            .clipShape(Circle())
//                            .shadow(radius: 4)
//                    }.padding(.leading, 250)
//                    
//                    
//                }
//                
//                Text("Set Goal")
//                    .font(.system(.subheadline, design: .rounded))
//                    .fontWeight(.semibold)
//                    .padding(.top, 10)
//                
//                Spacer()
//            }
//            .padding(.bottom, 80)
//        }
//        .onDisappear {
//            chatViewModel.stopAudio()
//        }
//        .fullScreenCover(isPresented: $isShowingSettings) {
//            SettingsView()
//        }
//        .fullScreenCover(isPresented: $isRunning){
//            StartRunView(viewModel: viewModel, selectedTab: $selectedTab)
//        }
//        .fullScreenCover(isPresented: $isShowingProfile) {
//            ProfileView()
//        }
//    }
//}

public struct RunView: View {
    @ObservedObject var viewModel: RunViewModel
    @State private var isShowingSettings = false
    @State private var isShowingProfile = false
//    @Binding var isRunning: Bool
    @StateObject private var chatViewModel = ChatViewModel()
    @Binding var path: NavigationPath
    
    @Binding var selectedTab: Int
    
    public var body: some View {
        ZStack {
            Color("primary")
                .ignoresSafeArea(.all)
            
            Image("BackgroundRun")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            
            VStack {
                Spacer(minLength: 0)
                
                VStack {
                    Image("ChatBallon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .overlay(
                            GeometryReader { geometry in
                                Text(chatViewModel.currentMessage)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(3)
                                    .foregroundColor(Color("message"))
                                    .frame(width: 230, height: 110)
                                    .position(x: 127, y: 104)
                            }
                        )
                    
                    Image("Gomu")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                }
                
                ZStack {
                    Button(action: {
                        print("Start button tapped")
                        viewModel.isRunning = true
                        viewModel.startRun()
                        path.append("startRun")
                    }) {
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
                    }
                    .padding(.leading, 250)
                }
                
                Text("Set Goal")
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                
                Spacer()
            }
            .padding(.bottom, 80)
        }
        .onDisappear {
            chatViewModel.stopAudio()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    isShowingProfile = true
                }) {
                    Image(systemName: "person.circle.fill")
                        .font(.title2)
                        .foregroundColor(.orange)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isShowingSettings = true
                }) {
                    Image(systemName: "gearshape.fill")
                        .font(.title2)
                        .foregroundColor(.orange)
                }
            }
        }
        //            .navigationTitle("Run")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $isShowingSettings) {
            SettingsView()
        }
        //            .fullScreenCover(isPresented: $isRunning) {
        //                StartRunView(viewModel: viewModel, selectedTab: $selectedTab)
        //            }
        .fullScreenCover(isPresented: $isShowingProfile) {
            ProfileView()
        }
    }
}


//#Preview {
//    struct PreviewWrapper: View {
//        @State private var selectedTab = 1
//        
//        var body: some View {
//            do {
//                let container = try ModelContainer(for: RunModel.self)
//                return AnyView(
//                    RunView(
//                        viewModel: RunViewModel(context: container.mainContext),
//                        selectedTab: $selectedTab
//                    )
//                    .modelContainer(container)
//                )
//            } catch {
//                return AnyView(Text("Preview Error: \(error.localizedDescription)"))
//            }
//        }
//    }
//    
//    return PreviewWrapper()
//}


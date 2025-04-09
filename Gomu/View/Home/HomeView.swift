//
//  HomeView.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 25/03/25.
//

import SwiftUI

//public struct HomeView: View {
//    @State private var isShowingSettings = false
//    @State private var isShowingProfile = false
//
//    public var body: some View {
//        ZStack{
//            Image("AwanHome")
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
//                HStack{
//                    Text("Weekly Goals")
//                        .font(.title2)
//                        .bold()
//                        .foregroundStyle(Color("white"))
//                        .padding(.leading, 20)
//                    Spacer()
//                }
//                .padding(.top, 15)
//
//
//
//                ZStack{
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color("white3"))
//                        .frame(height: 175)
//                        .padding(.horizontal, 20)
//                    VStack{
//                        Text("0.00 Km / 10.00 Km")
//                            .font(.title2)
//                            .foregroundStyle(.white)
//                            .bold()
//
////                        ProgressView(value: 0.25)
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color("secondary"))
//                                .frame(width: 120, height: 40)
//
//                            Text("Set goal")
//                                .font(.headline)
//                                .bold()
//                                .foregroundStyle(.white)
//                        }
//                    }
//                }
//
//                HStack{
//                    Text("Challenge")
//                        .font(.title2)
//                        .bold()
//                        .foregroundStyle(Color("white"))
//                        .padding(.leading, 20)
//                    Spacer()
//                }
//                .padding(.top, 15)
//
//                ZStack{
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color("white3"))
//                        .frame(height: 175)
//                        .padding(.horizontal, 20)
//
//                }
//
//                Spacer()
//            }
//            .fullScreenCover(isPresented: $isShowingSettings) {
//                SettingsView()
//            }
//            .fullScreenCover(isPresented: $isShowingProfile) {
//                ProfileView()
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color("primary"))
//
//    }
//}

public struct HomeView: View {
    @State private var isShowingSettings = false
    @State private var isShowingProfile = false
    
    public var body: some View {
        NavigationStack {
            ZStack {
                Image("AwanHome")
                
                VStack {
                    HStack {
                        Text("Weekly Goals")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(Color("white"))
                            .padding(.leading, 20)
                        Spacer()
                    }
                    .padding(.top, 15)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("white3"))
                            .frame(height: 175)
                            .padding(.horizontal, 20)
                        
                        VStack {
                            Text("0.00 Km / 10.00 Km")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .bold()
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("secondary"))
                                    .frame(width: 120, height: 40)
                                
                                Text("Set goal")
                                    .font(.headline)
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    
                    HStack {
                        Text("Challenge")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(Color("white"))
                            .padding(.leading, 20)
                        Spacer()
                    }
                    .padding(.top, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0..<5) { _ in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("white3"))
                                    
                                    HStack(alignment: .top, spacing: 12) {
                                        Image("KilometerCrusher")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))

                                        VStack(alignment: .leading, spacing: 6) {
                                            Text("Run Streak Revolution: 30 Days Non-Stop Tracking Challenge")
                                                .font(.headline)
                                                .foregroundColor(.black)
                                                .lineLimit(2)
                                                .fixedSize(horizontal: false, vertical: true)

                                            Text("Track every run in Gomu for 30 consecutive days. No distance requirements—just stay consistent!")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                                .lineLimit(3)
                                                .fixedSize(horizontal: false, vertical: true)
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .frame(width: 300, height: 175) // Pastikan frame card tegas
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                   
                    Spacer()
                }
                .padding(.top, 10)
            }
            .background(Color("primary"))
            //            .ignoresSafeArea()
            //            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
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
            .fullScreenCover(isPresented: $isShowingSettings) {
                SettingsView()
            }
            .fullScreenCover(isPresented: $isShowingProfile) {
                ProfileView()
            }
        }
    }
}

#Preview {
    HomeView()
}

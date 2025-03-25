//
//  MainTabView.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 25/03/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        ZStack {
            Color("primary")
                    .ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                if selectedTab == 0 {
                    HomeView()
                } else if selectedTab == 1 {
                    RunView()
                } else if selectedTab == 2 {
                    ReportView()
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("primary"))
                .frame(height: 75)
                .shadow(radius: 4)

            HStack {
                Button(action: { selectedTab = 0 }) {
                    Image(systemName: "house.fill")
                        .font(.title)
                        .foregroundColor(selectedTab == 0 ? Color("white") : Color("secondary"))
                }
                
                Spacer()
                
                // Tombol Tengah (Run)
                Button(action: { selectedTab = 1 }) {
                    Image(systemName: "figure.run")
                        .font(.title)
                        .foregroundColor(Color("white"))
                        .padding()
                        .background(Color("secondary"))
                        .clipShape(Circle())
                }
                .offset(y: -20)
                
                Spacer()
                
                // Tombol Stats
                Button(action: { selectedTab = 2 }) {
                    Image(systemName: "chart.bar.fill")
                        .font(.title)
                        .foregroundColor(selectedTab == 2 ? Color("white") : Color("secondary"))
                }
            }
            .padding(.horizontal, 60)
            .frame(height: 70)
        }
    }
}


#Preview {
    MainTabView()
}

//
//  MainTabView.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 25/03/25.
//


import SwiftUI
import SwiftData

struct MainTabView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selectedTab = 1
    @StateObject private var viewModel: RunViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: RunViewModel())
    }
    var body: some View {
        ZStack {
            Color("primary").ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                if selectedTab == 0 {
                    HomeView()
                } else if selectedTab == 1 {
                    RunView(viewModel: viewModel, selectedTab: $selectedTab)
                } else if selectedTab == 2 {
                    ReportView(viewModel: viewModel)
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
            .edgesIgnoringSafeArea(.bottom)
        }.onAppear {
            viewModel.setContext(modelContext)
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
            
            HStack {
                Button(action: { selectedTab = 0 }) {
                    Image(systemName: "house.fill")
                        .font(.title)
                        .foregroundColor(selectedTab == 0 ? Color("white") : Color("secondary"))
                }
                
                Spacer()
                
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
                
                Button(action: { selectedTab = 2 }) {
                    Image(systemName: "chart.bar.fill")
                        .font(.title)
                        .foregroundColor(selectedTab == 2 ? Color("white") : Color("secondary"))
                }
            }
            .padding(.horizontal, 60)
        }
    }
}
//
//struct MainTabView: View {
//    @Environment(\.modelContext) private var modelContext
//    @StateObject private var viewModel: RunViewModel = RunViewModel()
//    
//    var body: some View {
//        TabView {
//            HomeView()
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("Home")
//                }
//                .tag(0)
//            
//            RunView(viewModel: viewModel, selectedTab: .constant(1)) // selectedTab diabaikan di sini
//                .tabItem {
//                    Image(systemName: "figure.run")
//                    Text("Run")
//                }
//                .tag(1)
//            
//            ReportView(viewModel: viewModel)
//                .tabItem {
//                    Image(systemName: "chart.bar.fill")
//                    Text("Report")
//                }
//                .tag(2)
//        }
//        .onAppear {
//            viewModel.setContext(modelContext)
//        }
//    }
//}

#Preview {
    MainTabView()
        .modelContainer(try! ModelContainer(for: RunModel.self))
}

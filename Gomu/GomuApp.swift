//
//  GomuApp.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 25/03/25.
//

import SwiftUI
import SwiftData

@main
struct GomuApp: App {
    let sharedModelContainer: ModelContainer = {
        let schema = Schema([RunModel.self])
        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [configuration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .modelContainer(sharedModelContainer)
        }
    }
}


//
//import SwiftUI
//import SwiftData
//
//@main
//struct GomuApp: App {
////    @StateObject private var signInManager = AppleSignInManager() // Apple Login State Manager
//    
//    let sharedModelContainer: ModelContainer = {
//        let schema = Schema([RunModel.self])
//        let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//        
//        do {
//            return try ModelContainer(for: schema, configurations: [configuration])
//        } catch {
//            fatalError("❌ Could not create ModelContainer: \(error)")
//        }
//    }()
//    
//    var body: some Scene {
//        WindowGroup {
//            MainTabView()
////            if signInManager.isSignedIn {
////                MainTabView()
////                    .environmentObject(signInManager)
////            } else {
////                SplashScreenView() // atau LoginView
////                    .environmentObject(signInManager)
////            }
//        }
//    }
//}
//
//struct SplashScreenView: View {
//    @EnvironmentObject var signInManager: AppleSignInManager
//    
//    var body: some View {
//        VStack {
//            ProgressView("Checking login...")
//                .onAppear {
//                    signInManager.requestAppleSignIn()
//                }
//        }
//    }
//}

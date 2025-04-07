//
//  GomuApp.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 25/03/25.
//

//import SwiftUI
//
//@main
//struct GomuApp: App {
//    var body: some Scene {
//        WindowGroup {
//            MainTabView()
//        }
//    }
//}

//import SwiftUI
//import SwiftData
//
//@main
//struct GomuApp: App {
//    var sharedModelContainer: ModelContainer = {
//        do {
//            let schema = Schema([RunModel.self])
//            let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//            return try ModelContainer(for: schema, configurations: [configuration])
//        } catch {
//            fatalError("Failed to create ModelContainer: \(error)")
//        }
//    }()
//    
//    var body: some Scene {
//        WindowGroup {
//            MainTabView()
//                .modelContainer(sharedModelContainer)
//        }
//    }
//}

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

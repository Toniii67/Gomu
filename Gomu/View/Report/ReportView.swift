////
////  ReportView.swift
////  Gomu
////
////  Created by Franco Antonio Pranata on 25/03/25.
////
//
//import SwiftUI
//
//public struct ReportView: View {
//    @ObservedObject var viewModel: RunViewModel
//    
//    public var body: some View {
//        VStack {
//            Text("Running History")
//                .font(.title)
//                .bold()
//            
//            if viewModel.runs.isEmpty {
//                Text("No run history available.")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            } else {
//                List(viewModel.runs) { run in
//                    VStack(alignment: .leading) {
//                        Text("Duration: \(run.duration, specifier: "%.2f") sec")
//                        Text("Distance: \(run.distance, specifier: "%.2f") km")
//                        Text("Avg Pace: \(run.averagePace)")
//                        Text("Calories: \(run.calories)")
//                        Text("BPM: \(run.bpm)")
//                    }
//                    .padding()
//                }
//            }
//        }
//        .onAppear {
//            viewModel.fetchRuns() // Pastikan data diperbarui saat ReportView dibuka
//        }
//    }
//}
//
//#Preview {
//    ReportView(viewModel: RunViewModel())
//}

import SwiftUI
import SwiftData

public struct ReportView: View {
    @ObservedObject var viewModel: RunViewModel
    
    public var body: some View {
        VStack {
            Text("Running History")
                .font(.title)
                .bold()
            
            if viewModel.runs.isEmpty {
                Text("No run history available.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            } else {
                List(viewModel.runs) { run in
                    VStack(alignment: .leading) {
                        Text("🕒 Duration: \(run.duration, specifier: "%.2f") sec")
                        Text("📏 Distance: \(run.distance, specifier: "%.2f") km")
                        Text("🏃 Avg Pace: \(run.averagePace)")
                        Text("🔥 Calories: \(run.calories)")
                        Text("❤️ BPM: \(run.bpm)")
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            viewModel.fetchRuns() // Pastikan data diperbarui saat ReportView dibuka
        }
    }
}

#Preview {
    ReportView(viewModel: RunViewModel())
            .modelContainer(try! ModelContainer(for: RunModel.self))
}

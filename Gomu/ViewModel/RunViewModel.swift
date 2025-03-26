//
//  RunViewModel.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 26/03/25.
//

import SwiftData
import SwiftUI

class RunViewModel: ObservableObject {
    @Environment(\.modelContext) private var modelContext
    @Published var runs: [RunModel] = []
    @Published var isRunning = false
    @Published var duration: TimeInterval = 0
    @Published var distance: Double = 0
    @Published var bpm: Int = 80
    @Published var calories: Int = 0
    private var timer: Timer?
    // avg pace itu per mil -> 1.6km
    func startRun() {
        isRunning = true
        duration = 0
        distance = 0
        calories = 0
        bpm = 80
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.duration += 1
            self.distance += Double.random(in: 0.002...0.004)
            self.calories += 1
            self.bpm = Int.random(in: 80...150)
        }
    }
    
    func pauseRun() {
        timer?.invalidate()
    }
    
    func stopRun() {
        timer?.invalidate()
        isRunning = false
        let averagePace = String(format: "%.2f", duration / (distance + 0.001))
        let newRun = RunModel(duration: duration, averagePace: averagePace, distance: distance, elevation: 10, bpm: bpm, calories: calories)
        modelContext.insert(newRun)
        fetchRuns()
    }
    
    func fetchRuns() {
        let descriptor = FetchDescriptor<RunModel>(sortBy: [SortDescriptor(\.timestamp, order: .reverse)])
        do {
            runs = try modelContext.fetch(descriptor)
        } catch {
            print("Failed to fetch runs: \(error)")
        }
    }
}

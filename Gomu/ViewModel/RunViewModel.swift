//
//  RunViewModel.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 26/03/25.
//

import SwiftUI
import SwiftData

@MainActor
class RunViewModel: ObservableObject {
    @Published var runs: [RunModel] = []
    @Published var isRunning = false
    @Published var duration: TimeInterval = 0
    @Published var distance: Double = 0
    @Published var bpm: Int = 80
    @Published var calories: Int = 0
    
    private var modelContext: ModelContext?
    private var timer: Timer?

    init() {}

    init(context: ModelContext) {
        self.modelContext = context
        fetchRuns()
    }

    func setContext(_ context: ModelContext) {
        self.modelContext = context
        fetchRuns()
    }

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

    func resumeRun() {
            isRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                self.duration += 1
                self.distance += Double.random(in: 0.002...0.004)
                self.calories += 1
                self.bpm = Int.random(in: 80...150)
            }
        }

    func stopRun() {
        timer?.invalidate()
        isRunning = false

        let distanceInMiles = distance / 1.6
        var averagePace = "--"
        
        if distanceInMiles >= 1 {
            let paceInSeconds = duration / distanceInMiles
            let minutes = Int(paceInSeconds) / 60
            let seconds = Int(paceInSeconds) % 60
            averagePace = String(format: "%02d:%02d", minutes, seconds)
        }

        guard let context = modelContext else {
            print("No model context available")
            return
        }

        let newRun = RunModel(
            duration: duration,
            averagePace: averagePace,
            distance: distance,
            elevation: 10,
            bpm: bpm,
            calories: calories
        )

        context.insert(newRun)

        do {
            try context.save()
            print("Run saved successfully!")
            fetchRuns()
        } catch {
            print("Failed to save run: \(error)")
        }
    }

    func fetchRuns() {
        guard let context = modelContext else {
            print("No model context available")
            return
        }

        let descriptor = FetchDescriptor<RunModel>(
            sortBy: [SortDescriptor(\.timestamp, order: .reverse)]
        )

        do {
            runs = try context.fetch(descriptor)
            print("Fetched \(runs.count) runs")
        } catch {
            print("Failed to fetch runs: \(error)")
        }
    }
}

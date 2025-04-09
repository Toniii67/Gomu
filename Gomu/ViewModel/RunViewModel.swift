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
    @Published var bpm: Int = 0
    @Published var calories: Int = 0
    @Published var elevation: Double = 0.0
    @Published var locationManager: LocationManager = LocationManager()
    @Published var avgPace: String = "--"
    private var date: Date = Date()
    private var healthManager: HealthManager = HealthManager()
    private var timer: Timer?
    private var modelContext: ModelContext?

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
        bpm = 0
        calories = 0
        elevation = 0.0
        locationManager.startTracking()
        self.healthManager.startHeartRateUpdates { bpm in
            self.bpm = bpm
        }
        self.healthManager.startCaloriesUpdates(start: self.date) { calories in
            self.calories = calories
        }
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {[weak self] _ in
            self?.duration += 1
//            let now = Date()
            DispatchQueue.main.async {
                self?.distance = self?.locationManager.calculateTotalDistance() ?? 0.0
                self?.calculatePace()
                print(self?.avgPace)
            }
        }
        self.elevation = self.locationManager.calculateElevationGain()
    }

    func pauseRun() {
        timer?.invalidate()
        timer = nil
        locationManager.stopTracking()
        healthManager.stopHealthKitUpdates()
    }

    func resumeRun() {
        isRunning = true
        locationManager.startTracking()
        self.healthManager.startHeartRateUpdates { bpm in
            self.bpm = bpm
        }
        self.healthManager.startCaloriesUpdates(start: self.date) { calories in
            self.calories = calories
        }
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {[weak self] _ in
            self?.duration += 1
            DispatchQueue.main.async {
                self?.distance = self?.locationManager.calculateTotalDistance() ?? 0.0
                self?.calculatePace()
            }
        }
        
        self.elevation = self.locationManager.calculateElevationGain()
    }
    
    func stopRun() {
        print("trying stopping")
        timer?.invalidate()
        print("done invalidate timer")
        timer = nil
        print("done set timer to nil")
        isRunning = false
        print("done set isRunning to false")
        locationManager.stopTracking()
        print("done stopping location manager")
        healthManager.stopHealthKitUpdates()
        print("done stopping healtkit")

        guard let context = modelContext else {
            print("No model context available")
            return
        }

        let newRun = RunModel(
            timestamp: date,
            duration: duration,
            averagePace: avgPace,
            distance: distance,
            elevation: elevation,
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
    
    func calculatePace(){
//        var averagePace = "--"
        if distance == 0 {
            self.avgPace = "--"
            return
        }
        
        let distanceInMiles = self.distance / 1.6
        let paceInSeconds = duration / distanceInMiles
        let minutes = Int(paceInSeconds) / 60
        let seconds = Int(paceInSeconds) % 60
        if minutes >= 60 {
            self.avgPace = "--"
            return
        }
        
        self.avgPace = String(format: "%02d:%02d", minutes, seconds)
    }
    
}

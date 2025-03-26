//
//  RunningData.swift
//  Gomu
//
//  Created by Asad on 25/03/25.
//

import SwiftData
import SwiftUI

@Model
class RunModel {
    var id: UUID
    var duration: TimeInterval
    var averagePace: String
    var distance: Double
    var elevation: Double
    var bpm: Int
    var calories: Int
    var timestamp: Date
    
    init(
    duration: TimeInterval,
    averagePace: String,
    distance: Double,
    elevation: Double,
    bpm: Int,
    calories: Int
    ){
        self.id = UUID()
        self.duration = duration
        self.averagePace = averagePace
        self.distance = distance
        self.elevation = elevation
        self.bpm = bpm
        self.calories = calories
        self.timestamp = Date()
    }
}

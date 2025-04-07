//
//  RunningData.swift
//  Gomu
//
//  Created by Asad on 25/03/25.
//

//import SwiftData
//import SwiftUI
//
//@Model
//class RunModel {
//    var id: UUID
//    var duration: TimeInterval
//    var averagePace: String
//    var distance: Double
//    var elevation: Double
//    var bpm: Int
//    var calories: Int
//    var timestamp: Date
//    
//    init(
//    duration: TimeInterval,
//    averagePace: String,
//    distance: Double,
//    elevation: Double,
//    bpm: Int,
//    calories: Int
//    ){
//        self.id = UUID()
//        self.duration = duration
//        self.averagePace = averagePace
//        self.distance = distance
//        self.elevation = elevation
//        self.bpm = bpm
//        self.calories = calories
//        self.timestamp = Date()
//    }
//}

import SwiftData
import Foundation

@Model
public class RunModel {
    @Attribute(.unique) public var id: UUID
    public var timestamp: Date
    public var duration: TimeInterval
    public var averagePace: String
    public var distance: Double
    public var elevation: Double
    public var bpm: Int
    public var calories: Int

    public init(
        id: UUID = UUID(),
        timestamp: Date = Date(),
        duration: TimeInterval,
        averagePace: String,
        distance: Double,
        elevation: Double,
        bpm: Int,
        calories: Int
    ) {
        self.id = id
        self.timestamp = timestamp
        self.duration = duration
        self.averagePace = averagePace
        self.distance = distance
        self.elevation = elevation
        self.bpm = bpm
        self.calories = calories
    }
}

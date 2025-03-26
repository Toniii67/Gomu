//
//  RunningData.swift
//  Gomu
//
//  Created by Asad on 25/03/25.
//

import Foundation

class RunModel {
    public var id: Int = 0
    public var distance: Double = 0.0
    public var elevation: Double = 0.0
    public var calories: Double = 0.0
    public var bpm: Int = 80
    
    public var startTime: Date?
    public var accumulatedTime:TimeInterval = 0
    func start() -> Void {
        self.startTime = Date()
    }
    func stop() -> Void {
        self.accumulatedTime = self.elapsedTime()
        self.startTime = nil
    }
    func reset() -> Void {
        self.accumulatedTime = 0
        self.startTime = nil
    }
    func elapsedTime() -> TimeInterval {
        return -(self.startTime?.timeIntervalSinceNow ?? 0)+self.accumulatedTime
    }
}

//
//  RunMotivationModel.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 09/04/25.
//

import Foundation

struct RunMotivationModel: Identifiable {
    let id = UUID()
    let index: Int
    let text: String
    let soundName: String
    let triggerTime: TimeInterval
}

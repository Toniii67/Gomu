//
//  RunningTrackerWidgetBundle.swift
//  RunningTrackerWidget
//
//  Created by Franco Antonio Pranata on 09/04/25.
//

import WidgetKit
import SwiftUI

@main
struct RunningTrackerWidgetBundle: WidgetBundle {
    var body: some Widget {
        RunningTrackerWidget()
        RunningTrackerWidgetControl()
        RunningTrackerWidgetLiveActivity()
    }
}

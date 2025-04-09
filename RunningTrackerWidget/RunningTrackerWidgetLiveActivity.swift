//
//  RunningTrackerWidgetLiveActivity.swift
//  RunningTrackerWidget
//
//  Created by Franco Antonio Pranata on 09/04/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct RunningTrackerWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct RunningTrackerWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: RunningTrackerWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension RunningTrackerWidgetAttributes {
    fileprivate static var preview: RunningTrackerWidgetAttributes {
        RunningTrackerWidgetAttributes(name: "World")
    }
}

extension RunningTrackerWidgetAttributes.ContentState {
    fileprivate static var smiley: RunningTrackerWidgetAttributes.ContentState {
        RunningTrackerWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: RunningTrackerWidgetAttributes.ContentState {
         RunningTrackerWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: RunningTrackerWidgetAttributes.preview) {
   RunningTrackerWidgetLiveActivity()
} contentStates: {
    RunningTrackerWidgetAttributes.ContentState.smiley
    RunningTrackerWidgetAttributes.ContentState.starEyes
}

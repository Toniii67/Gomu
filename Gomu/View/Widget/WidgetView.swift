//
//  WidgetView.swift
//  Gomu
//
//  Created by Franco Antonio Pranata on 09/04/25.
//

import WidgetKit
import SwiftUI

struct ImageEntry: TimelineEntry {
    let date: Date
}

struct ImageProvider: TimelineProvider {
    func placeholder(in context: Context) -> ImageEntry {
        ImageEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (ImageEntry) -> Void) {
        completion(ImageEntry(date: Date()))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ImageEntry>) -> Void) {
        let entry = ImageEntry(date: Date())
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct ImageWidgetEntryView: View {
    var entry: ImageProvider.Entry

    var body: some View {
        Image("Widget") // Nama gambar di assets
            .resizable()
            .scaledToFill()
            .clipped()
    }
}

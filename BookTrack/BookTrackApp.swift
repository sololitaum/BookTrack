//
//  BookTrackApp.swift
//  BookTrack
//
//  Created by Solomiya Pylypiv on 2/27/25.
//

import SwiftUI

@main
struct BookTrackApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}

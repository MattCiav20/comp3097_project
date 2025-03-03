//
//  screen_3__checkout2_App.swift
//  screen 3 (checkout2)
//
//  Created by Jacques Antoine Vidjanagni on 2025-03-01.
//

import SwiftUI
import SwiftData

@main
struct screen_3__checkout2_App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

//
//  CalendaryApp.swift
//  Calendary
//
//  Created by Felipe Santos on 08/11/25.
//

import SwiftUI
import SwiftData

@main
struct CalendaryApp: App {
    @State private var showSplash = true
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Appointment.self,
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
            ZStack {
                if showSplash {
                    SplashView()
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation(.easeOut(duration: 0.8)) {
                                    showSplash = false
                                }
                            }
                        }
                } else {
                    TabBarView()
                        .preferredColorScheme(.light)
                        .transition(.opacity)
                }
            }
        }
        .modelContainer(sharedModelContainer)
    }
    
    
}

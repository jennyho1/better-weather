//
//  better_weatherApp.swift
//  better-weather
//
//  Created by Jenny Ho on 2022-06-25.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var showWeatherHour: Bool
    init(showWeatherHour: Bool) {
        self.showWeatherHour = showWeatherHour
    }
}

@main
struct better_weatherApp: App {
    @ObservedObject var appState = AppState(showWeatherHour: false)
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appState)
        }
    }
}

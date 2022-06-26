//
//  ContentView.swift
//  better-weather
//
//  Created by Jenny Ho on 2022-06-25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    let color: UIColor = UIColor(red: 31/255.0,
                                 green: 31/255.0,
                                 blue: 31/255.0,
                                 alpha: 1)
    var body: some View {
    
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    //WeatherView(weather: weather)
                    WeatherView()
                } else {
                    LoadingView().task {
                        do {
                            weather = try await weatherManager
                                .getCurrentWeather(latitude: location.latitude,
                                                   longitude: location.longitude)
                        } catch {
                            print("Error getting weather: \(error)")
                        }
                    }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }.background(Color(red: 0.122, green: 0.122, blue: 0.122))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}

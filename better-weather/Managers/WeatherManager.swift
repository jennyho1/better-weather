//
//  WeatherManager.swift
//  better-weather
//
//  Created by Jenny Ho on 2022-06-25.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        let apiKey = "12345"
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric") else { fatalError("Missing URL.")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching weather data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
        
    }
}

// Model of the response body we get from calling the OpenWeather API
struct ResponseBody: Decodable {
    var weather: [WeatherResponse]
    var main: MainResponse
    var wind: WindResponse
    var clouds: CloudsResponse
    var sys: SysResponse
    var timezone: Int
    var name: String

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
    
    struct CloudsResponse: Decodable {
        var all: Double
    }
    
    struct SysResponse: Decodable {
        var type: Double
        var id: Double
        var country: String
        var sunrise: Double
        var sunset: Double
    }
    
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}

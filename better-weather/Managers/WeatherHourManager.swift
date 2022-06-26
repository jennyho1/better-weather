//
//  WeatherHourManager.swift
//  better-weather
//
//  Created by Jenny Ho on 2022-06-26.
//

import Foundation
import CoreLocation

class WeatherHourManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherHourResponseBody {
        let apiKey = "12345"
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric") else { fatalError("Missing URL.")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching weather data")}
        
        let decodedData = try JSONDecoder().decode(WeatherHourResponseBody.self, from: data)
        
        return decodedData
        
    }
}

// Model of the response body we get from calling the OpenWeather API
struct WeatherHourResponseBody: Decodable {
    var list: [WeatherHourInfo]
    var city: CityResponse
    
    struct WeatherHourInfo: Decodable {
        var dt: Double
        var main: MainResponse
        var weather: [WeatherResponse]
        var clouds: CloudsResponse
        var wind: WindResponse
    }

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
    
    struct CityResponse: Decodable {
        var name: String
        var country: String
        var timezone: Int
    }
    
}

extension WeatherHourResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}

//
//  WeatherView.swift
//  better-weather
//
//  Created by Jenny Ho on 2022-06-25.
//

import SwiftUI

struct WeatherView: View {
    var weatherNow: ResponseBody
    @EnvironmentObject var appState: AppState


    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack (alignment: .leading, spacing: 5) {
                    HStack{
                        Text(weatherNow.name).bold().font(.title)
                        Spacer()
                        Button("Today"){
                            appState.showWeatherHour = true
                        }
                        .background(Color(hue: 0.647, saturation: 1.0, brightness: 0.262))
                        .foregroundColor(.white)
                        .cornerRadius(10, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                        
                    }
                    Text("Now, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        Text(weatherNow.main.temp.roundDouble() + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                        VStack(spacing: 12.0) {
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            VStack {
                                Text(weatherNow.weather[0].main)
                                Text(weatherNow.weather[0].description)
                            }.frame(width: 150)
                        }.frame(width: 150)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .center, spacing: 10) {
                        
                        HStack{
                            Image(systemName: "sparkles")
                            Text("Feels like")
                            Image(systemName: "sparkles")
                        }
                        
                        Text(weatherNow.main.feelsLike.roundDouble() + "°")
                            .bold()
                            .font(.title)
                    }.frame(maxWidth: .infinity)
                    HStack {
                        VStack(alignment: .leading) {
                            WeatherRow(logo: "thermometer", name: "Min temp", value: "\(weatherNow.main.tempMin.roundDouble())°", valueSize: 25)
                            
                            WeatherRow(logo: "sunrise", name: "Sunrise", value: "\(weatherNow.sys.sunrise.unixToTime(timezone: weatherNow.timezone))", valueSize: 25)
                            WeatherRow(logo: "wind", name: "Wind Speed", value: "\(weatherNow.wind.speed) m/s", valueSize: 25)
                            WeatherRow(logo: "speedometer", name: "Pressure", value: "\(weatherNow.main.pressure.roundDouble()) hPa", valueSize: 25)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            WeatherRow(logo: "thermometer", name: "Max temp", value: "\(weatherNow.main.tempMax.roundDouble())°", valueSize: 25)
                            WeatherRow(logo: "sunset", name: "Sunset", value: "\(weatherNow.sys.sunset.unixToTime(timezone: weatherNow.timezone))", valueSize: 25)
                            WeatherRow(logo: "humidity", name: "Humidity", value: "\(weatherNow.main.humidity.roundDouble())%", valueSize: 25)
                            WeatherRow(logo: "cloud", name: "Cloud", value: "\(weatherNow.clouds.all.roundDouble())%", valueSize: 25)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(Color(hue: 0.614, saturation: 0.44, brightness: 0.985))
                .cornerRadius(40, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(red: 0.122, green: 0.122, blue: 0.122))
        .preferredColorScheme(.dark)
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weatherNow: previewWeather)
    }
}

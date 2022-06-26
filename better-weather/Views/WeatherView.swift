//
//  WeatherView.swift
//  better-weather
//
//  Created by Jenny Ho on 2022-06-25.
//

import SwiftUI

struct WeatherView: View {
    //var weather: ResponseBody

    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack (alignment: .leading, spacing: 5) {
                    Text("Downtown Toronto").bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        Text("26" + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                        VStack(spacing: 12.0) {
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            VStack {
                                Text("Clouds")
                                Text("overcast clouds")
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
                        
                        Text("26°")
                            .bold()
                            .font(.title)
                    }.frame(maxWidth: .infinity)
                    HStack {
                        VStack(alignment: .leading) {
                            WeatherRow(logo: "thermometer", name: "Min temp", value: "23°", valueSize: 30)
                            WeatherRow(logo: "sunrise", name: "Sunrise", value: "05:37", valueSize: 30)
                            WeatherRow(logo: "wind", name: "Wind Speed", value: "1 m/s", valueSize: 30)
                            WeatherRow(logo: "speedometer", name: "Pressure", value: "1017 hPa", valueSize: 25)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            WeatherRow(logo: "thermometer", name: "Max temp", value: "28°", valueSize: 30)
                            WeatherRow(logo: "sunset", name: "Sunset", value: "21:03", valueSize: 30)
                            WeatherRow(logo: "humidity", name: "Humidity", value: "46%", valueSize: 30)
                            WeatherRow(logo: "cloud", name: "Cloud", value: "94%", valueSize: 30)
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
        //WeatherView(weather: previewWeather)
        WeatherView()
    }
}

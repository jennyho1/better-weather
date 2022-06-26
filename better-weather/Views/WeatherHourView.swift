//
//  WeatherHourView.swift
//  better-weather
//
//  Created by Jenny Ho on 2022-06-26.
//

import SwiftUI
import SwiftUICharts

struct WeatherHourView: View {
    var weatherHour: WeatherHourResponseBody
    var weather: ResponseBody
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack (alignment: .leading, spacing: 5) {
                    HStack{
                        Text(weatherHour.city.name).bold().font(.title)
                        Spacer()
                        Button("Now"){
                            appState.showWeatherHour = false
                        }
                        .background(Color(hue: 0.647, saturation: 1.0, brightness: 0.262))
                        .foregroundColor(.white)
                        .cornerRadius(10, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                        
                    }
                    Text("Today, \(Date().formatted(.dateTime.month().day()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    
                    LineView(data: weatherHour.getFirst8TempData(), title: "Line chart").padding()
                    HStack(spacing: 15){
                        Text(weatherHour.getFirst8TimeData()[0])
                            .font(.footnote)
                        Text(weatherHour.getFirst8TimeData()[1]).font(.footnote)
                        Text(weatherHour.getFirst8TimeData()[2]).font(.footnote)
                        Text(weatherHour.getFirst8TimeData()[3]).font(.footnote)
                        Text(weatherHour.getFirst8TimeData()[4]).font(.footnote)
                        Text(weatherHour.getFirst8TimeData()[5]).font(.footnote)
                        Text(weatherHour.getFirst8TimeData()[6]).font(.footnote)
                        Text(weatherHour.getFirst8TimeData()[7]).font(.footnote)
                    }.padding()
 
                }
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(40, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                
                VStack{
                    let result = weather.getActivity()
                    Text(result.1)
                        .padding()
                        .background(Color(hue: 0.647, saturation: 1.0, brightness: 0.262))
                        .cornerRadius(10, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                    AsyncImage(url: URL(string: result.0)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                    } placeholder: {
                        ProgressView()
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 350)
                .background(Color.black)
                .cornerRadius(40, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(red: 0.122, green: 0.122, blue: 0.122))
        .preferredColorScheme(.dark)
    }
}

struct WeatherHourView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHourView(weatherHour: previewWeatherHour, weather: previewWeather)
    }
}

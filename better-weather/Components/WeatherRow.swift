//
//  WeatherRow.swift
//  better-weather
//
//  Created by Jenny Ho on 2022-06-25.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    var valueSize: CGFloat
    
    var body: some View {
        HStack(spacing: 18) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(.white)
                .cornerRadius(50)
                .foregroundColor(.gray)

            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.system(size:valueSize))
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "Min Temp", value: "8°", valueSize: 35)
    }
}

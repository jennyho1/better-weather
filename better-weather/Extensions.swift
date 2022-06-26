//
//  Extensions.swift
//  better-weather
//
//  Created by Jenny Ho on 2022-06-25.
//

import Foundation
import SwiftUI

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0.f", self)
    }
    
    func unixToTime(timezone: Int) -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: timezone)
        dateFormatter.dateFormat = "HH:mm"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
    func unixToTimeAmPm(timezone: Int) -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: timezone)
        dateFormatter.dateFormat = "HH"
        let hour = Int(dateFormatter.string(from: date))
        if let hour = hour {
            if hour <= 12 {
                return String(hour) + "am"
            }
            return String(hour-12) + "pm"
        }
        return "0"
    }
}

// Extension for adding rounded corners to specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension WeatherHourResponseBody {
    func getFirst8TempData() -> [Double] {
        
        return [round(self.list[0].main.temp), round(self.list[1].main.temp), round(self.list[2].main.temp), round(self.list[3].main.temp), round(self.list[4].main.temp), round(self.list[5].main.temp), round(self.list[6].main.temp), round(self.list[7].main.temp)]
    }
    func getFirst8TimeData() -> [String] {
        
        
        
        return [self.list[0].dt.unixToTimeAmPm(timezone: self.city.timezone),
                self.list[1].dt.unixToTimeAmPm(timezone: self.city.timezone),
                self.list[2].dt.unixToTimeAmPm(timezone: self.city.timezone),
                self.list[3].dt.unixToTimeAmPm(timezone: self.city.timezone),
                self.list[4].dt.unixToTimeAmPm(timezone: self.city.timezone),
                self.list[5].dt.unixToTimeAmPm(timezone: self.city.timezone),
                self.list[6].dt.unixToTimeAmPm(timezone: self.city.timezone),
                self.list[7].dt.unixToTimeAmPm(timezone: self.city.timezone)]
    }
}

extension ResponseBody {
    func getActivity() -> (String, String) {
        
        if self.main.humidity == 100 {
            return ("https://cdn.pixabay.com/photo/2017/01/30/14/11/cutter-2020911_1280.png",
                    "Looks like there's some light rain today. Light rain is beneficial for fishing as it stirs up surface food")
        } else if 30 < self.clouds.all && self.clouds.all < 70 && self.main.humidity < 50{
            return ("https://cdn.pixabay.com/photo/2016/11/21/03/56/landscape-1844230_1280.png", "Chances of beautiful sunset today. Medium cloud coverage, low humidity and clean air are indicators of a nice sunset view.")
        } else if self.main.temp > 25{
            return ("https://cdn.pixabay.com/photo/2013/07/13/12/18/bathing-159587_1280.png", "Hot sunny day today. Go outside, relax at the beach, remember to wear sunscreen")
        }
        return ("https://cdn.pixabay.com/photo/2012/04/01/18/02/camping-23792_1280.png", "Feeling bored? Go camping today. The weather is superb with light breeze and the sun shining.")
    }

}


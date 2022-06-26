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



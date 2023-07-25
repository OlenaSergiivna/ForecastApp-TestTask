//
//  DetailViewModel.swift
//  App
//
//

import Foundation

class DetailViewModel {
    
    let forecastItem: ForecastItem
    
    init(forecastItem: ForecastItem) {
        self.forecastItem = forecastItem
    }
    
    func formattedTemperature() -> String {
        let averageTemperature = (forecastItem.low + forecastItem.high) / 2
        return "\(averageTemperature)°C"
    }
    
    func formattedChanceOfRain() -> String {
        let chanceRain = Int(forecastItem.chanceRain * 100)
        return "\(chanceRain)%"
    }
    
    func chanceOfRainDescription() -> String {
        let chanceRain = Int(forecastItem.chanceRain * 100)
        
        switch chanceRain {
        case 0:
            return "Chance rain is zero today."
        case 1...49:
            return "Chance rain is low today."
        case 50:
            return "Chance rain is 50/50 today."
        case 51...79:
            return "Chance rain is high today."
        case 80...100:
            return "Chance rain is very high today."
        default:
            return ""
        }
    }
    
    func formattedSunriseTime() -> String {
        let sunriseHours = forecastItem.sunrise / 3600
        let sunriseMinutes = (forecastItem.sunrise % 3600) / 60
        return "\(sunriseHours):\(sunriseMinutes)"
    }
    
    func sunriseDescription() -> String {
        let sunriseHours = forecastItem.sunrise / 3600
        switch sunriseHours {
        case 3...4:
            return "Welcome the early morning sunrise today."
        case 5...6:
            return "Welcome the morning sun."
        case 7...8:
            return "Welcome the late morning sun today."
        default:
            return ""
        }
    }
    
    func formattedSunsetTime() -> String {
        let sunsetHours = forecastItem.sunset / 3600
        let sunsetMinutes = (forecastItem.sunset % 3600) / 60
        return "\(sunsetHours):\(sunsetMinutes)"
    }
    
    func sunsetDescription() -> String {
        let sunsetHours = forecastItem.sunset / 3600
        switch sunsetHours {
        case 15...17:
            return "Early sunset today, enjoy the evening."
        case 18...19:
            return "Welcome the evening sunset."
        case 20...21:
            return "Late sunset today, make the most of the day."
        default:
            return ""
        }
    }
}

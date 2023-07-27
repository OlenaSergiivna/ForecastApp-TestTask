//
//  DemoForecastNetworkServiceImpl.swift
//  App
//
//  Created by user on 26.07.2023.
//

import Foundation
import Combine

class DemoForecastNetworkServiceImpl: ForecastNetworkService {
    func getForecast() -> AnyPublisher<[ForecastItemDTO], Error> {
        
        let demoData: [ForecastItemDTO] = [
            ForecastItemDTO(day: "1", description: "Sunny", sunrise: 17280, sunset: 76440, chanceRain: 0.0, high: 30, low: 21, type: "sunny"),
            ForecastItemDTO(day: "2", description: "Cloudy", sunrise: 17340, sunset: 76440, chanceRain: 0.0, high: 31, low: 22, type: "cloudy"),
            ForecastItemDTO(day: "3", description: "Showers", sunrise: 17400, sunset: 76440, chanceRain: 0.8, high: 28, low: 19, type: "showers"),
            ForecastItemDTO(day: "4", description: "Sunny", sunrise: 17460, sunset: 76440, chanceRain: 0.0, high: 31, low: 22, type: "sunny"),
            ForecastItemDTO(day: "5", description: "Windy", sunrise: 17520, sunset: 76440, chanceRain: 0.0, high: 27, low: 18, type: "windy"),
            ForecastItemDTO(day: "6", description: "Cloudy", sunrise: 17580, sunset: 76440, chanceRain: 0.0, high: 28, low: 19, type: "cloudy"),
            ForecastItemDTO(day: "7", description: "Rain", sunrise: 17640, sunset: 76440, chanceRain: 0.7, high: 24, low: 17, type: "rain"),
            ForecastItemDTO(day: "8", description: "Sunny", sunrise: 17700, sunset: 76440, chanceRain: 0.0, high: 32, low: 23, type: "sunny"),
            ForecastItemDTO(day: "9", description: "Sunny", sunrise: 17760, sunset: 76440, chanceRain: 0.0, high: 29, low: 20, type: "sunny"),
            ForecastItemDTO(day: "10", description: "Sunny", sunrise: 17820, sunset: 76440, chanceRain: 0.0, high: 28, low: 19, type: "sunny"),
            ForecastItemDTO(day: "11", description: "Lightning", sunrise: 17880, sunset: 76440, chanceRain: 0.8, high: 26, low: 18, type: "lightning"),
            ForecastItemDTO(day: "12", description: "Sunny", sunrise: 17940, sunset: 76440, chanceRain: 0.0, high: 31, low: 22, type: "sunny"),
            ForecastItemDTO(day: "13", description: "Windy", sunrise: 18000, sunset: 76440, chanceRain: 0.3, high: 28, low: 19, type: "windy"),
            ForecastItemDTO(day: "14", description: "Sunny", sunrise: 18060, sunset: 76440, chanceRain: 0.0, high: 27, low: 18, type: "sunny"),
            ForecastItemDTO(day: "15", description: "Rain", sunrise: 18120, sunset: 76440, chanceRain: 0.9, high: 25, low: 16, type: "rain"),
            ForecastItemDTO(day: "16", description: "Sunny", sunrise: 18180, sunset: 76440, chanceRain: 0.0, high: 30, low: 21, type: "sunny"),
            ForecastItemDTO(day: "17", description: "Windy", sunrise: 18240, sunset: 76440, chanceRain: 0.2, high: 31, low: 22, type: "windy"),
            ForecastItemDTO(day: "18", description: "Overcast", sunrise: 18300, sunset: 76440, chanceRain: 0.4, high: 28, low: 19, type: "overcast"),
            ForecastItemDTO(day: "19", description: "Rain", sunrise: 18360, sunset: 76440, chanceRain: 1.0, high: 26, low: 18, type: "rain"),
            ForecastItemDTO(day: "20", description: "Sunny", sunrise: 18420, sunset: 76440, chanceRain: 0.0, high: 29, low: 20, type: "sunny")
        ]
        
        return Result.Publisher(demoData)
            .eraseToAnyPublisher()
            
    }
}


//
//  ForecastItem.swift
//  App
//
//

import Foundation

struct ForecastItem {
    let day: String
    let description: String
    let sunrise, sunset: Int
    let chanceRain: Double
    let high, low: Int
    let type: String
}

typealias ForecastItems = [ForecastItem]

extension ForecastItem {
    
    init(from forecastItemDTO: ForecastItemDTO) {
        self.day = forecastItemDTO.day
        self.description = forecastItemDTO.description
        self.sunrise = forecastItemDTO.sunrise
        self.sunset = forecastItemDTO.sunset
        self.chanceRain = forecastItemDTO.chanceRain
        self.high = forecastItemDTO.high
        self.low = forecastItemDTO.high
        self.type = forecastItemDTO.type
    }
}

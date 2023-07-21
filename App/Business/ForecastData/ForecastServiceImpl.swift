//
//  ForecastServiceImpl.swift
//  App
//
//  Created by user on 20.07.2023.
//

import Foundation
import Combine
import Global

class ForecastServiceImpl: ForecastService {
    var items: CurrentValueSubject<ForecastItems, Never> = CurrentValueSubject([])
    
    @Inject var forecastNetworkService: ForecastNetworkService
    
    private var cancellables: Set<AnyCancellable> = []
    
    func getForecastData() {
        
        forecastNetworkService.getForecast()
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: { forecastItems in
                self.items.value = forecastItems.map({ForecastItem(from: $0)})
            }
            .store(in: &cancellables)
    }
}

//
//  ListViewModel.swift
//  App
//
//

import Global
import GlobalUI
import Combine

class ListViewModel {
    @Inject var service: ForecastService
    private var bag = Set<AnyCancellable>()

    @Published var items: [ForecastItem] = []

    var showDetail: ((ForecastItem) -> Void)?

    var title: String = "Weather Forecast"

    init() {
        service.getForecastData()
        
        service.items
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .sink { [weak self] in self?.items = $0
            }
            .store(in: &bag)
    }
}

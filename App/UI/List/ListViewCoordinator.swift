//
//  ListViewCoordinator.swift
//  App
//
//

import UIKit

class ListViewCoordinator {

    weak var navigationController: UINavigationController?
    private weak var viewController: ListViewController?

    public func start(window: UIWindow) {
        let viewModel = ListViewModel()
        
        viewModel.showDetail = { forecastItem in
            guard let navigationController = self.navigationController else { return }
            let detailViewModel = DetailViewModel(forecastItem: forecastItem)
            let detailCoordinator = DetailViewCoordinator(navigationController: navigationController, viewModel: detailViewModel)
            detailCoordinator.start()
        }
        
        let viewController = ListViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController

        self.navigationController = navigationController
        self.viewController = viewController
    }
}

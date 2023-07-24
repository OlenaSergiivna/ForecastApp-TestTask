//
//  DetailViewCoordinator.swift
//  App
//
//

import UIKit

class DetailViewCoordinator {
    
    weak var navigationController: UINavigationController?
    private weak var viewController: DetailViewController?
    private var viewModel: DetailViewModel
    
    public init(navigationController: UINavigationController, viewModel: DetailViewModel) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    public func start() {
        let detailViewController = DetailViewController(viewModel: viewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

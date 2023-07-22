//
//  DetailViewCoordinator.swift
//  App
//
//

import UIKit

class DetailViewCoordinator {
    
    weak var navigationController: UINavigationController?
    private weak var viewController: DetailViewController?
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let detailViewModel = DetailViewModel()
        let detailViewController = DetailViewController(viewModel: detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

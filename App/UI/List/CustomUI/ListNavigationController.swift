//
//  ListNavigationController.swift
//  App
//
//  Created by user on 28.07.2023.
//

import UIKit

class ListNavigationController: UINavigationController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let topViewController = viewControllers.last {
            if topViewController is DetailViewController {
                return .portrait
            }
        }
        return super.supportedInterfaceOrientations
    }
}

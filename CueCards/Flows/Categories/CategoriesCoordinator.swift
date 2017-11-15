//
//  CategoriesCoordinator.swift
//  CueCards
//
//  Created by Ilya Denisov on 11/15/17.
//  Copyright © 2017 Ilya Denisov. All rights reserved.
//

import UIKit

class CategoriesCoordinator: NavigationCoordinator {
    
    override init(_ navigationController: BaseNavigationController = BaseNavigationController()) {
        super.init(navigationController)
    }
    
    // MARK: Public
    
    func start() {
        navigationController.pushViewController(createCategoriesViewController(), animated: true)
    }
    
    // MARK: Private
    
    private func createCategoriesViewController() -> CategoriesViewController {
        let viewModel = CategoriesViewModel()
        let viewController = CategoriesViewController.initialize(with: viewModel)
        return viewController
    }

    
}

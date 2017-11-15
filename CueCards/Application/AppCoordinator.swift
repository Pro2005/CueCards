//
//  AppCoordinator.swift
//  CueCards
//
//  Created by Ilya Denisov on 11/15/17.
//  Copyright © 2017 Ilya Denisov. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    private weak var window: UIWindow?
    private let navigationController: BaseNavigationController
    
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController? {
        return navigationController
    }
    
    // MARK: Initialization
    
    init(_ window: UIWindow?) {
        self.window = window
        navigationController = BaseNavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    // MARK: Public
    
    func start() {
        let coordinator = CategoriesCoordinator(navigationController)
        add(child: coordinator)
        coordinator.start()
//        navigationController.pushViewController(createCategoriesViewController(), animated: false)
    }
    
}

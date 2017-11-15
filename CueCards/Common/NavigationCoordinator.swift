//
//  NavigationCoordinator.swift
//  CueCards
//
//  Created by Ilya Denisov on 11/15/17.
//  Copyright © 2017 Ilya Denisov. All rights reserved.
//

import UIKit

protocol InitialRootViewController {
    var initialRootViewController: UIViewController? { get }
}

class NavigationCoordinator: NSObject, Coordinator {
    let navigationController: BaseNavigationController
    private var popObserver: NotificationObserver!
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController? {
        return navigationController
    }
    
    init(_ navigationController: BaseNavigationController = BaseNavigationController()) {
        self.navigationController = navigationController
        super.init()
        let notification: TypedNotification<UIViewController?> = TypedNotification(.didPopViewController)
        popObserver = NotificationObserver(notification: notification, block: {[weak self] (viewController) in
            self?.didPop(viewController: viewController)
        })
    }
    
    func didPop(viewController: UIViewController?) {
        guard let viewController = viewController else {
            return
        }
        guard let lastCoordinator = childCoordinators.last, let initialViewController = (lastCoordinator as? InitialRootViewController)?.initialRootViewController else {
            return
        }
        if initialViewController === viewController {
            willRemove(child: lastCoordinator)
            remove(child: lastCoordinator)
            didRemove(child: lastCoordinator)
        }
    }
    
    func willRemove(child: Coordinator) {
        // do nothing
    }
    
    func didRemove(child: Coordinator) {
        // do nothing
    }
    
}

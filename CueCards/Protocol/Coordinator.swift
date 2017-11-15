//
//  Coordinator.swift
//  CueCards
//
//  Created by Ilya Denisov on 11/15/17.
//  Copyright © 2017 Ilya Denisov. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var rootViewController: UIViewController? { get }
}

extension Coordinator {
    
    func add(child coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func remove(child coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter{$0 !== coordinator}
    }
    
}

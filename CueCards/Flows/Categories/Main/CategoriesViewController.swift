//
//  CategoriesViewController.swift
//  CueCards
//
//  Created by Ilya Denisov on 11/15/17.
//  Copyright © 2017 Ilya Denisov. All rights reserved.
//

import UIKit

class CategoriesViewController: BaseViewController {
    private var viewModel: CategoriesViewModel!
    @IBOutlet private weak var tableView: UITableView!
    
    static func initialize(with viewModel: CategoriesViewModel) -> CategoriesViewController  {
        let viewController = R.storyboard.categories.categoriesViewController()!
        viewController.viewModel = viewModel
        return viewController
    }
    
}

extension CategoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

extension CategoriesViewController: UITableViewDelegate {
    
}

//
//  DetailsGithubCoordinator.swift
//  Github
//
//  Created by Pablo Rosalvo de Melo Lopes on 08/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//

import UIKit

final class DetailsGithubCoordinator {
    
    private var navigation: UINavigationController
    
    init(navigation: UINavigationController = UINavigationController()) {
        self.navigation = navigation
    }
    
    func start() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let viewModel = DetailsGithubViewModel()
        let controller = DetailsGithubViewController(viewModel: viewModel, navigation: navigation)
        window.rootViewController = controller
        return window
    }
    
}

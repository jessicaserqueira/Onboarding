//
//  OmboardingViewModel.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 23/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class OnboardingViewModel {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = LoginViewModel(navigationController: navigationController)
        let viewController = LoginViewController(viewModel: viewModel)
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showLogin() {
        start()
    }
}

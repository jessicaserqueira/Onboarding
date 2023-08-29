//
//  SceneDelegate.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let onboardingCompleted = UserDefaults.standard.bool(forKey: "hasCompletedOnboarding")
        
        if onboardingCompleted {
            let loginViewController = LoginViewController()
            let navigationController = UINavigationController(rootViewController: loginViewController)
            window.rootViewController = navigationController
        } else {
            let onboardingViewController = OnboardingViewController()
            let navigationController = UINavigationController(rootViewController: onboardingViewController)
            window.rootViewController = navigationController
        }
        
        window.makeKeyAndVisible()
    }
}


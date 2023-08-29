//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, OnboardingViewDelegate {
    
    var onboardingPageVC: OnboardingPageViewController!
    var pageControl = UIPageControl()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showOnboarding()
    }
    
    func showOnboarding() {
        onboardingPageVC = OnboardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        onboardingPageVC.delegate = onboardingPageVC
        onboardingPageVC.dataSource = onboardingPageVC
        onboardingPageVC.onboardingViewDelegate = self
        addChild(onboardingPageVC)
        view.addSubview(onboardingPageVC.view)
    }
    
    func showLogin() {
        onboardingPageVC.markOnboardingAsCompleted()
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}

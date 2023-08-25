//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//
import UIKit

class OnboardingViewController: UIViewController, OnboardingViewDelegate {
    
    private var viewModel: OnboardingViewModel
    var onboardingPageVC: OnboardingPageViewController!
    var pageControl = UIPageControl()
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        onboardingPageVC.viewModel = viewModel
        onboardingPageVC.delegate = onboardingPageVC
        onboardingPageVC.dataSource = onboardingPageVC
        onboardingPageVC.onboardingViewDelegate = self
        addChild(onboardingPageVC)
        view.addSubview(onboardingPageVC.view)
    }
    
    func showLogin() {
        viewModel.start()
        onboardingPageVC.isPerformingSkipAction = false
    }
}

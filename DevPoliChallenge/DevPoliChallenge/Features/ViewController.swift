//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    var onboardingPageVC: OnboardingPageViewController!
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        showOnboarding()
    }
    
    func showOnboarding() {
        onboardingPageVC = OnboardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        addChild(onboardingPageVC)
        view.addSubview(onboardingPageVC.view)
    }
}


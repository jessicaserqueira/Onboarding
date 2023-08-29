//
//  OnboardingPageController.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 23/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {
    
    weak var onboardingViewDelegate: OnboardingViewDelegate?
    
    var pages: [UIViewController] = []
    let pageControl = UIPageControl()
    let initialPage = 0
    var isPerformingSkipAction = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
        stylePageViewController()
        layoutPageViewController()
    }
    
    func stylePageViewController() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = UIColor(red: 93/255, green: 211/255, blue: 158/255, alpha: 0.5)
        pageControl.currentPageIndicatorTintColor = DesignSystem.Colors.accent
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        pageControl.layer.cornerRadius = 6
        pageControl.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }
    
    func layoutPageViewController() {
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -22),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -26),
            pageControl.heightAnchor.constraint(equalToConstant: 30),
            pageControl.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    func markOnboardingAsCompleted() {
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
    }
}

// MARK: - Setup

extension OnboardingPageViewController {
    func createOnboardingPage(backgroundColor: UIColor, imageName: String, title: String, description: String, buttonTitle: String, buttonTextColor: UIColor, isStartButton: Bool = false) -> UIViewController {
        let onboardingView = OnboardingView()
        onboardingView.backgroundColor = backgroundColor
        onboardingView.image.image = UIImage(named: imageName)
        onboardingView.titleLabel.text = title
        onboardingView.descriptionLabel.text = description
        onboardingView.delegate = self
        
        if isStartButton {
            onboardingView.startButton.setTitle(buttonTitle, for: .normal)
            onboardingView.startButton.setTitleColor(buttonTextColor, for: .normal)
            onboardingView.startButton.backgroundColor = DesignSystem.Colors.accent
        } else {
            onboardingView.skipButton.setTitle(buttonTitle, for: .normal)
            onboardingView.skipButton.setTitleColor(buttonTextColor, for: .normal)
            onboardingView.nextButton.setImage(UIImage(named: "icon-arrow-right"), for: .normal)
        }
        
        let viewController = UIViewController()
        viewController.view = onboardingView
        return viewController
    }
    
    func setupPageViewController() {
        dataSource = self
        delegate = self
        
        let pageData: [(backgroundColor: UIColor, imageName: String, title: String, description: String, buttonTitle: String, buttonTextColor: UIColor, isStartButton: Bool)] = [
            (
                backgroundColor: DesignSystem.Colors.primary,
                imageName: "imagem1",
                title: "Explore uma nova forma de organizar sua vida.",
                description: "Descubra como nosso aplicativo pode ajudar você a planejar, acompanhar e concluir suas tarefas de maneira mais eficiente.",
                buttonTitle: "pular",
                buttonTextColor: .white,
                isStartButton: false
            ),
            (
                backgroundColor: DesignSystem.Colors.background,
                imageName: "imagem2",
                title: "Simplifique seu dia a dia.",
                description: "Com nosso app, você pode criar listas de tarefas personalizadas, definir prioridades e nunca mais perder um prazo.",
                buttonTitle: "pular",
                buttonTextColor: DesignSystem.Colors.secondary,
                isStartButton: false
            ),
            (
                backgroundColor: DesignSystem.Colors.accent,
                imageName: "imagem3",
                title: "Conquiste mais, se preocupe menos.",
                description: "Com o nosso app, suas tarefas viram conquistas. Acompanhe seu progresso, marque itens concluídos e sinta a satisfação de ver suas metas se tornarem realidade.",
                buttonTitle: "COMEÇAR",
                buttonTextColor: .white,
                isStartButton: true
            )
        ]
        
        for page in pageData {
            let onboardingPage = createOnboardingPage(
                backgroundColor: page.backgroundColor,
                imageName: page.imageName,
                title: page.title,
                description: page.description,
                buttonTitle: page.buttonTitle,
                buttonTextColor: page.buttonTextColor,
                isStartButton: page.isStartButton
            )
            pages.append(onboardingPage)
        }
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
}


// MARK: - Actions

extension OnboardingPageViewController {
    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: - DataSources

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return pages.first
        }
    }
}

// MARK: - Delegates

extension OnboardingPageViewController: UIPageViewControllerDelegate, OnboardingViewDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
    
    func showLogin() {
        onboardingViewDelegate?.showLogin()
    }
}

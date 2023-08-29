//
//  CustomScrollView.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 29/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

final class CustomScrollView: UIView {
    
    weak var onboardingViewDelegate: OnboardingViewDelegate?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: CGFloat(contentStackView.arrangedSubviews.count)),
        ])
    }
    
    public func configureViews(pageData: [(backgroundColor: UIColor, imageName: String, title: String, description: String, buttonTitle: String, buttonTextColor: UIColor, isStartButton: Bool)]) {
        contentStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

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
            contentStackView.addArrangedSubview(onboardingPage.view)
        }
    }
    
    func createOnboardingPage(backgroundColor: UIColor, imageName: String, title: String, description: String, buttonTitle: String, buttonTextColor: UIColor, isStartButton: Bool) -> UIViewController {
        let onboardingView = OnboardingView()
        onboardingView.delegate = onboardingViewDelegate
        onboardingView.configure(
            backgroundColor: backgroundColor,
            imageName: imageName,
            title: title,
            description: description,
            buttonTitle: buttonTitle,
            buttonTextColor: buttonTextColor,
            isStartButton: isStartButton
        )
        let viewController = UIViewController()
        viewController.view = onboardingView
        return viewController
    }
}

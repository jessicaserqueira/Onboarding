//
//  OnboardingView1.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 21/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//
import UIKit

class OnboardingView: UIView {
    
    weak var delegate: OnboardingViewDelegate?
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = "OnboardingView1.mainView"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
        image.accessibilityIdentifier = "OnboardingView1.image"
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var skipButton: CustomButton = {
        let button = CustomButton(
            title: "",
            font: .sfProTextRegular(ofSize: 15),
            backgroundColor: .clear,
            textColor: .white,
            cornerRadius: 0,
            accessibilityIdentifier: "OnboardingView2.nextButton"
        )
        return button
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.accessibilityIdentifier = "OnboardingView1.containerView"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProTextBold(ofSize: 22)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OnboardingView1.titleLabel"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProTextRegular(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OnboardingView1.descriptionLabel"
        return label
    }()
    
    lazy var nextButton: CustomButton = {
        let button = CustomButton(
            title: "",
            font: .systemFont(ofSize: 15),
            backgroundColor: DesignSystem.Colors.accent,
            textColor: .white,
            cornerRadius: 22,
            accessibilityIdentifier: "OnboardingView1.nextButton"
        )
        
        return button
    }()
    
    lazy var startButton: CustomButton = {
        let button = CustomButton(
            title: "",
            font: .sfProTextBold(ofSize: 15),
            backgroundColor: .clear,
            textColor: .white,
            cornerRadius: 22,
            accessibilityIdentifier: "OnboardingView.startButton"
        )
        return button
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        setupConstraints()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Constraints

extension OnboardingView {
    func configureSubviews() {
        addSubview(mainView)
        mainView.addSubview(skipButton)
        mainView.addSubview(image)
        
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(nextButton)
        containerView.addSubview(startButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            skipButton.heightAnchor.constraint(equalToConstant: 18),
            skipButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            skipButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -23),
            
            image.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 117),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            containerView.heightAnchor.constraint(equalToConstant: 318),
            containerView.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 22),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 22),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -22),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            nextButton.heightAnchor.constraint(equalToConstant: 44),
            nextButton.widthAnchor.constraint(equalToConstant: 44),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -22),
            nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -26),
            
            startButton.heightAnchor.constraint(equalToConstant: 44),
            startButton.widthAnchor.constraint(equalToConstant: 167),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -22),
            startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -26),
        ])
    }
}

// MARK: - Actions

extension OnboardingView {
    func setupActions() {
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
    }
    
    @objc func skipButtonTapped() {
        delegate?.showLogin()
        print("cliquei aqui")
    }
}

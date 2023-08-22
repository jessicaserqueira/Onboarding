//
//  OnboardingView2.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 22/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class OnboardingView2: UIView {
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Colors.background
        view.accessibilityIdentifier = "OnboardingView2.mainView"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "imagem2")
        image.accessibilityIdentifier = "OnboardingView2.image"
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("pular", for: .normal)
        button.setTitleColor(DesignSystem.Colors.secondary, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "OnboardingView2.nextButton"
        return button
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.accessibilityIdentifier = "OnboardingView2.containerView"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Simplifique seu dia a dia."
        label.font = .sfProTextBold(ofSize: 22)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OnboardingView2.titleLabel"
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Com nosso app, você pode criar listas de tarefas personalizadas, definir prioridades e nunca mais perder um prazo. Chega de confusão! Deixe-nos ajudar a tornar suas atividades diárias mais organizadas e tranquilas."
        label.font = .sfProTextRegular(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OnboardingView2.descriptionLabel"
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon-arrow-right"), for: .normal)
        button.backgroundColor = DesignSystem.Colors.accent
        button.layer.cornerRadius = 22
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "OnboardingView2.nextButton"
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

extension OnboardingView2 {
    func configureSubviews() {
        addSubview(mainView)
        mainView.addSubview(skipButton)
        mainView.addSubview(image)
        
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(nextButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            skipButton.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: -32),
            skipButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -23),
            
            image.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 117),
            image.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            
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
            nextButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant:  -22),
            nextButton.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -26)
            
        ])
    }
}

// MARK: - Actions

extension OnboardingView2 {
    func setupActions() {
        
    }
}

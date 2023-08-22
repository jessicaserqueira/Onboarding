//
//  OnboardingView3.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 22/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class OnboardingView3: UIView {
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Colors.accent
        view.accessibilityIdentifier = "OnboardingView3.mainView"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "imagem3")
        image.contentMode = .scaleAspectFit
        image.accessibilityIdentifier = "OnboardingView3.image"
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.accessibilityIdentifier = "OnboardingView3.containerView"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Conquiste mais, se preocupe menos."
        label.font = .sfProTextBold(ofSize: 22)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OnboardingView3.titleLabel"
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Com o nosso app, suas tarefas viram conquistas. Acompanhe seu progresso, marque itens concluídos e sinta a satisfação de ver suas metas se tornarem realidade. Este é o começo de uma jornada mais produtiva e realizadora!"
        label.font = .sfProTextRegular(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "OnboardingView3.descriptionLabel"
        return label
    }()
    
    private lazy var startButton: CustomButton = {
        let button = CustomButton(title: "COMEÇAR",
                                  font: .sfProTextBold(ofSize: 15),
                                  backgroundColor: DesignSystem.Colors.accent,
                                  textColor: .white,
                                  cornerRadius: 22,
                                  accessibilityIdentifier: "OnboardingView3.startButton")
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

extension OnboardingView3 {
    func configureSubviews() {
        addSubview(mainView)
        mainView.addSubview(image)
        
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(startButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            image.topAnchor.constraint(greaterThanOrEqualTo: mainView.topAnchor, constant: 139),
            image.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
            
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
            
            startButton.heightAnchor.constraint(equalToConstant: 44),
            startButton.widthAnchor.constraint(equalToConstant: 167),
            startButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant:  -22),
            startButton.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -26)
            
        ])
    }
}

// MARK: - Actions

extension OnboardingView3 {
    func setupActions() {
        
    }
}

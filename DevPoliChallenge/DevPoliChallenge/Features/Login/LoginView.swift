//
//  LoginView.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 22/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Colors.background
        view.accessibilityIdentifier = "LoginView.mainView"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Organize sua vida com facilidade e eficiência."
        label.font = .sfProTextBold(ofSize: 42)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.titleLabel"
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Antes de começar a aproveitar todos os benefícios do nosso aplicativo, faça login ou crie uma conta para desbloquear todas as funcionalidades e otimizar sua rotina diária."
        label.font = .sfProTextRegular(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.descriptionLabel"
        return label
    }()
    
    private lazy var signUPButton: CustomButton = {
        let button = CustomButton(
            title: "CRIAR CONTA",
            font: .sfProTextBold(ofSize: 16),
            backgroundColor: DesignSystem.Colors.accent,
            textColor: .white,
            cornerRadius: 22,
            accessibilityIdentifier: "LoginView.signUPButton"
        )
        return button
    }()
    
    let signINButton: CustomButton = {
        let button = CustomButton(
            title: "ENTRAR",
            font: .sfProTextBold(ofSize: 16),
            backgroundColor: DesignSystem.Colors.background,
            textColor: DesignSystem.Colors.accent,
            cornerRadius: 22,
            accessibilityIdentifier: "LoginView.signINButton"
        )
        button.layer.borderColor = DesignSystem.Colors.accent.cgColor
        button.layer.borderWidth = 2
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

extension LoginView {
    func configureSubviews() {
        addSubview(mainView)
        mainView.addSubview(titleLabel)
        mainView.addSubview(descriptionLabel)
        mainView.addSubview(signUPButton)
        mainView.addSubview(signINButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            titleLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 66),
            titleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 22),
            titleLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -22),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            signUPButton.topAnchor.constraint(greaterThanOrEqualTo: descriptionLabel.bottomAnchor, constant: 293),
            signUPButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 71),
            signUPButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -71),
            signUPButton.heightAnchor.constraint(equalToConstant: 44),
            
            signINButton.topAnchor.constraint(equalTo: signUPButton.bottomAnchor, constant: 12),
            signINButton.leadingAnchor.constraint(equalTo: signUPButton.leadingAnchor),
            signINButton.trailingAnchor.constraint(equalTo: signUPButton.trailingAnchor),
            signINButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

// MARK: - Actions

extension LoginView {
    func setupActions() {
        
    }
}

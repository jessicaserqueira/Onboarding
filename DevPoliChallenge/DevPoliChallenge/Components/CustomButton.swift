//
//  CustomButton.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 22/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    init(title: String, font: UIFont, backgroundColor: UIColor, textColor: UIColor, cornerRadius: CGFloat,  accessibilityIdentifier: String) {
        super.init(frame: .zero)
        self.accessibilityIdentifier = accessibilityIdentifier
        
        setTitle(title, for: .normal)
        titleLabel?.font = font
        setTitleColor(textColor, for: .normal)
        self.backgroundColor = backgroundColor
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

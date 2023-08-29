//
//  File.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 29/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class CustomPageControlView: UIView {
    var currentPageDotSize = CGSize(width: 37, height: 12)
    var otherPageDotSize = CGSize(width: 12, height: 12)
    var dotSpacing: CGFloat = 8
    var currentPageIndex: Int {
        didSet {
            setupDots()
        }
    }
    
    let pageCount: Int
    
    init(pageCount: Int, currentPageIndex: Int) {
        self.pageCount = pageCount
        self.currentPageIndex = currentPageIndex
        super.init(frame: .zero)
        setupDots()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDots() {
        subviews.forEach { $0.removeFromSuperview() }
        
        for index in 0..<pageCount {
            let dotView = UIView()
            dotView.layer.cornerRadius = index == currentPageIndex ? currentPageDotSize.height / 2 : otherPageDotSize.height / 2
            dotView.backgroundColor = index == currentPageIndex ?
                DesignSystem.Colors.accent :
                UIColor(red: 93/255, green: 211/255, blue: 158/255, alpha: 0.5)
            dotView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(dotView)
            
            let leadingAnchorConstraint: NSLayoutAnchor<NSLayoutXAxisAnchor>
            if index == 0 {
                leadingAnchorConstraint = leadingAnchor
            } else {
                leadingAnchorConstraint = subviews[index - 1].trailingAnchor
            }
            
            NSLayoutConstraint.activate([
                dotView.widthAnchor.constraint(equalToConstant: index == currentPageIndex ? currentPageDotSize.width : otherPageDotSize.width),
                dotView.heightAnchor.constraint(equalToConstant: index == currentPageIndex ? currentPageDotSize.height : otherPageDotSize.height),
                dotView.centerYAnchor.constraint(equalTo: centerYAnchor),
                dotView.leadingAnchor.constraint(equalTo: leadingAnchorConstraint, constant: index == currentPageIndex ? 8 : dotSpacing)
            ])
        }
    }
}

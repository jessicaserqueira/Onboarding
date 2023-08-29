//
//  CustomPageController.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 29/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class CustomPageControl: UIPageControl {
    
    override var currentPage: Int {
        didSet {
            updateDots()
        }
    }
    
    var activeDotSize: CGSize = CGSize(width: 77, height: 12)
    var inactiveDotSize: CGSize = CGSize(width: 12, height: 12)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateDots()
    }
    
    private func updateDots() {
        for (index, dot) in self.subviews.enumerated() {
            let dotSize = index == currentPage ? activeDotSize : inactiveDotSize
            dot.layer.cornerRadius = dotSize.width / 2
            dot.frame.size = dotSize
        }
    }
}

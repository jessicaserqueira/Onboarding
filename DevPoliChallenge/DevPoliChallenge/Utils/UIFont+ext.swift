//
//  UIFont+ext.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 21/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

extension UIFont {
    static func sfProTextRegular(ofSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: "SF-Pro-Text-Regular", size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    static func sfProTextMedium(ofSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: "RSF-Pro-Text-Medium", size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    static func sfProTextBold(ofSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: "SF-Pro-Text-Bold", size: size) {
            return font
        } else {
            return UIFont.boldSystemFont(ofSize: size)
        }
    }
}

//
//  LoginViewController.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 23/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var customView: LoginView
    
    init() {
        self.customView = LoginView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
    }
}

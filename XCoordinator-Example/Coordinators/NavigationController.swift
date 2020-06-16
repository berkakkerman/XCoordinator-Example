//
//  NavigationController.swift
//  XCoordinator-Example
//
//  Created by Berk Akkerman on 15.06.2020.
//  Copyright © 2020 QuickBird Studios. All rights reserved.
//

import Foundation
import UIKit

class MyNavigationController: UINavigationController {
    
    var leftBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Left Item", style: .plain, target: self, action: #selector(leftAction))
        barButtonItem.tintColor = .systemIndigo
        return barButtonItem
    }()
    
    var rightBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Right Item", style: .plain, target: self, action: #selector(rightAction))
        barButtonItem.tintColor = .systemTeal
        return barButtonItem
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    func setupView() {
        self.navigationBar.barStyle = .black
        self.navigationBar.isTranslucent = true
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationBar.barTintColor =  #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
        if let controller = self.visibleViewController {
            controller.navigationItem.leftBarButtonItem = leftBarButtonItem
            controller.navigationItem.rightBarButtonItem = rightBarButtonItem
        }
    }
}

// MARK: Actions
extension MyNavigationController {
    
    @objc func leftAction() {
        debugPrint("leftAction")
    }
    
    @objc func rightAction() {
        debugPrint("rightAction")
    }
}

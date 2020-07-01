//
//  NavigationController.swift
//  XCoordinator-Example
//
//  Created by Berk Akkerman on 15.06.2020.
//  Copyright © 2020 QuickBird Studios. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Action
import XCoordinator

class MyNavigationController: UINavigationController {
    
    var router: StrongRouter<UserListRoute>!
    
    var leftBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Users", style: .plain, target: nil, action: nil)
        barButtonItem.tintColor = .white
        return barButtonItem
    }()
    
    var rightBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: nil, action: nil)
        barButtonItem.tintColor = .white
        return barButtonItem
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        /*
         // If buttons wanted in pushed view controllers also
         setupView()
         */
    }
    
    func setupView() {
        self.navigationBar.barStyle = .black
        self.navigationBar.isTranslucent = true
        self.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .strokeColor: UIColor.systemIndigo,
            .font: UIFont.boldSystemFont(ofSize: 25)
        ]
        self.navigationBar.barTintColor =  #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
        leftBarButtonItem.rx.action = CocoaAction { [unowned self] _ in
            self.router.rx.trigger(.users)
        }
        rightBarButtonItem.rx.action = CocoaAction { [unowned self] _ in
            self.router.rx.trigger(.logout)
        }
        
        if let controller = self.visibleViewController {
            controller.navigationItem.leftBarButtonItem = leftBarButtonItem
            controller.navigationItem.rightBarButtonItem = rightBarButtonItem
        }
    }
}

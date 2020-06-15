//
//  HomeTabCoordinator.swift
//  XCoordinator-Example
//
//  Created by Joan Disho on 04.05.18.
//  Copyright © 2018 QuickBird Studios. All rights reserved.
//

import UIKit
import XCoordinator

enum HomeRoute: Route {
    case news
    case userList
    case bestUser
}

class HomeTabCoordinator: TabBarCoordinator<HomeRoute> {

    // MARK: Stored properties

    private let newsRouter: StrongRouter<NewsRoute>
    private let userListRouter: StrongRouter<UserListRoute>

    // MARK: Initialization

    convenience init() {
        let newsCoordinator = NewsCoordinator()
        newsCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        
        let userListCoordinator = UserListCoordinator()
        userListCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        self.init(newsRouter: newsCoordinator.strongRouter,
                  userListRouter: userListCoordinator.strongRouter)
    }

    init(newsRouter: StrongRouter<NewsRoute>,
         userListRouter: StrongRouter<UserListRoute>) {
        self.newsRouter = newsRouter
        self.userListRouter = userListRouter

        super.init(tabs: [newsRouter, userListRouter], select: newsRouter)
        self.addBestUserButton(target: self, action: #selector(navAction))
    }

    // MARK: Overrides

    override func prepareTransition(for route: HomeRoute) -> TabBarTransition {
        switch route {
        case .news:
            return .select(newsRouter)
        case .userList:
            return .select(userListRouter)
        case .bestUser:
            let coordinator = UserCoordinator(user: "Berk")
            return .present(coordinator, animation: .default)
        }
    }
    
    @objc func navAction() {
        self.trigger(.bestUser)
    }

}

extension TabBarCoordinator {
    
    func addBestUserButton(title: String? = "Best User", style: UIBarButtonItem.Style = .plain, target: Any?, action: Selector?) {
        for viewController in self.rootViewController.viewControllers ?? [] {            
            viewController.children.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: target, action: action)
        }
    }
}

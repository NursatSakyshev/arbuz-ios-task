//
//  TabViewController.swift
//  arbuz-ios-task
//
//  Created by Nursat Sakyshev on 21.05.2024.
//

import UIKit
import SwiftUI

enum Tabs: Int {
    case home
    case cart
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inActive
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let homeView = HomeView()
        
        let hostingVC = UIHostingController(rootView: homeView)
        let mainNavigation = UINavigationController(rootViewController: hostingVC)
        let cartViewController = CartViewController()
        let cartNavigation = UINavigationController(rootViewController: cartViewController)
        
        mainNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.home, image: Resources.Images.TabBar.home, tag: Tabs.home.rawValue)
        cartNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.cart, image: Resources.Images.TabBar.cart, tag: Tabs.cart.rawValue)
       
        setViewControllers([
            mainNavigation,
            cartNavigation
        ], animated: true)
    }
}

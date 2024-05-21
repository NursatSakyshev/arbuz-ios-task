//
//  Resources.swift
//  arbuz-ios-task
//
//  Created by Nursat Sakyshev on 21.05.2024.
//

import UIKit

enum Resources {
    enum Colors {
        static var active = UIColor.black
        static var inActive = UIColor.white
        static var separator = UIColor.gray
    }
    
    enum Strings {
        enum TabBar {
            static var home = "Home"
            static var cart = "Cart"
        }
    }
    
    enum Images {
        enum TabBar {
            static var home = UIImage(systemName: "house.fill")
            static var cart = UIImage(systemName: "cart.fill")
        }
    }
}


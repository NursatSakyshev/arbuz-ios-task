//
//  Product.swift
//  arbuz-ios-task
//
//  Created by Nursat Sakyshev on 21.05.2024.
//

import Foundation
import SwiftUI

struct Product: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var price: Int
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    init(name: String, price: Int, description: String, isFavorite: Bool, imageName: String) {
        self.name = name
        self.price = price
        self.description = description
        self.isFavorite = isFavorite
        self.imageName = imageName
    }
}


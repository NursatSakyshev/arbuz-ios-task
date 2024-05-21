//
//  ProductDetailViewModel.swift
//  arbuz-ios-task
//
//  Created by Nursat Sakyshev on 21.05.2024.
//

import Foundation
import UIKit
import SwiftUI

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product?
    @Published var isLoading = false
    private var productId: UUID
    
    init(productId: UUID) {
        self.productId = productId
    }
    
    func loadProduct() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if let loadedProduct = products.first(where: { $0.id == self.productId }) {
                self.product = loadedProduct
            }
            self.isLoading = false
        }
    }
}



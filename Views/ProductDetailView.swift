//
//  ProductDetailView.swift
//  arbuz-ios-task
//
//  Created by Nursat Sakyshev on 21.05.2024.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel
    
    init(productId: UUID) {
        viewModel = ProductDetailViewModel(productId: productId)
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            }
            else {
                if let product = viewModel.product {
                    product.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Text(product.name)
                        .font(.system(size: 30, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Button {} label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 40)
                                .frame(width: 200, height: 40)
                                .foregroundColor(.green)
                            Text("Добавить в корзину")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadProduct()
        }
    }
    
}

//#Preview {
//    ProductDetailView()
//}


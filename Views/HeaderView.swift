//
//  HeaderView.swift
//  arbuz-ios-task
//
//  Created by Nursat Sakyshev on 21.05.2024.
//

import SwiftUI

struct HeaderView: View {
    var product: Product
    var body: some View {
        GeometryReader { geomety in
            product.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: geomety.size.width,
                    height: geomety.size.height
                )
                .offset(y: -geomety.frame(in: .global).minY * 0.8)
        }
        .onTapGesture {
            showDetailView(productId: product.id)
        }
    }
}

#Preview {
    HeaderView(product: products[8])
}

//
//  CartProductView.swift
//  arbuz-ios-task
//
//  Created by Nursat Sakyshev on 21.05.2024.
//

import SwiftUI

struct CartProductView: View {
    var product: Product
    var body: some View {
        HStack(alignment: .top) {
            product.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12)
                .frame(width: 120)
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.system(size: 15))
                    .lineLimit(2)
                Text("\(product.price) ₸/шт")
                    .lineLimit(1)
                    .foregroundColor(.gray)
                Text("• \(orders[product]!) шт")
                    .foregroundColor(.green)
            }
            Spacer()
        }
    }
}

//#Preview {
//    CartProductView(product: products[])
//}


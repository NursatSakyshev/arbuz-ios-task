//
//  ProductCardView.swift
//  arbuz-ios-task
//
//  Created by Nursat Sakyshev on 21.05.2024.
//

import SwiftUI

struct ProductCardView: View {
    @State var quantity = 0
    @State var isFavorite = false
    var product: Product
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                product.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .font(.system(size: 20))
                    .foregroundColor(isFavorite ? .red : .black)
                    .padding(5)
                    .onTapGesture {
                        isFavorite.toggle()
                    }
                
            }
            Text(product.name)
                .lineLimit(2)
            HStack {
                Text(quantity == 0 ? "\(product.price) ₸/шт" : "\(product.price * quantity) ₸")
                    .lineLimit(1)
                    .foregroundColor(.gray)
                Spacer()
                if quantity == 0 {
                    Text("• 1 шт")
                        .foregroundColor(.green)
                }
            }
            button
                .frame(width: 115)
        }
        .onTapGesture {
            showDetailView(productId: product.id)
        }
        .font(.system(size: 13))
    }
    
    var button: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .frame(height: 40)
                .foregroundColor(quantity == 0 ? .gray : .green)
                .opacity(quantity == 0 ? 0.4 : 1)
            HStack {
                if quantity > 0 {
                    Button(action: {
                        quantity -= 1
                        if quantity == 0 {
                            orders[product] = nil
                        }
                        else {
                            orders[product] = quantity
                        }
                    }, label: {
                        Image(systemName: "minus")
                    })
                    .foregroundColor(.white)
                    Spacer()
                }
                Text(quantity == 0 ? "\(product.price) ₸" : "\(quantity)")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(quantity == 0 ? .black : .white)
                Spacer()
                Button(action: {
                    quantity += 1
                    orders[product] = quantity
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(quantity == 0 ? .green : .white)
                })
            }
            .font(.system(size: 20, weight: .bold))
            .padding(10)
        }
    }
}


#Preview {
    ProductCardView(product: products[0])
        .frame(width: 115)
}

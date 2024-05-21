//
//  HomeView.swift
//  arbuz-ios-task
//
//  Created by Nursat Sakyshev on 21.05.2024.
//


import SwiftUI

struct HomeView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            HeaderView(product: products[8])
                .frame(height: 300)
            VStack(alignment: .leading) {
                //TODO: header for products
                Text("Для Firends")
                    .font(.system(size: 25, weight: .semibold))
                    .padding()
                LazyVGrid(columns: columns) {
                    ForEach(products.prefix(6)) { product in
                        ProductCardView(product: product)
                    }
                }
                .padding(10)
                
                Text("Новинки для вас")
                    .font(.system(size: 25, weight: .semibold))
                    .padding()
                
                horizontalScrollRow
            }
            .background(Color.white)
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    var horizontalScrollRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(products.dropFirst(6)) { product in
                    ProductCardView(product: product)
                        .frame(width: 150)
                }
            }
        }
    }
}


#Preview {
    HomeView()
}

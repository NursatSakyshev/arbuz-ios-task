//
//  CollectionViewCell.swift
//  arbuz-ios-task
//
//  Created by Nursat Sakyshev on 21.05.2024.
//

import UIKit
import SwiftUI

class CollectionViewCell: UICollectionViewCell {
    private var hostingController: UIHostingController<CartProductView>?
    
    func configure(product: Product) {
        hostingController?.view.removeFromSuperview()
        
        let swiftUIView = CartProductView(product: product)
        let hostingController = UIHostingController(rootView: swiftUIView)
        hostingController.view.backgroundColor = .clear
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(hostingController.view)
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        self.hostingController = hostingController
    }
}


struct SwiftUICellWrapper: UIViewRepresentable {
    var name: String
    
    func makeUIView(context: Context) -> UIView {
        let hostingController = UIHostingController(rootView: ProductCardView(product: products[0]))
        return hostingController.view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}


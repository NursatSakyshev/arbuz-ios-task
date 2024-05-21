//
//  ViewController.swift
//  arbuz-ios-task
//
//  Created by Nursat Sakyshev on 21.05.2024.
//

import UIKit

import UIKit
import SwiftUI

class CartViewController: UIViewController {
    
    var freeDeliveryPrice = 8000
    var deliveryPrice = 5000
    
    lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Cart is empty"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var paymentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Перейти к оплате", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 73/255, green: 149/255, blue: 35/255, alpha: 1)
        button.addTarget(self, action: #selector(payment(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var freeDeliveryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = true
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        configureCollectionView()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
        updateUI()
    }
    
    func setupViews() {
        [paymentButton, collectionView, totalLabel, freeDeliveryLabel, emptyLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "dataCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func updateUI() {
        let totalCount = getTotal().0
        let totalPrice = getTotal().1
        totalLabel.text = "\(totalCount) товаров: \(totalPrice) Т"
        
        if getTotal().1 < freeDeliveryPrice {
            freeDeliveryLabel.text = "Необходимая сумма для бесплатной доставки: \(8000-totalPrice)"
            totalLabel.text = "\(totalCount) товаров(с доставкой): \(totalPrice + deliveryPrice) Т"
        }
        else {
            freeDeliveryLabel.text = "Бесплатная доставка"
            totalLabel.text = "\(totalCount) товаров: \(totalPrice) Т"
        }
        
        if totalCount == 0 {
            totalLabel.isHidden = true
            freeDeliveryLabel.isHidden = true
            paymentButton.isHidden = true
            emptyLabel.isHidden = false
        }
        else {
            totalLabel.isHidden = false
            freeDeliveryLabel.isHidden = false
            paymentButton.isHidden = false
            emptyLabel.isHidden = true
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            emptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            totalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            totalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            totalLabel.bottomAnchor.constraint(equalTo: paymentButton.topAnchor, constant: -5),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: freeDeliveryLabel.topAnchor, constant: -8),
            
            freeDeliveryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            freeDeliveryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            freeDeliveryLabel.bottomAnchor.constraint(equalTo: totalLabel.topAnchor, constant: -5),
            
            paymentButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            paymentButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            paymentButton.heightAnchor.constraint(equalToConstant: 50),
            paymentButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    func getTotal() -> (Int, Int) {
        var totalCount = 0
        var totalPrice = 0
        for order in orders {
            totalCount += order.value
            totalPrice += order.key.price * order.value
        }
        
        return (totalCount, totalPrice)
    }
    
    @objc func payment(_ sender: UIButton) {
        sender.loadingIndicator(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            sender.loadingIndicator(false)
            let vc = PaymentViewController()
            let navVC = UINavigationController(rootViewController: vc)
            self.navigationController?.present(navVC, animated: true)
        }
    }
}

extension CartViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! CollectionViewCell
        let product = Array(orders.keys)[indexPath.item]
        cell.configure(product: product)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}


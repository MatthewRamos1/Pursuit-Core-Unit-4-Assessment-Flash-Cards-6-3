//
//  SearchView.swift
//  Unit4Assessment
//
//  Created by Matthew Ramos on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    public lazy var collectionView: UICollectionView = {
     let layout = UICollectionViewFlowLayout()
     layout.scrollDirection = .vertical
     let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
     cv.backgroundColor = .systemGreen
     return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

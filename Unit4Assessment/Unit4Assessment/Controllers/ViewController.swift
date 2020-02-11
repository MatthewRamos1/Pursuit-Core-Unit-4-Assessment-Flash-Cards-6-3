//
//  ViewController.swift
//  Unit4Assessment
//
//  Created by Alex Paul on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class ViewController: UIViewController {
    
    public var dataPersistence: DataPersistence<Card>!
    private let mainView = MainView()
    
    private var cards = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cardCell")
        fetchSavedCards()
        
    }
    
    override func loadView() {
        view = mainView
    }
    
    private func fetchSavedCards() {
            do {
                cards = try dataPersistence.loadItems()
            } catch {
                showAlert(title: "Error", message: "Couldn't load cards: \(error)")
            }
        }
    }


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainView.collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize = UIScreen.main.bounds
        let width = maxSize.width - 16
        let height = maxSize.height * 0.30
        return CGSize(width: width, height: height)
    }
}

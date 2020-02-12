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
    
    private var cards = [Card]() {
        didSet {
            mainView.collectionView.reloadData()
            if cards.isEmpty {
                mainView.collectionView.backgroundView = EmptyView(title: "Saved Flash Cards", message: "You haven't saved any flash cards. Check out the search tab to look through preexisting questions, or use the create tab to create your own!")
            } else {
                mainView.collectionView.backgroundView = nil
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cardCell")
        fetchSavedCards()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
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

extension ViewController: CardCellDelegate {
    func didSelectMoreButton(_ cardCell: CardCell, _ card: Card) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { alertAction in
            self.deleteCard(card: card)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        present(alertController, animated: true)
    }
    
    private func deleteCard(card: Card) {
        guard let index = cards.firstIndex(of: card) else {
            return
        }
        do {
            try dataPersistence.deleteItem(at: index)
            fetchSavedCards()
        } catch {
            showAlert(title: "Error", message: "Couldn't delete item: \(error)")
        }
    }

    
    
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainView.collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCell else {
            fatalError("Error: Couldn't downcast cell")
        }
        let card = cards[indexPath.row]
        cell.backgroundColor = .white
        cell.configureCell(card: card)
        cell.delegate = self
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

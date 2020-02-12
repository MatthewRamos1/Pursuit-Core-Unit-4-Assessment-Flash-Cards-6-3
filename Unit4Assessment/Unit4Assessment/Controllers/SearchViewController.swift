//
//  SearchViewController.swift
//  Unit4Assessment
//
//  Created by Matthew Ramos on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class SearchViewController: UIViewController {
    
    public var dataPersistence: DataPersistence<Card>!
    private var searchView = SearchView()
    
    private var cards = [Card]() {
        didSet {
            DispatchQueue.main.async {
                self.searchView.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.collectionView.dataSource = self
        searchView.collectionView.delegate = self
        searchView.collectionView.register(SearchCell.self, forCellWithReuseIdentifier: "searchCell")
        getCards()

    }
    
    override func loadView() {
        view = searchView
    }
 
    func getCards() {
        FlashCardAPIClient.fetchCards { [weak self] (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Error", message: "Couldn't access online flash cards: \(appError)")
                }
            case .success(let onlineCards):
                self?.cards = onlineCards
            }
        }
    }

}

extension SearchViewController: SearchCellDelegate {
    func didSelectSaveButton(_ searchCell: SearchCell, _ card: Card) {
        let card = Card(id: searchCell.currentCard.id, quizTitle: searchCell.currentCard.quizTitle, facts: searchCell.currentCard.facts)
        if dataPersistence.hasItemBeenSaved(card) {
            return
        } else {
            do {
                try dataPersistence.createItem(card)
                showAlert(title: "Success", message: "Flash card has been saved.")
                
            } catch {
                showAlert(title: "Error", message: "Could not save article: \(error)")
            }
        }
    }
    
    
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchView.collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as? SearchCell else {
            fatalError("Error: Couldn't downcast cell")
        }
        let card = cards[indexPath.row]
        cell.backgroundColor = .white
        cell.configureCell(card: card)
        cell.delegate = self
        return cell
    }
    
    
}
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize = UIScreen.main.bounds
        let width = maxSize.width - 16
        let height = maxSize.height * 0.30
        return CGSize(width: width, height: height)
    }
}

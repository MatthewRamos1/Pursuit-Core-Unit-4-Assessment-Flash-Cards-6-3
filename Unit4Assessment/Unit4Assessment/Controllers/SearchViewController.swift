//
//  SearchViewController.swift
//  Unit4Assessment
//
//  Created by Matthew Ramos on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var searchView = SearchView()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.collectionView.dataSource = self

    }
    
    override func loadView() {
        view = searchView
    }
 

}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath)
        return cell
    }
    
    
}

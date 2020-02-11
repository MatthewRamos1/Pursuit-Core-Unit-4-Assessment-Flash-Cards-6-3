//
//  TabBarController.swift
//  Unit4Assessment
//
//  Created by Matthew Ramos on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class TabBarController: UITabBarController {
    
    private let dataPersistence = DataPersistence<Card>(filename: "cardData.plist")
    
    private lazy var viewController: ViewController = {
        let vc = ViewController()
        vc.tabBarItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "questionmark"), tag: 0)
        vc.dataPersistence = dataPersistence
        return vc
    }()
    
    private lazy var cardCreateViewController: CardCreateViewController = {
        let vc = CardCreateViewController()
        vc.tabBarItem = UITabBarItem(title: "Create", image: UIImage(systemName: "square.and.pencil"), tag: 1)
        vc.dataPersistence = dataPersistence
        return vc
    }()
    
    private lazy var searchViewController: SearchViewController = {
        let vc = SearchViewController()
        vc.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        vc.dataPersistence = dataPersistence
        return vc
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [viewController, cardCreateViewController, searchViewController]

    }
   
}

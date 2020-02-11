//
//  TabBarController.swift
//  Unit4Assessment
//
//  Created by Matthew Ramos on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    private lazy var viewController: ViewController = {
        let vc = ViewController()
        vc.tabBarItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "questionmark"), tag: 0)
        return vc
    }()
    
    private lazy var searchViewController: SearchViewController = {
        let vc = SearchViewController()
        vc.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        return vc
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [viewController, searchViewController]

    }
   
}

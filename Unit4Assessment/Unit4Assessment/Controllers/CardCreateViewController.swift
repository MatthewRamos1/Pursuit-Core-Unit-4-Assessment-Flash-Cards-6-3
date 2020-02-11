//
//  CardCreateViewController.swift
//  Unit4Assessment
//
//  Created by Matthew Ramos on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class CardCreateViewController: UIViewController {
    
    public var dataPersistence: DataPersistence<Card>!
    private let createCardView = CreateCardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

    }
    
    override func loadView() {
        view = createCardView
    }

}

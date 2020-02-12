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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(saveCardButtonPressed(_:)))
        navigationItem.title = "Create Quiz"
    }
    
    override func loadView() {
        view = createCardView
    }
    
    
    @objc
    func saveCardButtonPressed(_ sender: UIBarButtonItem) {
        let card = Card(id: "0", quizTitle: createCardView.textField.text ?? "", facts: [createCardView.textView1.text, createCardView.textView2.text])
        if dataPersistence.hasItemBeenSaved(card) {
            showAlert(title: "Did Not Save", message: "This flash card already exists.")
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

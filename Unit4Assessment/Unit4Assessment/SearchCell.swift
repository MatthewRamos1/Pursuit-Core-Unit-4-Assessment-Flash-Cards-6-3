//
//  SearchCell.swift
//  Unit4Assessment
//
//  Created by Matthew Ramos on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

protocol SearchCellDelegate: AnyObject {
    func didSelectMoreButton(_ searchCell: SearchCell, _ card: Card)
}


class SearchCell: UICollectionViewCell {
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Question Prompt"
        return label
    }()
    
    private lazy var longPressGesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer()
        gesture.addTarget(self, action: #selector(didLongPress(_:)))
        return gesture
    }()

    public lazy var moreButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(moreButtonPressed(_:)), for: .touchUpInside)
        button.setImage(UIImage(systemName: "plus.rectangle.fill.on.rectangle.fill"), for: .normal)
        return button
    }()
    
    private lazy var isShowingQuestion = true
    private var currentCard: Card!
    
    weak var delegate: SearchCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
    }
    
     @objc
       private func didLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
           if isShowingQuestion {
               questionLabel.text = (currentCard.facts.first ?? "") + (currentCard.facts.last ?? "")
               isShowingQuestion = false
           } else {
               questionLabel.text = currentCard.quizTitle
               isShowingQuestion = true
           }
       }
       
       @objc
       private func moreButtonPressed(_ sender: UIButton) {
           delegate?.didSelectMoreButton(self, currentCard)
       }
           
       private func setupLabel() {
           addSubview(questionLabel)
           questionLabel.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               questionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
               questionLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
           ])
       }
       
       private func setupMoreButton() {
          addSubview(moreButton)
           moreButton.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               moreButton.topAnchor.constraint(equalTo: topAnchor),
               moreButton.trailingAnchor.constraint(equalTo: trailingAnchor),
               moreButton.heightAnchor.constraint(equalToConstant: 40),
               moreButton.widthAnchor.constraint(equalTo: heightAnchor)
           ])
       }
       
       public func configureCell(card: Card) {
           currentCard = card
           questionLabel.text = currentCard.quizTitle
       }
    
}

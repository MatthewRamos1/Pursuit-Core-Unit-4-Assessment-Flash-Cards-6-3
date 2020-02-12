//
//  SearchCell.swift
//  Unit4Assessment
//
//  Created by Matthew Ramos on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

protocol SearchCellDelegate: AnyObject {
    func didSelectSaveButton(_ searchCell: SearchCell, _ card: Card)
}


class SearchCell: UICollectionViewCell {
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Question Prompt"
        label.numberOfLines = 4
        label.textAlignment = .center
        return label
    }()
    
    private lazy var longPressGesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer()
        gesture.addTarget(self, action: #selector(didLongPress(_:)))
        return gesture
    }()
    
    public lazy var saveButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(saveButtonPressed(_:)), for: .touchUpInside)
        button.setImage(UIImage(systemName: "plus.rectangle.fill.on.rectangle.fill"), for: .normal)
        return button
    }()
    
    private lazy var isShowingQuestion = true
    public var currentCard: Card!
    
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
        setupLabel()
        setupSaveButton()
        addGestureRecognizer(longPressGesture)
    }
    
    @objc
    private func didLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            return
        }
        if isShowingQuestion {
            animate(isShowingQuestion)
            isShowingQuestion = false
        } else {
            animate(isShowingQuestion)
            isShowingQuestion = true
        }
    }
    
    private func animate(_ input: Bool) {
        let duration = 1.0
        if input {
            UIView.transition(with: self, duration: duration, options: [.transitionFlipFromRight], animations: {
                self.questionLabel.text = (self.currentCard.facts.first ?? "") + "    " + (self.currentCard.facts.last ?? "")
            }, completion: nil)
        } else {
            UIView.transition(with: self, duration: duration, options: [.transitionFlipFromLeft], animations: {
                self.questionLabel.text = self.currentCard.quizTitle
            }, completion: nil)
        }
    }
    
    
    
    @objc
    private func saveButtonPressed(_ sender: UIButton) {
        delegate?.didSelectSaveButton(self, currentCard)
    }
    
    private func setupLabel() {
        addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            questionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func setupSaveButton() {
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: topAnchor),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            saveButton.widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    public func configureCell(card: Card) {
        currentCard = card
        questionLabel.text = currentCard.quizTitle
    }
    
}

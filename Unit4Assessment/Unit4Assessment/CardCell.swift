//
//  CardCell.swift
//  Unit4Assessment
//
//  Created by Matthew Ramos on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

protocol CardCellDelegate: AnyObject {
    func didSelectMoreButton(_ cardCell: CardCell, _ card: Card)
}


class CardCell: UICollectionViewCell {
    
    
    private lazy var longPressGesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer()
        gesture.addTarget(self, action: #selector(didLongPress(_:)))
        return gesture
    }()

    public lazy var moreButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(moreButtonPressed(_:)), for: .touchUpInside)
        button.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        return button
    }()
    
    private var isShowingQuestion = true
    private var currentCard: Card!
    
    weak var delegate: CardCellDelegate?
    
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
    private func didLongPress(_ gestureRecognizer: UIGestureRecognizer) {
        if isShowingQuestion {
            
            isShowingQuestion = false
        } else {
            
            isShowingQuestion = true
        }
    }
    
    @objc
    private func moreButtonPressed(_ sender: UIButton) {
        delegate?.didSelectMoreButton(self, currentCard)
    }
        
    private func setup() {
        
    }
    
    public func configureCell(card: Card) {
        currentCard = card
    }
    
    
    
}


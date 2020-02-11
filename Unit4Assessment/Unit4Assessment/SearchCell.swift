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
    
    private lazy var isShowingQuestion = true
    
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
        
    }
    
    private func animate(_ input: Bool) {
        if input {
            
        } else {
            
        }
    }
    
    private func setup() {
        
    }
    
    
    
}

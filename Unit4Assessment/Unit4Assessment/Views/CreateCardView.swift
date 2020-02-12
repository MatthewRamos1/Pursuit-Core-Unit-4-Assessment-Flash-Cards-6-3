//
//  CreateCardView.swift
//  Unit4Assessment
//
//  Created by Matthew Ramos on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CreateCardView: UIView {

    public lazy var questionTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Type flash card question here"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    public lazy var textFieldFact1: UITextField = {
        let tv1 = UITextField()
        tv1.placeholder = "Enter quiz fact"
        tv1.backgroundColor = .lightGray
        return tv1
    }()
    
    public lazy var textFieldFact2: UITextField = {
        let tv2 = UITextField()
        tv2.placeholder = "Enter quiz fact"
        tv2.backgroundColor = .lightGray
        return tv2
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupTextField()
        setupTextView1()
        setupTextView2()
    }
    
    func setupTextField() {
        addSubview(questionTextField)
        questionTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            questionTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            questionTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
    
    func setupTextView1() {
        addSubview(textFieldFact1)
        textFieldFact1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFieldFact1.topAnchor.constraint(equalTo: questionTextField.bottomAnchor, constant: 8),
            textFieldFact1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            textFieldFact1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textFieldFact1.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2)
        ])
    }
    
    func setupTextView2() {
        addSubview(textFieldFact2)
        textFieldFact2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFieldFact2.topAnchor.constraint(equalTo: textFieldFact1.bottomAnchor, constant: 8),
            textFieldFact2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            textFieldFact2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textFieldFact2.heightAnchor.constraint(equalTo: textFieldFact1.heightAnchor)
        ])
    }
    
    
    

}

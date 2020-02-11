//
//  CreateCardView.swift
//  Unit4Assessment
//
//  Created by Matthew Ramos on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CreateCardView: UIView {

    public lazy var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Type flash card question here"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    public lazy var textView1: UITextView = {
        let tv1 = UITextView()
        tv1.text = "Quiz fact 1"
        tv1.backgroundColor = .lightGray
        return tv1
    }()
    
    public lazy var textView2: UITextView = {
        let tv2 = UITextView()
        tv2.text = "Quiz fact 2"
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
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
    
    func setupTextView1() {
        addSubview(textView1)
        textView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView1.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8),
            textView1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            textView1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textView1.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2)
        ])
    }
    
    func setupTextView2() {
        addSubview(textView2)
        textView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView2.topAnchor.constraint(equalTo: textView1.bottomAnchor, constant: 8),
            textView2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            textView2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textView2.heightAnchor.constraint(equalTo: textView1.heightAnchor)
        ])
    }
    
    
    

}

//
//  Unit4AssessmentTests.swift
//  Unit4AssessmentTests
//
//  Created by Alex Paul on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import XCTest
@testable import Unit4Assessment

class Unit4AssessmentTests: XCTestCase {
    
    func testCardData() {
        let jsonData = """
{
    "cardListType": "q and a",
    "apiVersion": "1.2.3",
    "cards": [
        {
            "id": "1",
            "cardTitle": "What is the difference between a synchronous & an asynchronous task?",
            "facts": [
                "Synchronous: waits until the task have completed.",
                "Asynchronous: completes a task in the background and can notify you when complete."
            ]
        },
        {
            "id": "2",
            "cardTitle": "What is an Enum?",
            "facts": [
                "contains a group of related values.",
                "enumerations define a finite number of states, and can bundle associated values with each individual state.",
                "you can use them to model the state of your app and its internal processes."
            ]
        },
        {
            "id": "3",
            "cardTitle": "What’s the difference between the frame and the bounds?",
            "facts": [
                "The frame of a UIView is the rectangle, expressed as a location (x,y) and size (width,height) relative to the superview it is contained within.",
                "The bounds of a UIView is the rectangle, expressed as a location (x,y) and size (width,height) relative to its own coordinate system (0,0)."
            ]
        },
        {
            "id": "4",
            "cardTitle": "How does Quick Sort work?",
            "facts": [
                "Uses divide and conquer and splits the array into three parts based on a pivot variable.",
                "Picks an element as pivot and partitions the given array around the picked pivot."
            ]
        },
        {
            "id": "5",
            "cardTitle": "What is the singleton pattern?",
            "facts": [
                "The singleton design pattern ensures that only one instance exists for a given class and that there’s a global access point to that instance.",
                "It usually uses lazy loading to create the single instance when it’s needed the first time."
            ]
        },
        {
            "id": "6",
            "cardTitle": "What is MVC?",
            "facts": [
                "Models — responsible for the domain data or a data access layer which manipulates the data, think of ‘Person’ or ‘PersonDataProvider’ classes. Views — responsible for the presentation layer (GUI), for iOS environment think of everything starting with ‘UI’ prefix.",
                "Controller/Presenter/ViewModel — the glue or the mediator between the Model and the View, in general responsible for altering the Model by reacting to the user’s actions performed on the View and updating the View with changes from the Model."
            ]
        },
        {
            "id": "7",
            "cardTitle": "What is MVVM?",
            "facts": [
                "UIKit independent representation of your View and its state. The View Model invokes changes in the Model and updates itself with the updated Model, and since we have a binding between the View and the View Model, the first is updated accordingly.",
                "Your view model will actually take in your model, and it can format the information that’s going to be displayed on your view. There is a more known framework called RxSwift. It contains RxCocoa, which are reactive extensions for Cocoa and CocoaTouch."
            ]
        },
        {
            "id": "8",
            "cardTitle": "What are some main advantages of using Swift?",
            "facts": [
                "Optional types, which make applications crash-resistant. Built-in error handling. Closures.",
                "Much faster compared to other languages. Type-safe language. Supports pattern-matching."
            ]
        },
        {
            "id": "9",
            "cardTitle": "Explain generics in Swift?",
            "facts": [
                "Generics create code that does not get specific about underlying data types.",
                "Generics allow us to know what type it is going to contain. Generics also provides optimization for our code."
            ]
        },
        {
            "id": "10",
            "cardTitle": "What are some ways to pass data between view controllers?",
            "facts": [
                "Set a delegate or set the variable directly.",
                "Segue, in prepareForSegue method."
            ]
        },
        {
            "id": "11",
            "cardTitle": "What is concurrency?",
            "facts": [
                "Concurrency is dividing up the execution paths of functionality in your program so that multiple functions can run at the same time.",
                "Common terminology: process, thread, multithreading."
            ]
        },
        {
            "id": "12",
            "cardTitle": "Grand Central Dispatch",
            "facts": [
                "GCD is a library that provides a low-level and object-based API to run tasks concurrently while managing threads behind the scenes",
                "Dispatch Queue: A dispatch queue is responsible for executing a task in the first-in, first-out order.",
                "Serial Dispatch Queue: A serial dispatch queue runs tasks one at a time.",
                "Concurrent Dispatch Queue: A concurrent dispatch queue runs as many tasks as it can without waiting for the started tasks to finish.",
                "Main Dispatch Queue: A globally available serial queue that executes tasks on the application’s main thread."
            ]
        }
    ]
}
""".data(using: .utf8)!
        
        let expectedCardTitle = "What is the difference between a synchronous & an asynchronous task?"
        
        do {
            let cards = try JSONDecoder().decode([Card].self, from: jsonData)
            let title = cards.first?.quizTitle ?? ""
            XCTAssertEqual(title, expectedCardTitle)
        } catch {
            XCTFail("Error: \(error)")
        }
        
        
        
    }
}

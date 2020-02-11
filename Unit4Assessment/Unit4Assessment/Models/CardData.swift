//
//  CardData.swift
//  Unit4Assessment
//
//  Created by Matthew Ramos on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

struct Card: Codable & Equatable {
    let id: String
    let quizTitle: String
    let facts: [String]
}

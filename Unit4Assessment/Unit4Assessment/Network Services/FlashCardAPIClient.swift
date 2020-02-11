//
//  FlashCardAPIClient.swift
//  Unit4Assessment
//
//  Created by Matthew Ramos on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation
import NetworkHelper

struct FlashCardAPIClient {
    static func fetchCards (completion: @escaping (Result<[Card], AppError>) -> ()) {
        let endpointURLString = "https://5c4d4c0d0de08100147c59b5.mockapi.io/api/v1/quizzes"
        guard let url = URL(string: endpointURLString) else {
            completion(.failure(.badURL(endpointURLString)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(appError))
            case .success(let data):
                do {
                    let cards = try JSONDecoder().decode([Card].self, from: data)
                    completion(.success(cards))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
            
        }
    }
    
}

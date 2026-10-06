//
//  NetworkRouting.swift
//  MovieQuiz
//
//  Created by I on 16.12.2025.
//

import Foundation

protocol NetworkRouting {
    func fetch(url: URL, handler: @escaping (Result<Data, Error>) -> Void)
}

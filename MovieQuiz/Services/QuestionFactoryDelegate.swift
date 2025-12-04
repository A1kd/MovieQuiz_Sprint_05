//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by I on 18.11.2025.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {               // 1
    func didReceiveNextQuestion(question: QuizQuestion?)    // 2
}

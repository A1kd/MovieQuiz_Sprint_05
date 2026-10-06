//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by I on 16.12.2025.
//

import Foundation

protocol MovieQuizViewControllerProtocol: AnyObject {
    func show(quiz step: QuizStepViewModel)
    func show(quiz result: QuizResultsViewModel)
    
    func highlightImageBorder(isCorrect: Bool)
    func hideImageBorder()
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func showNetworkError(message: String)
    
    func enableButtons()
    func disableButtons()
}

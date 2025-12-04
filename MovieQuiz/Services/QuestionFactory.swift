import Foundation

struct QuizQuestion {
    let image: String
    let text: String
    let correctAnswer: Bool
}

class QuestionFactory: QuestionFactoryProtocol {
    weak var delegate: QuestionFactoryDelegate?
    
    func setup(delegate: QuestionFactoryDelegate) {
        self.delegate = delegate
    }
    
    private let questions: [QuizQuestion] = [
        QuizQuestion(
            image: "The Godfather",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Dark Knight",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Kill Bill",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Avengers",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Deadpool",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "The Green Knight",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: true),
        QuizQuestion(
            image: "Old",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "The Ice Age Adventures of Buck Wild",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "Tesla",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false),
        QuizQuestion(
            image: "Vivarium",
            text: "Рейтинг этого фильма больше чем 6?",
            correctAnswer: false)
    ]
    
    private var askedQuestions: [Int] = []
    
    func requestNextQuestion() {
        // Если задали все вопросы, сбрасываем список
        if askedQuestions.count == questions.count {
            askedQuestions.removeAll()
        }
        
        // Находим вопросы, которые ещё не задавали
        let availableIndices = questions.indices.filter { !askedQuestions.contains($0) }
        
        guard let randomIndex = availableIndices.randomElement() else {
            delegate?.didReceiveNextQuestion(question: nil)
            return
        }
        
        // Добавляем индекс в список заданных
        askedQuestions.append(randomIndex)
        
        let question = questions[randomIndex]
        delegate?.didReceiveNextQuestion(question: question)
    }
}

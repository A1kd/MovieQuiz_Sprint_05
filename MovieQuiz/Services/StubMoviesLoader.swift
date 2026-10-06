//
//  StubMoviesLoader.swift
//  MovieQuiz
//
//  Created by I on 16.12.2025.
//

import Foundation

final class StubMoviesLoader: MoviesLoading {
    private let mockMovies: [MostPopularMovie] = [
        MostPopularMovie(
            title: "The Shawshank Redemption",
            rating: "9.2",
            imageURL: URL(string: "https://via.placeholder.com/600x900/FF0000/FFFFFF?text=Movie+1")!
        ),
        MostPopularMovie(
            title: "The Godfather",
            rating: "9.2",
            imageURL: URL(string: "https://via.placeholder.com/600x900/00FF00/FFFFFF?text=Movie+2")!
        ),
        MostPopularMovie(
            title: "The Dark Knight",
            rating: "9.0",
            imageURL: URL(string: "https://via.placeholder.com/600x900/0000FF/FFFFFF?text=Movie+3")!
        ),
        MostPopularMovie(
            title: "Pulp Fiction",
            rating: "8.9",
            imageURL: URL(string: "https://via.placeholder.com/600x900/FFFF00/000000?text=Movie+4")!
        ),
        MostPopularMovie(
            title: "Forrest Gump",
            rating: "8.8",
            imageURL: URL(string: "https://via.placeholder.com/600x900/FF00FF/FFFFFF?text=Movie+5")!
        ),
        MostPopularMovie(
            title: "Inception",
            rating: "8.8",
            imageURL: URL(string: "https://via.placeholder.com/600x900/00FFFF/000000?text=Movie+6")!
        ),
        MostPopularMovie(
            title: "Fight Club",
            rating: "8.7",
            imageURL: URL(string: "https://via.placeholder.com/600x900/FFA500/000000?text=Movie+7")!
        ),
        MostPopularMovie(
            title: "The Matrix",
            rating: "8.7",
            imageURL: URL(string: "https://via.placeholder.com/600x900/800080/FFFFFF?text=Movie+8")!
        ),
        MostPopularMovie(
            title: "Goodfellas",
            rating: "8.7",
            imageURL: URL(string: "https://via.placeholder.com/600x900/008000/FFFFFF?text=Movie+9")!
        ),
        MostPopularMovie(
            title: "Interstellar",
            rating: "8.6",
            imageURL: URL(string: "https://via.placeholder.com/600x900/000080/FFFFFF?text=Movie+10")!
        )
    ]
    
    func loadMovies(handler: @escaping (Result<MostPopularMovies, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let movies = MostPopularMovies(errorMessage: "", items: self.mockMovies)
            handler(.success(movies))
        }
    }
}

import XCTest
@testable import MovieQuiz

final class MoviesLoaderTests: XCTestCase {
    
    func testSuccessLoading() throws {
        // Given
        let stubNetworkClient = StubNetworkClient(emulateError: false)
        let loader = MoviesLoader(networkClient: stubNetworkClient)
        
        // When
        let expectation = expectation(description: "Loading expectation")
        
        loader.loadMovies { result in
            // Then
            switch result {
            case .success(let movies):
                XCTAssertEqual(movies.items.count, 2)
                expectation.fulfill()
            case .failure(_):
                XCTFail("Unexpected failure")
            }
        }
        
        waitForExpectations(timeout: 1)
    }
    
    func testFailureLoading() throws {
        // Given
        let stubNetworkClient = StubNetworkClient(emulateError: true)
        let loader = MoviesLoader(networkClient: stubNetworkClient)
        
        // When
        let expectation = expectation(description: "Loading expectation")
        
        loader.loadMovies { result in
            // Then
            switch result {
            case .success(_):
                XCTFail("Unexpected success")
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 1)
    }
}

// MARK: - Stub Network Client
private struct StubNetworkClient: NetworkRouting {
    let emulateError: Bool
    
    func fetch(url: URL, handler: @escaping (Result<Data, Error>) -> Void) {
        if emulateError {
            handler(.failure(NSError(domain: "test", code: 1)))
        } else {
            handler(.success(mockData))
        }
    }
    
    private var mockData: Data {
        """
        {
           "errorMessage" : "",
           "items" : [
              {
                 "id" : "tt0111161",
                 "rank" : "1",
                 "rankUpDown" : "+0",
                 "title" : "The Shawshank Redemption",
                 "fullTitle" : "The Shawshank Redemption (1994)",
                 "year" : "1994",
                 "image" : "https://m.media-amazon.com/images/M/MV5BNDE3ODcxYzMtY2YzZC00NmNlLWJiNDMtZDViZWM2MzIxZDYwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_UX128_CR0,3,128,176_AL_.jpg",
                 "crew" : "Frank Darabont (dir.), Tim Robbins, Morgan Freeman",
                 "imDbRating" : "9.2",
                 "imDbRatingCount" : "2732445"
              },
              {
                 "id" : "tt0068646",
                 "rank" : "2",
                 "rankUpDown" : "+0",
                 "title" : "The Godfather",
                 "fullTitle" : "The Godfather (1972)",
                 "year" : "1972",
                 "image" : "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX128_CR0,3,128,176_AL_.jpg",
                 "crew" : "Francis Ford Coppola (dir.), Marlon Brando, Al Pacino",
                 "imDbRating" : "9.2",
                 "imDbRatingCount" : "1924697"
              }
           ]
        }
        """.data(using: .utf8) ?? Data()
    }
}

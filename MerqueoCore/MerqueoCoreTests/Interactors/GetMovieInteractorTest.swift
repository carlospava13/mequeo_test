//
//  GetMovieInteractorTest.swift
//  MerqueoCoreTests
//
//  Created by Carlos Pava on 9/05/21.
//

import Combine
@testable import MerqueoCore
@testable import MerqueoData
import XCTest
class GetMovieInteractorTest: XCTestCase {
    var repository: GetPopularMovieRepositoryStub!
    var cancellable: Set<AnyCancellable>? = []
    // System Under Test
    var sut: GetMoviesInteractor?

    override func setUp() {
        super.setUp()
        repository = GetPopularMovieRepositoryStub()
        sut = GetMoviesInteractor(repository: repository)
    }

    override func tearDown() {
        cancellable = nil
        repository = nil
        sut = nil
        super.tearDown()
    }

    func testGetMovies_WhenReturnSuccess_ThenGetMovies() {
        // Given
        let expectation = self.expectation(description: "get movies")
        let movieResult = ConstantsCoreTest.Movie.movieResult
        var expectedValue: [MovieCoreDto] = []
        repository.responseHandler = .success(movieResult)
        // When
        sut?.getMovies().sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                XCTFail(error.localizedDescription)
            case .finished:
                expectation.fulfill()
            }
        }, receiveValue: { movies in
            expectedValue = movies
        }).store(in: &cancellable!)
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertGreaterThan(expectedValue.count, 0)
    }

    func testGetMovies_WhenReturnFailure_ThenGetError() {
        // Given
        let expectation = self.expectation(description: "get movies")
        var expectedValue: Error?
        // When
        sut?.getMovies().sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                expectedValue = error
                expectation.fulfill()
            case .finished:
                XCTFail()
            }
        }, receiveValue: { _ in
            XCTFail()
        }).store(in: &cancellable!)
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(expectedValue)
    }
}

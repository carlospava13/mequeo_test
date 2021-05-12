//
//  GetMovieDetailInteractorTest.swift
//  MerqueoCoreTests
//
//  Created by Carlos Pava on 11/05/21.
//

import Combine
@testable import MerqueoCore
@testable import MerqueoData
import XCTest
class GetMovieDetailInteractorTest: XCTestCase {
    var repository: GetMovieDetailRepositoryStub!
    var cancellable: Set<AnyCancellable>? = []
    // System Under Test
    var sut: GetMovieDetailInteractorType?

    override func setUp() {
        super.setUp()
        repository = GetMovieDetailRepositoryStub()
        sut = GetMovieDetailInteractor(repository: repository)
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
        let movieResult = ConstantsCoreTest.Movie.movieDetail
        var expectedValue: MovieDetailCoreDto?
        repository.responseHandler = .success(movieResult)
        // When
        sut?.getMovieDetail(id: 1).sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                XCTFail(error.localizedDescription)
            case .finished:
                expectation.fulfill()
            }
        }, receiveValue: { detail in
            expectedValue = detail
        }).store(in: &cancellable!)
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(expectedValue)
    }

    func testGetMovies_WhenReturnFailure_ThenGetError() {
        // Given
        let expectation = self.expectation(description: "get movies")
        var expectedValue: Error?
        // When
        sut?.getMovieDetail(id: 1).sink(receiveCompletion: { completion in
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


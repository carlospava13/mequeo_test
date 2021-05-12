//
//  GetPopularMovieRepositoryTest.swift
//  MerqueoDataTests
//
//  Created by Carlos Pava on 11/05/21.
//

import XCTest
import Combine
@testable import MerqueoData
final class GetPopularMovieRepositoryTest: XCTestCase {
    
    var apiClientStub: ApiClientStub<MovieResult>?
    var cancellable: Set<AnyCancellable>? = []
    //System Under Test
    var sut: GetPopularMovieRepositoryType?
    
    override func setUp() {
        super.setUp()
        apiClientStub = ApiClientStub()
        sut = GetPopularMovieRepository(service: apiClientStub!)
    }
    
    override func tearDown() {
        apiClientStub = nil
        cancellable = nil
        sut = nil
        super.tearDown()
    }
    
    func testGetToken_WhenResponseSuccess_ThenGetToken() {
        //Given
        let expectation = self.expectation(description: "get token")
        var expectedValue: MovieResult?
        apiClientStub?.responseHandler = .success(TestConstant.Movie.popularMovies)
        //When
        sut?.getMovies().sink(receiveCompletion: { (completion) in
            switch completion {
            case .finished:
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }, receiveValue: { (movieResult) in
            expectedValue = movieResult
        }).store(in: &cancellable!)
        
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(expectedValue)
    }
    
    func testGetToken_WhenResponseFailure_ThenGetError() {
        //Given
        let expectation = self.expectation(description: "get token")
        var expectedValue: Error?
        //When
        sut?.getMovies().sink(receiveCompletion: { (completion) in
            switch completion {
            case .finished:
                XCTFail()
            case .failure(let error):
                expectedValue = error
                expectation.fulfill()
            }
        }, receiveValue: { _ in
        }).store(in: &cancellable!)
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(expectedValue)
    }
    
}

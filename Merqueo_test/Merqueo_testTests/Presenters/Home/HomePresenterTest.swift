//
//  HomePresenterTest.swift
//  Merqueo_testTests
//
//  Created by Carlos Pava on 9/05/21.
//

@testable import Merqueo_test
@testable import MerqueoCore
import XCTest
class HomePresenterTest: XCTestCase {
    var interactor: GetMoviesInteractorStub!
    // System Under Test
    var sut: HomePresenter!
    var spy: HomeViewSpy!
    var homeCoordinatorSpy: HomeCoordinatorSpy!

    override func setUp() {
        super.setUp()
        spy = HomeViewSpy()
        homeCoordinatorSpy = HomeCoordinatorSpy()
        interactor = GetMoviesInteractorStub()
        let dependencies = HomePresenter.InputDependencies(
            coordinator: homeCoordinatorSpy,
            getMoviesInteractor: interactor)
        sut = HomePresenter(dependencies: dependencies)
        sut.bind(spy)
    }

    override func tearDown() {
        sut = nil
        spy = nil
        homeCoordinatorSpy = nil
        interactor = nil
        super.tearDown()
    }

    func testGetMovies_WhenThereAreMovies_ThenCallShowLoading() {
        // Given
        let expectation = self.expectation(description: "get movies")
        var valueExpected = false
        // When
        homeCoordinatorSpy.showLoadingCallBack = {
            valueExpected = true
            expectation.fulfill()
        }

        sut.viewDidLoad()
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(valueExpected)
    }

    func testGetMovies_WhenThereAreMovies_ThenSetData() {
        // Given
        let expectation = self.expectation(description: "get movies")
        interactor.responseHandler = .success(TestConstants.Movie.movieObjectViews)
        var valueExpected: [MovieObjectView] = []
        // When
        spy.setMoviesCallBack = { movies in
            valueExpected = movies
            expectation.fulfill()
        }

        sut.viewDidLoad()
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertGreaterThan(valueExpected.count, 1)
    }
    
    func testGetMovies_WhenThereAreMovies_ThenCallHideLoading() {
        // Given
        let expectation = self.expectation(description: "get movies")
        var valueExpected = false
        // When
        
        homeCoordinatorSpy.hideLoadingCallBack = {
            valueExpected = true
            expectation.fulfill()
        }

        sut.viewDidLoad()
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(valueExpected)
    }
}

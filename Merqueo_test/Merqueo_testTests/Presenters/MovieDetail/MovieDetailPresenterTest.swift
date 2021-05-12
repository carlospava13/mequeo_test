//
//  MovieDetailPresenterTest.swift
//  Merqueo_testTests
//
//  Created by Carlos Pava on 11/05/21.
//

@testable import Merqueo_test
@testable import MerqueoCore
import XCTest
class MovieDetailPresenterTest: XCTestCase {
    var interactor: GetMovieDetailInteractorStub!
    // System Under Test
    var sut: MovieDetailPresenter!
    var spy: MovieDetailViewSpy!
    var movieDetailCoordinatorDelegateSpy: MovieDetailCoordinatorDelegateSpy!

    override func setUp() {
        super.setUp()
        spy = MovieDetailViewSpy()
        interactor = GetMovieDetailInteractorStub()
        movieDetailCoordinatorDelegateSpy = MovieDetailCoordinatorDelegateSpy()
        let dependencies = MovieDetailPresenter.InputDependencies(coordinator: movieDetailCoordinatorDelegateSpy,
                                                                  id: 1,
                                                                  getMovieDetailInteractor: interactor)
        sut = MovieDetailPresenter(dependencies: dependencies)
        sut.bind(spy)
    }

    override func tearDown() {
        sut = nil
        spy = nil
        interactor = nil
        movieDetailCoordinatorDelegateSpy = nil
        super.tearDown()
    }
    
    func testGetMovieDetail_WhenResponseSuccess_ThenShowMovieDetail() {
        //Given
        let expectation = self.expectation(description: "get movie detail")
        interactor.responseHandler = .success(TestConstants.MovieDetail.movieDetail)
        var valueExpected: String?
        //When
        spy.showMovieDetailCallBack = { detail in
            valueExpected = detail.originalTitle
            expectation.fulfill()
        }
        sut.viewDidLoad()
        //Then
        
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(valueExpected, "Mortal Kombat")
    }
    
    func testGetMovieDetail_WhenIsLoading_ThenCallShowLoading() {
        //Given
        let expectation = self.expectation(description: "get movie detail")
        interactor.responseHandler = .success(TestConstants.MovieDetail.movieDetail)
        var valueExpected = false
        //When
        movieDetailCoordinatorDelegateSpy.showLoadingCallBack = {
            valueExpected = true
            expectation.fulfill()
        }
        sut.viewDidLoad()
        //Then
        
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(valueExpected)
    }
    
    func testGetMovieDetail_WhenFinished_ThenCallHideLoading() {
        //Given
        let expectation = self.expectation(description: "get movie detail")
        interactor.responseHandler = .success(TestConstants.MovieDetail.movieDetail)
        var valueExpected = false
        //When
        movieDetailCoordinatorDelegateSpy.hideLoadingCallBack = {
            valueExpected = true
            expectation.fulfill()
        }
        sut.viewDidLoad()
        //Then
        
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(valueExpected)
    }
    
    func testGetMovieDetail_WhenFinishedWithError_ThenShowError() {
        //Given
        let expectation = self.expectation(description: "get movie detail")
        var valueExpected = false
        //When
        movieDetailCoordinatorDelegateSpy.showErrorCallBack = {
            valueExpected = true
            expectation.fulfill()
        }
        sut.viewDidLoad()
        //Then
        
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(valueExpected)
    }
    
    func testGetMovieDetail_WhenReturnLastOneView_ThenCallPopView() {
        //Given
        let expectation = self.expectation(description: "get movie detail")
        var valueExpected = false
        //When
        movieDetailCoordinatorDelegateSpy.popViewCallBack = {
            valueExpected = true
            expectation.fulfill()
        }
        sut.viewDidDisappear()
        //Then
        
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(valueExpected)
    }

}

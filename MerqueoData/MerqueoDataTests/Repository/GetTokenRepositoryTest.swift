//
//  GetTokenRepositoryTest.swift
//  MerqueoDataTests
//
//  Created by Carlos Pava on 8/05/21.
//

import XCTest
import Combine
@testable import MerqueoData
final class GetTokenRepositoryTest: XCTestCase {
    
    var apiClientStub: ApiClientStub<TokenDto>?
    var cancellable: Set<AnyCancellable>? = []
    //System Under Test
    var sut: GetTokenRepositoryType?
    
    override func setUp() {
        super.setUp()
        apiClientStub = ApiClientStub()
        sut = GetTokenRepository(service: apiClientStub!)
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
        let token = TokenDto(success: true,
                                     expiresAt: "2021-05-08 15:24:17 UTC",
                                     requestToken: "c6640f0e790e2267be049b6d1a3543679854ff30")
        var expectedValue: TokenDto?
        apiClientStub?.responseHandler = .success(token)
        //When
        sut?.request().sink(receiveCompletion: { (completion) in
            switch completion {
            case .finished:
                expectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }, receiveValue: { (token) in
            expectedValue = token
        }).store(in: &cancellable!)
        //Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(token.requestToken, expectedValue?.requestToken)
    }
    
    func testGetToken_WhenResponseFailure_ThenGetError() {
        //Given
        let expectation = self.expectation(description: "get token")
        var expectedValue: Error?
        //When
        sut?.request().sink(receiveCompletion: { (completion) in
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

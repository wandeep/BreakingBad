//
//  CharactersViewModelTest.swift
//  BreakingBadTests
//
//  Created by Wandeep Basra on 21/11/2022.
//

import XCTest
@testable import BreakingBad

@MainActor class CharactersViewModelTest: XCTestCase {
    private var sut: CharactersViewModel!
    
    func testCharacterArrayIsEmptyWhenFetchCharactersFails() async {
        // Given
        sut = CharactersViewModel(webService: MockWebService(isSuccessful: false))
        // When
        await sut.fetchCharacters()
        // Then
        XCTAssertTrue(sut.characters.isEmpty)
    }
    
    func testCharacterArrayIsNotEmptyWhenFetchCharactersSucceeds() async {
        // Given
        sut = CharactersViewModel(webService: MockWebService(isSuccessful: true))
        // When
        await sut.fetchCharacters()
        // Then
        XCTAssertFalse(sut.characters.isEmpty)
    }
}

class MockWebService: WebServiceProtocol {
    let isSuccessful: Bool
    
    init(isSuccessful: Bool) {
        self.isSuccessful = isSuccessful
    }
    
    func fetch<T>(endpoint: BreakingBad.Endpoint, responseType: T.Type) async -> Result<T, BreakingBad.WebServiceError> where T : Decodable {
        if isSuccessful {
            return .success([Character.sample] as! T)
        } else {
            return .failure(WebServiceError.fetchError)
        }
    }
}

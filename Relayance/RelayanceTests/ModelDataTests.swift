//
//  ModelDataTests.swift
//  RelayanceTests
//
//  Created by Pascal Jesenberger on 26/07/2025.
//

import XCTest
@testable import Relayance

final class ModelDataTests: XCTestCase {
    
    // MARK: - chargement(_:)
    
    func test_GivenValidJSONFile_WhenLoading_ThenReturnsDecodedArray() {
        // Given
        let filename = "SourceMock.json"

        // When
        let sources: [Client] = ModelData.chargement(filename)

        // Then
        XCTAssertEqual(sources.count, 8)
        XCTAssertEqual(sources[0].nom, "Frida Kahlo")
        XCTAssertEqual(sources[1].email, "mahatma.gandhi@example.com")
    }
    
    // ⚠️ Test causant un crash ⚠️
    // func test_GivenMissingJSONFile_WhenLoading_ThenFatalError() {
    //     // Given
    //     let invalidFilename = "FichierInexistant.json"
    //
    //     // When
    //     _ = ModelData.chargement(invalidFilename)
    //
    //     // Then
    //     // fatalError attendu → ce test crasherait si activé
    // }
}

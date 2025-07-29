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

    func testGivenValidJsonFile_WhenLoadingClientList_ThenReturnsNonEmptyArray() throws {
        // Given
        let jsonFile = "SourceMock.json"

        // When
        let clientsList: [Client] = try ModelData.chargement(jsonFile, from: Bundle(for: ModelDataTests.self))

        // Then
        XCTAssertTrue(clientsList.count > 0)
    }

    func testGivenNoJsonFile_WhenLoadingClientList_ThenErrorIsThrown() {
        // Given
        let jsonFile = "NonExistantFile.json"

        // When
        do {
            _ = try ModelData.chargement(jsonFile, from: Bundle(for: ModelDataTests.self)) as [Client]
            XCTFail("ModelDataTests: catch block should to be executed")

        // Then
        } catch let error as NSError {
            XCTAssertEqual(error.domain, "ModelDataError")
            XCTAssertEqual(error.code, 1)
        }
    }

    func testGivenInvalidJsonFile_WhenLoadingClientList_ThenErrorIsThrown() {
        // Given
        let jsonFile = "InvalidSourceMock.json"

        // When
        do {
            _ = try ModelData.chargement(jsonFile, from: Bundle(for: ModelDataTests.self)) as [Client]
            XCTFail("ModelDataTests: catch block should to be executed")
            
        // Then
        } catch let error as NSError {
            XCTAssertEqual(error.domain, "ModelDataError")
            XCTAssertEqual(error.code, 2)
        }
    }
}

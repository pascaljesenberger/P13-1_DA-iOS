//
//  ClientTests.swift
//  RelayanceTests
//
//  Created by Pascal Jesenberger on 26/07/2025.
//

import XCTest
@testable import Relayance

final class ClientTests: XCTestCase {
    
    // MARK: Helpers

    private func makeClient(
        nom: String = "Jesenberger",
        email: String = "pascal@jesenberger.fr",
        dateCreationString: String = "2023-02-20T09:15:00Z"
    ) -> Client {
        Client(nom: nom, email: email, dateCreationString: dateCreationString)
    }
    
    // MARK: - init(nom:email:dateCreationString:)

    func test_GivenValidData_WhenCreatingClient_ThenClientCreated() {
        // Given
        let dateCreationString = "2025-07-24T08:30:00Z"
        
        // When
        let client = makeClient(dateCreationString: dateCreationString)
        
        // Then
        XCTAssertEqual(client.nom, "Jesenberger")
        XCTAssertEqual(client.email, "pascal@jesenberger.fr")

        let expectedDate = Date.dateFromString(dateCreationString)
        XCTAssertNotNil(expectedDate)
        XCTAssertEqual(client.dateCreation, expectedDate)
    }
    
    func test_GivenInvalidDateFormat_WhenCreatingClient_ThenDateCreationIsNow() {
        // Given
        let invalidDate = "123456"
        
        // When
        let client = makeClient(dateCreationString: invalidDate)
        
        // Then
        XCTAssertEqual(client.nom, "Jesenberger")
        XCTAssertEqual(client.email, "pascal@jesenberger.fr")

        let expectedDate = Date.dateFromString(invalidDate)
        XCTAssertNil(expectedDate)
        XCTAssertTrue(Calendar.current.isDateInToday(client.dateCreation))
    }
    
    // MARK: - creerNouveauClient(nom:email:)
    
    func test_GivenValidData_WhenCreatingNewClient_ThenReturnsClientWithCurrentDate() {
        // Given
        let nom = "Jean"
        let email = "jean@example.com"
        
        // When
        let client = Client.creerNouveauClient(nom: nom, email: email)
        
        // Then
        XCTAssertEqual(client.nom, nom)
        XCTAssertEqual(client.email, email)
        XCTAssertTrue(Calendar.current.isDateInToday(client.dateCreation))
    }
    
    func test_GivenEmptyName_WhenCreatingNewClient_ThenReturnsClientWithEmptyName() {
        // Given
        let nom = ""
        let email = "vide@example.com"
        
        // When
        let client = Client.creerNouveauClient(nom: nom, email: email)
        
        // Then
        XCTAssertEqual(client.nom, nom)
        XCTAssertEqual(client.email, email)
        XCTAssertTrue(Calendar.current.isDateInToday(client.dateCreation))
    }
}

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
    
    private func makeClientWithOffsetFromToday(daysOffset: Int) -> Client {
        let calendar = Calendar.current
        guard let date = calendar.date(byAdding: .day, value: daysOffset, to: Date()) else {
            fatalError("Invalid date offset")
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let dateString = dateFormatter.string(from: date)
        return makeClient(dateCreationString: dateString)
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
    
    // MARK: estNouveauClient()
    
    func test_GivenClientCreatedToday_WhenCheckingIfNew_ThenTrue() {
        // Given
        let client = makeClientWithOffsetFromToday(daysOffset: 0)

        // When
        let isNew = client.estNouveauClient()

        // Then
        XCTAssertTrue(isNew)
    }

    func test_GivenClientCreatedYesterday_WhenCheckingIfNew_ThenFalse() {
        // Given
        let client = makeClientWithOffsetFromToday(daysOffset: -1)

        // When
        let isNew = client.estNouveauClient()

        // Then
        XCTAssertFalse(isNew)
    }
    
    // MARK: clientExiste()
    
    func test_GivenExistingClient_WhenCheckingIfExists_ThenTrue() {
        // Given
        let client = makeClient()
        let clientsList = [client]

        // When
        let exists = client.clientExiste(clientsList: clientsList)

        // Then
        XCTAssertTrue(exists)
    }

    func test_GivenNonExistingClient_WhenCheckingIfExists_ThenFalse() {
        // Given
        let client1 = makeClient(nom: "Jean", email: "jean@example.com")
        let client2 = makeClient(nom: "Marie", email: "marie@example.com")
        let clientsList = [client1]
        
        // When
        let exists = client2.clientExiste(clientsList: clientsList)

        // Then
        XCTAssertFalse(exists)
    }
}

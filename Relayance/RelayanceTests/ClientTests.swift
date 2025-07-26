//
//  ClientTests.swift
//  RelayanceTests
//
//  Created by Pascal Jesenberger on 26/07/2025.
//

import XCTest
@testable import Relayance

final class ClientTests: XCTestCase {
    func test_GivenValidData_WhenCreatingClient_ThenClientCreated() {
        // Given
        let nom = "Jesenberger"
        let email = "pascal@jesenberger.fr"
        let dateCreationString = "2025-07-26T00:00:00Z"
        
        // When
        let client = Client(nom: nom, email: email, dateCreationString: dateCreationString)
        
        // Then
        XCTAssertEqual(client.nom, nom)
        XCTAssertEqual(client.email, email)
        XCTAssertEqual(client.formatDateVersString(), dateCreationString)
    }
}

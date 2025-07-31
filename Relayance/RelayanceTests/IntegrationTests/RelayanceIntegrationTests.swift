//
//  RelayanceIntegrationTests.swift
//  RelayanceTests
//
//  Created by Pascal Jesenberger on 31/07/2025.
//

import XCTest
@testable import Relayance

final class RelayanceIntegrationTests: XCTestCase {
    var viewModel: RelayanceViewModel!

    override func setUp() {
        super.setUp()
        viewModel = RelayanceViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // MARK: - Helpers

    func creerClient(nom: String = "Test Client", email: String = "test@example.com") -> Client {
        return Client(nom: nom, email: email, dateCreationString: Date().description)
    }

    func configurationAjout(nom: String, email: String) {
        viewModel.nom = nom
        viewModel.email = email
    }

    // MARK: - Tests Ajout Client

    func testAjoutClientValide() {
        // Given
        configurationAjout(nom: "Marie Curie", email: "marie.curie@example.com")
        let countAvant = viewModel.clientsList.count

        // When
        viewModel.ajouterClient()

        // Then
        XCTAssertEqual(viewModel.clientsList.count, countAvant + 1)
        XCTAssertEqual(viewModel.clientsList.last?.nom, "Marie Curie")
        XCTAssertEqual(viewModel.clientsList.last?.email, "marie.curie@example.com")
        XCTAssertNil(viewModel.errorMessage)
    }

    func testAjoutClientEmailInvalide() {
        // Given
        configurationAjout(nom: "Marie Curie", email: "email-invalide")
        let countAvant = viewModel.clientsList.count

        // When
        viewModel.ajouterClient()

        // Then
        XCTAssertEqual(viewModel.clientsList.count, countAvant)
        XCTAssertEqual(viewModel.errorMessage, "Veuillez entrer un email valide")
    }

    // MARK: - Tests Suppression Client

    func testSuppressionClientExistante() {
        // Given
        let client = creerClient()
        viewModel.clientsList = [client]

        // When
        viewModel.supprimerClient(client)

        // Then
        XCTAssertTrue(viewModel.clientsList.isEmpty)
    }

    func testSuppressionClientInexistante() {
        // Given
        let client = creerClient()
        viewModel.clientsList = []
        let countAvant = viewModel.clientsList.count

        // When
        viewModel.supprimerClient(client)

        // Then
        XCTAssertEqual(viewModel.clientsList.count, countAvant)
    }
}

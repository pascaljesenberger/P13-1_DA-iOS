//
//  RelayanceViewModel.swift
//  Relayance
//
//  Created by Pascal Jesenberger on 29/07/2025.
//

import Foundation

class RelayanceViewModel: ObservableObject {
    @Published var nom: String = ""
    @Published var email: String = ""
    @Published var errorMessage: String? = nil
    
    @Published var clientsList: [Client] = []
    
    @Published var showModal: Bool = false
    
    func loadSource() {
        guard clientsList.isEmpty else { return }
        clientsList = (try? ModelData.chargement("Source.json") as [Client]) ?? []
    }
    
    func ajouterClient() {
        if nom.isEmpty {
            errorMessage = "Veuillez entrer un nom"
            return
        } else if !isValidEmail(email) {
            errorMessage = "Veuillez entrer un email valide"
            return
        }
        
        let nouveauClient = Client.creerNouveauClient(nom: nom, email: email)
        clientsList.append(nouveauClient)
        
        nom = ""
        email = ""
        showModal = false
    }
    
    func supprimerClient(_ client: Client) {
        clientsList.removeAll { $0 == client }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

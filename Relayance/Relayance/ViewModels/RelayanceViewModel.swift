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
    
    @Published var clientsList: [Client] = []
    
    @Published var showModal: Bool = false
    
    func loadSource() {
        guard clientsList.isEmpty else { return }
        clientsList = (try? ModelData.chargement("Source.json") as [Client]) ?? []
    }
    
    func ajouterClient() {
        //
        showModal = false
    }
    
}

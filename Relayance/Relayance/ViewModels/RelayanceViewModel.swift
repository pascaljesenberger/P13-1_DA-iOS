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
    @Published var shouldDismiss = false
    func ajouterClient() {
        //
        shouldDismiss = true
    }
    
}

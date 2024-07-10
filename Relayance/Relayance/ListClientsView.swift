//
//  ListClientsView.swift
//  Relayance
//
//  Created by Amandine Cousin on 10/07/2024.
//

import SwiftUI

struct ListClientsView: View {
    @State var clientsList: [Client] = ModelData.chargement("Source.json")
    
    var body: some View {
        NavigationStack {
            List(clientsList, id: \.self) { client in
                NavigationLink {
                    // vue detail
                } label: {
                    Text(client.nom)
                        .font(.title3)
                }
            }
            .navigationTitle("Liste des clients")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Ajouter un client") {
                        // vue modal
                    }
                    .foregroundStyle(.orange)
                    .bold()
                }
            }
        }
    }

}

#Preview {
    ListClientsView()
}

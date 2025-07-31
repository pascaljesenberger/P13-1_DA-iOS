//
//  ListClientsView.swift
//  Relayance
//
//  Created by Amandine Cousin on 10/07/2024.
//

import SwiftUI

struct ListClientsView: View {
    @StateObject private var viewModel = RelayanceViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.clientsList, id: \.self) { client in
                NavigationLink {
                    DetailClientView(viewModel: viewModel, client: client)
                } label: {
                    Text(client.nom)
                        .font(.title3)
                }
            }
            .navigationTitle("Liste des clients")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Ajouter un client") {
                        viewModel.showModal.toggle()
                    }
                    .foregroundStyle(.orange)
                    .bold()
                }
            }
            .sheet(isPresented: $viewModel.showModal, content: {
                AjoutClientView(viewModel: viewModel)
            })
        }
        .onAppear {
            viewModel.loadSource()
        }
    }
}

#Preview {
    ListClientsView()
}

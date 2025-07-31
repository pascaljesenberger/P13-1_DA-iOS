//
//  AjoutClientView.swift
//  Relayance
//
//  Created by Amandine Cousin on 10/07/2024.
//

import SwiftUI

struct AjoutClientView: View {
    @ObservedObject var viewModel: RelayanceViewModel
    
    var body: some View {
        VStack {
            Text("Ajouter un nouveau client")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            Spacer()
            
            TextField("Nom", text: $viewModel.nom)
                .font(.title2)
            
            TextField("Email", text: $viewModel.email)
                .font(.title2)
            
            Button("Ajouter") {
                viewModel.ajouterClient()
            }
            .padding(.horizontal, 50)
            .padding(.vertical)
            .font(.title2)
            .bold()
            .background(RoundedRectangle(cornerRadius: 10).fill(.orange))
            .foregroundStyle(.white)
            .padding(.top, 50)
            
            Text(viewModel.errorMessage ?? "")
                .font(.title3)
                .foregroundColor(.red)
                .bold()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AjoutClientView(viewModel: RelayanceViewModel())
}

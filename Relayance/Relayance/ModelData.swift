//
//  ModelData.swift
//  Relayance
//
//  Created by Amandine Cousin on 10/07/2024.
//

import Foundation

struct ModelData {
    static func chargement<T: Decodable>(_ fileName: String, from bundle: Bundle = .main) throws -> T {
        guard let file = bundle.url(forResource: fileName, withExtension: nil) else {
            throw NSError(
                domain: "ModelDataError",
                code: 1,
                userInfo: [NSLocalizedDescriptionKey: "Impossible de trouver \(fileName) dans le bundle."]
            )
        }
        do {
            let data = try Data(contentsOf: file)
            return try JSONDecoder().decode(T.self, from: data)

        } catch {
            throw NSError(
                domain: "ModelDataError",
                code: 2,
                userInfo: [NSLocalizedDescriptionKey: "\(error): Impossible de charger ou parser \(fileName) depuis le bundle"]
            )
        }
    }
}

//
//  ViewModel.swift
//  Apollo
//
//  Created by Artur Brenner Weber on 27/03/23.
//

import Foundation

import SwiftUI

struct Apolo_Musicas: Codable, Hashable {
    var _id: String
    var _rev: String
    var imagem: String?
    var nome_musica: String?
    var artista: String?
    var album: String?
    var genero: String?
    var audio: String?
    var voto: Int?
}

class ViewModel: ObservableObject {
    @Published var chars : [Apolo_Musicas] = []
    
    func fetch() {
        guard let url = URL(string:"http://127.0.0.1:1880/apoloGETMusicas") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Apolo_Musicas].self, from: data)
                
                DispatchQueue.main.async {
                    self?.chars = parsed
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}

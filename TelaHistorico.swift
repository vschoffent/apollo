//
//  TelaHistorico.swift
//  Apollo
//
//  Created by Student on 30/03/23.
//

import SwiftUI

struct TelaHistorico: View {
    struct Evento : Identifiable{
        var id = UUID()
        var name: String
        var adm: String
    }
    
    let historico = [
        Evento(name: "Evento: Strabink", adm: "Adm: Fabrício"),
        Evento(name: "Evento: Delírio", adm: "Adm: Edilson"),
        Evento(name: "Evento: Hackatruck", adm: "Adm: Fabrício")
    ]

    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle().fill(.purple)
                    .ignoresSafeArea()
                LinearGradient(colors: [.black, .purple], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                ScrollView {
                    ForEach(historico) { evento in
                        HStack{
                            Text(evento.name)
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(.leading, 25.0)
                            Spacer()
                            Text(evento.adm)
                                .font(.callout)
                                .foregroundColor(.white)
                                .padding(.trailing, 25.0)
                        }
                        .padding(.vertical, 15.0)
                        .overlay(RoundedRectangle(cornerRadius: 3000.0).stroke(Color.white)
                            .frame(width: 360, height: 50))
                        .font(.custom("Avenir Book", size:30))
                    }
                }
            }
        }
    }
}
    

struct TelaHistorico_Previews: PreviewProvider {
    static var previews: some View {
        TelaHistorico()
    }
}


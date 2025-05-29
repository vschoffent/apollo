//
//  ComprovCriacao.swift
//  Apollo
//
//  Created by Artur Brenner Weber on 30/03/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct ComprovCriacao: View {
    @State var apolloEvento: Apollo_Evento
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: [.black, .purple], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack{
                    Text("Parabéns, seu evento foi criado com sucesso!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10.0)
                        .multilineTextAlignment(.center)
                    
                    VStack{
                        
                        Text("Código: \(apolloEvento.codigo!)")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.top, 1)
                                .bold()
                        }
                        .onTapGesture(count: 2) {
                            UIPasteboard.general.setValue(apolloEvento.codigo!,
                                    forPasteboardType: UTType.plainText.identifier)
                            }
                    
                    ScrollView{
                        Text("Nome do Evento: \(apolloEvento.nome_evento!)")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.top, 1)
                        
                        Text("Nome do Organizador: \(apolloEvento.nome_organizador!)")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.top, 1)
                        
                        Text("Músicas Base:")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.top, 1)
                        
                        ForEach(apolloEvento.musicas!, id: \.self) { Musica in
                            HStack {
                                HStack {
                                    AsyncImage(url: URL(string: Musica.imagem!)){
                                        image in
                                        image.resizable().frame(width:50, height:50)
                                    }placeholder: {
                                        Color.gray.frame(width:50, height:50)
                                    }.padding(.trailing, 10)
                                    
                                    
                                    Text(Musica.nome_musica!)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    Spacer()
                                    
                                    
                                    Text(Musica.artista!)
                                        .foregroundColor(.white)
                                        .font(.caption)
                                    
                                    
                                    
                                }
                                
                            }
                            .padding(.horizontal, 22)
                        }
                    }.navigationBarTitleDisplayMode(.inline)
                    
                    
                    Spacer()
                    
                    NavigationLink(destination: Playlist(codigo: apolloEvento.codigo!)) {
                        Text("Entrar no Evento").foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .overlay(RoundedRectangle(cornerRadius: 3000.0).stroke(Color.white)
                                .frame(width: 280, height: 50))
                            .font(.custom("Avenir Book", size:30))
                            .padding(.bottom, 28)
                        
                    }
                }
            }
        }.navigationBarTitleDisplayMode(.inline)
    }
}

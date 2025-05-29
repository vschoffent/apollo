//
//  CriacaoEvento.swift
//  Apollo
//
//  Created by Artur Brenner Weber on 27/03/23.
//

import SwiftUI

struct Plano: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct CriacaoEvento: View {
    @State private var nome_evento_insert: String = ""
    @State private var nome_organizador_insert: String = ""
    @State private var willMoveToNextScreen = false

    @State private var apolloEvento = Apollo_Evento()
    @State private var apolloMusicas = Apollo_Musicas()
    @StateObject private var apolloModel = ApolloModel()
    
    @State private var showingSheet = false
    
    
    @State var selection = Plano(name: "Até 200")
    @State var planos: [Plano] = [
        Plano(name:"Até 200"),
        Plano(name:"Até 500"),
        Plano(name:"Ilimitado")
        ]
    
    var body: some View {
            ZStack{
                LinearGradient(colors: [.black, .purple], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack{
                    
                    Text("CRIAÇÃO DE EVENTO")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 8.0)
                    
                    ScrollView {
                        VStack{
                            
                            TextField(
                                "Nome do Evento",
                                text: $nome_evento_insert
                            )
                            .cornerRadius(45)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .border(.primary)
                            .padding(.horizontal, 22.0)
                            
                            
                            TextField(
                                "Nome do Organizador",
                                text: $nome_organizador_insert
                            )
                            .cornerRadius(45)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .border(.primary)
                            .padding([.top, .leading, .trailing], 22.0)
                            
                            Text("Participantes : ")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(.top, 15)
                            
                            
                            Picker("Máximo de Participantes: ", selection: $selection){
                                ForEach(planos) { plano in
                                    Text(plano.name).tag(plano as Plano)
                                }
                                
                            }
                            .pickerStyle(.segmented)
                            .tint(.white)
                            .padding(.horizontal, 22)
                            
                            
                            Button("Selecionar músicas"){
                                showingSheet.toggle()
                            }
                            .sheet(isPresented: $showingSheet, onDismiss: {apolloModel.musics = MyVariables.music_selected}) {
                                SelecaoMusicas()
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.gray)
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.top, 22.0)
                            
                            Spacer();
                            
                            ForEach(apolloModel.musics, id: \.self) { Musica in
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
                            }.onAppear() {
                                apolloModel.musics = MyVariables.music_selected
                            }
                            
                        }
                    }.navigationBarTitleDisplayMode(.inline)
                    
                    Spacer()
                        Button("Criar evento"){
                         
                         
                            apolloEvento.nome_evento = nome_evento_insert
                            apolloEvento.nome_organizador = nome_organizador_insert
                            apolloEvento.ativa = true
                            apolloEvento.avaliacao = 0
                            apolloEvento.codigo = String(Int.random(in: 1...100))
                            
                            //adicionar musicas
                            apolloEvento.musicas = apolloModel.musics
                            apolloModel.events.append(apolloEvento)
                            print(apolloModel.events)
                            apolloModel.insert_event()
                            willMoveToNextScreen = true
                        }
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.bottom, 18.0)
                        .buttonStyle(.borderedProminent)
                        .tint(.gray)
                        

                }.navigationBarTitleDisplayMode(.inline)
                    .textFieldStyle(.roundedBorder)
            }.navigate(to: ComprovCriacao(apolloEvento: apolloEvento), when: $willMoveToNextScreen)
                
            }
    }

struct CriacaoEvento_Previews: PreviewProvider {
    static var previews: some View {
        CriacaoEvento()
    }
}

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

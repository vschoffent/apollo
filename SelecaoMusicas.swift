//
//  SelecaoMusicas.swift
//  Apollo
//
//  Created by Artur Brenner Weber on 28/03/23.
//

import SwiftUI



struct SelecaoMusicas: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var apolloModel = ApolloModel()
    @State var apolloMusic = Apollo_Musicas()
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: [.black, .purple], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        ForEach(apolloModel.musics, id: \.self) { Musica in
                            HStack {
                                VStack(){
                                    
                                    Button(action: {
                                        insert_music(music: Musica)
                                        apolloModel.remove_music_array(music_selected: Musica)
                                    }) {
                                        VStack {
                                            HStack {
                                                AsyncImage(url: URL(string: Musica.imagem!)){
                                                    image in
                                                    image.resizable().frame(width:50, height:50)
                                                }placeholder: {
                                                    Color.gray.frame(width:50, height:50)
                                                }
                                                HStack {
                                                    Text(Musica.nome_musica!)
                                                        .foregroundColor(.white)
                                                        .font(.headline)
                                                    Spacer()
                                                }
                                                HStack {
                                                    Text(Musica.artista!)
                                                        .foregroundColor(.white)
                                                        .font(.caption)
                                                    Spacer()
                                                }
                                            }
                                            
                                        }
                                    }
                                    .cornerRadius(15)
                                    .buttonStyle(.bordered)
                                    
                                    
                                }
                            }
                            .padding(.all, 3)
                        }
                    }.onAppear{
                        apolloModel.getAllMusics()
                        
                        
                        /*for i in MyVariables.music_selected {
                            if let location = apolloModel.musics.firstIndex(where: {$0 == i}) {
                                apolloModel.remove_music_array(music_selected: apolloModel.musics[location])
                            }
                        }*/
                    }
                    .padding(15)
                }
                
            }
            
        }
        
    }
}

func insert_music(music : Apollo_Musicas) {
    @State var exist : Bool = true
    for m in MyVariables.music_selected {
        if(m == music) {
            exist = false
        }
    }
    if(exist) {
        MyVariables.music_selected.append(music)
    } else {
        
    }
}

struct SelecaoMusicas_Previews: PreviewProvider {
    static var previews: some View {
        SelecaoMusicas()
    }
}

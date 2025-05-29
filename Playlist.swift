//
//  Playlist.swift
//  Playlist
//
//  Created by Student10 on 27/03/23.
//

import SwiftUI
import AVFoundation
import AVFAudio


class SoundManager : ObservableObject {
    var audioPlayer: AVPlayer?

    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}

struct Playlist: View {
    
    @State var song1 = false
    @StateObject private var soundManager = SoundManager()
    
    @State var codigo: String
    @State var showAlert = false
    
    @StateObject var apolloModel = ApolloModel()
    @State private var showingSheet = false
    
    @State var exist = false
    
    var body: some View {

        
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.black, .purple], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack {
                    
                    
                    ForEach(apolloModel.events, id:\.self){
                        playlists in
                        
                        if(playlists.codigo == codigo){
                            Text(playlists.nome_evento!).font(.largeTitle).foregroundColor(.white)

                            Button{
                            }
                            label: {
                                HStack{

                                    Image(systemName: "plus.app.fill").resizable()
                                        .foregroundColor(.white).frame(width: 20, height: 20).scaledToFill()
                                    Text("Adicionar Música").foregroundColor(.white)
                                    Spacer()

                                }
                            }
                            
                            //---------------

                            ScrollView(.vertical){
                                ForEach(playlists.musicas!, id:\.self){
                                    musicas in
                                    VStack{
                                        HStack{
                                            AsyncImage(url: URL(string: musicas.imagem!)){image in
                                                image.resizable().frame(width: 50, height:50)
                                            }
                                        placeholder: {
                                            Color.gray.frame(width: 50, height: 50)
                                        }

                                            VStack(alignment: .leading, spacing: 5){
                                                Text(musicas.nome_musica!).bold().font(.title2)
                                                HStack{
                                                    Text("\(musicas.nome_musica!)-\(musicas.album!)")
                                                }
                                            }.foregroundColor(.white)
                                            Spacer()
                                            Text("\(musicas.voto!)").foregroundColor(.white)

                                            Button{

                                            }
                                            label: {
                                                Image(systemName: "arrowtriangle.up").resizable().foregroundColor(.white).frame(width: 20, height: 20)
                                            }
                                        }
                                    }
                                }
                            }
                            
                            Spacer()
                            VStack {
                                Text("Californication").font(.title).foregroundColor(.white)
                                
                                Button{
                                    
                                    soundManager.playSound(sound:"https://dl.sndup.net/nx2y/Californication.mp3")
                                        
                                    
                                    song1.toggle()
                                    
                                    if song1{
                                        soundManager.audioPlayer?.play()
                                    } else {
                                        soundManager.audioPlayer?.pause()
                                    }
                                    
                                    
                                }
                            label:{
                                Image(systemName: song1 ? "pause.circle.fill": "play.circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                                    .padding(.trailing)
                            }
                                    
                                
                            }
                            
                        }
                        else{
                            VStack {
                                Text("Esse evento não existe!").font(.largeTitle).foregroundColor(.white)
                                Image(systemName: "flag.slash").resizable().foregroundColor(.white).frame(width: 100, height: 100)
                            }.padding(.bottom, 100.0)
                        }
                    }
                    

                    
                    //---------------
                    
                  
                }.navigationBarTitleDisplayMode(.inline)
                
            }.onAppear(){
                apolloModel.getAllMusics()
                apolloModel.getAllEvents()
            }
        }
    }
}

struct Playlist_Previews: PreviewProvider {
    static var previews: some View {
        Playlist(codigo: "20")
    }
}

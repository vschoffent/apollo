//
//  ContentView.swift
//  Tela_inicial
//
//  Created by Student21 on 27/03/23.
//


import SwiftUI

struct TelaInicial: View {
    @State var codigo: String = ""
    @State var showAlert = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle().fill(.purple)
                    .ignoresSafeArea()
                LinearGradient(colors: [.black, .purple], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack {
                    //     Text("Apollo").foregroundColor(Color.white)
                    Spacer()
                    Image(systemName: "ellipsis").foregroundColor(Color.white).rotationEffect(.degrees(-90)).frame(minWidth: 0, maxWidth: .infinity, alignment: .topTrailing).font(.system(size: 30))
                    
                    NavigationLink(destination:CriacaoEvento()) {
                        Image("Adesivo").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200, alignment: .topLeading)
                        
                        
                    }
                    Spacer()
                    Spacer()
                    //TextField("", text: $text)
                    //.placeholder(when: text.isEmpty) {
                    //  Text("Placeholder recreated").foregroundColor(.gray)
                    //}
                    
                    
                    HStack{
                        Image(systemName: "magnifyingglass").foregroundColor(Color.white)
                        
                        TextField("Digite seu código",text: $codigo).foregroundColor(.white).padding(.horizontal, 1.0).fixedSize(horizontal: true, vertical: true).padding()
                        
                    }
                    
                    NavigationLink(destination: Playlist(codigo: codigo)) {
                        Text("Entrar").foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .overlay(RoundedRectangle(cornerRadius: 3000.0).stroke(Color.white)
                                .frame(width: 100, height: 50))
                            .font(.custom("Avenir Book", size:30))
                        
                        
                    }
                    
                    
                    Spacer()
                    Spacer()
                    
                }
                            
                            }
                    
                    
        }.onAppear() {
            MyVariables.music_selected.removeAll()
        }
          
            }

        }
        
    
    struct TelaInicial_Previews: PreviewProvider {
        static var previews: some View {
            TelaInicial()
        }
    }

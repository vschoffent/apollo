//
//  ContentView.swift
//  Apollo
//
//  Created by Student18 on 30/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TelaInicial()
                .tabItem {
                    Label("",systemImage: "music.note.house")
                }
            TelaHistorico()
                .tabItem {
                    Label("",systemImage: "list.bullet")
                }
        }.accentColor(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

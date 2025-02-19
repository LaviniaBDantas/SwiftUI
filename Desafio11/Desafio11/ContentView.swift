//
//  ContentView.swift
//  Desafio11
//
//  Created by Turma02-10 on 19/02/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    @State var livro : Livro
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

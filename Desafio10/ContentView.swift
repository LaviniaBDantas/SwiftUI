//
//  ContentView.swift
//  Desafio10
//
//  Created by Turma02-10 on 17/02/25.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var personagem : Personagem
    var body: some View {
        ZStack{
            Color.brown.ignoresSafeArea()
            VStack{
                Text("Personagem: "+personagem.name).padding().foregroundColor(.white).bold().font(.title2)
                Text(personagem.slug).padding().foregroundColor(.white).bold()
                Text(personagem.house.name).padding().foregroundColor(.white).bold().background(.ultraThinMaterial).cornerRadius(10.0).font(.title2)
            }
        }
    }
}

struct ContentView: View {
    @StateObject var vm = ViewModel()
    @State var  personagem : Personagem =  Personagem(name: "", slug: "", house: Casa(name: "", slug: ""))
    
    @State private var showingSheet = false
    var body: some View {
        ZStack{
            Image("fundoGame").resizable().ignoresSafeArea()
            VStack {
                HStack{
                    Spacer()
                    Button{
                        personagem = Personagem(name: "", slug: "", house: Casa(name: "", slug: ""))
                        vm.fetch()
                    }label:{
                        Image(systemName: "arrow.clockwise.circle.fill").font(.title).foregroundColor(.white).padding()
                    }
                }
                Spacer()
                
                ForEach(vm.arrayQuote, id:\.self){ quote in
                    Text(quote.sentence).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding().foregroundColor(.white).bold().background(.ultraThinMaterial).cornerRadius(10.0)
                }
                Button("Quem disse?") {
                    personagem = (vm.arrayQuote.first?.character)!
                    showingSheet.toggle()
                }.font(.title2).bold().buttonStyle(.borderedProminent)
                    .tint(.brown).sheet(isPresented: $showingSheet) {
                    SheetView(personagem: $personagem)
                }
                Spacer()
                //.foregroundColor(.white).buttonStyle(.bordered)
            }.onAppear(){
                vm.fetch()
            }
        }
        //.padding()
    }
}

#Preview {
    ContentView()
}

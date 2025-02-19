//
//  ViewModel.swift
//  Desafio11
//
//  Created by Turma02-10 on 19/02/25.
//

import Foundation
class ViewModel : ObservableObject{
    @Published var arrayLivros : [Livro] = []
//    @Published var q : Quote?
    func fetch(){
        let url = "http://127.0.0.1:1880/ler"
        let task = URLSession.shared.dataTask(with: URL(string: url)!){
            data,_,error in
            
            do{
                let q = try JSONDecoder().decode(Livro.self, from: data!)
                print(q.name)
                self.arrayLivros =  []
                self.arrayLivros.append(q)
                print(self.arrayLivros.count)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

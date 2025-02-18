//
//  ViewModel.swift
//  Desafio10
//
//  Created by Turma02-10 on 17/02/25.
//

import Foundation

class ViewModel : ObservableObject{
    @Published var arrayQuote : [Quote] = []
//    @Published var q : Quote?
    func fetch(){
        let url = "https://api.gameofthronesquotes.xyz/v1/random"
        let task = URLSession.shared.dataTask(with: URL(string: url)!){
            data,_,error in
            
            do{
                let q = try JSONDecoder().decode(Quote.self, from: data!)
                print(q.sentence)
                self.arrayQuote =  []
                self.arrayQuote.append(q)
                print(self.arrayQuote.count)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

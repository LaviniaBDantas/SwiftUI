//
//  Model.swift
//  Desafio10
//
//  Created by Turma02-10 on 17/02/25.
//

import Foundation

struct Casa : Decodable, Hashable{
    var name : String
    var slug : String
}


struct Personagem : Decodable, Hashable{
    var name : String
    var slug : String
    var house : Casa
}

struct Quote: Decodable, Hashable{
    var sentence : String
    var character : Personagem
    
}

//
//  Model.swift
//  Desafio11
//
//  Created by Turma02-10 on 19/02/25.
//

import Foundation

struct Livro : Decodable, Hashable{
    var name : String
    var autor : Autor
}

struct Autor : Decodable, Hashable{
    var name : String
    var anoNascimento : Int
    var anoFalecimento : Int
}

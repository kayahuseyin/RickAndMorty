//
//  Model.swift
//  RickAndMortyCharacters
//
//  Created by Hüseyin Kaya on 26.12.2023.
//

import Foundation

struct CharactersModel: Decodable {
    
    var name: String?
    var species: String?
    var gender: String?
    var image: String?
}

struct NewResponse: Decodable {
    var results : [CharactersModel]
    
}

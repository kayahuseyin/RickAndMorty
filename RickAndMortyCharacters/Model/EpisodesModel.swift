//
//  EpisodesModel.swift
//  RickAndMortyCharacters
//
//  Created by Hüseyin Kaya on 26.12.2023.
//

import Foundation

struct EpisodesModel: Decodable {
    
    var name: String?
    var air_date: String?
    var episode: String?
    
}

struct AnotherResponse: Decodable {
    var results : [EpisodesModel]
    
}

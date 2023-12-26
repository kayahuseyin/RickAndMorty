//
//  WebServices.swift
//  RickAndMortyCharacters
//
//  Created by Hüseyin Kaya on 26.12.2023.
//

import Foundation

class WebServices {
    static let shared = WebServices()
    
    private init() {}
    
    func fetchCharacters(url: URL, completion: @escaping ([CharactersModel]?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data returned")
                completion(nil)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(NewResponse.self, from: data)
                let characters = decodedData.results.map { $0 }
                completion(characters)
            } catch {
                print("Error decoding data: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    func fetchEpisodes(url: URL, completion: @escaping ([EpisodesModel]?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data returned")
                completion(nil)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(AnotherResponse.self, from: data)
                let episodes = decodedData.results.map { $0 }
                completion(episodes)
            } catch {
                print("Error decoding data: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    //    func fetchCharacters(url: URL, completion: @escaping ([CharactersModel]?) -> Void) {
    //            
    //        URLSession.shared.dataTask(with: url) { data, response, error in
    //            
    //            if error != nil {
    //                print(error)
    //            } else {
    //                do {
    //                    let result = try JSONDecoder().decode([CharactersModel].self, from: data!)
    //                    completion(result)
    //                } catch {
    //                    print(error)
    //                }
    //            }
    //                
    //            } .resume() // URLSession'un bitimine
    //            
    //        
    //    }
    
    
    
    
}

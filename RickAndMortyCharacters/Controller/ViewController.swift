//
//  ViewController.swift
//  RickAndMortyCharacters
//
//  Created by Hüseyin Kaya on 26.12.2023.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet var charactersCV: UICollectionView!
    @IBOutlet var episodesCV: UICollectionView!
    
    var charactersModel: [CharactersModel] = []
    var episodesModel: [EpisodesModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersCV.dataSource = self
        charactersCV.delegate = self
        
        episodesCV.dataSource = self
        episodesCV.delegate = self
        
        getCharacter()
        getEpisode()
        
    }
    
    func getCharacter() {
        let url = URL(string: "https://rickandmortyapi.com/api/character")
        WebServices.shared.fetchCharacters(url: url!) { characters in
            if let characters = characters {
                DispatchQueue.main.async {
    
                    self.charactersModel = characters
                    self.charactersCV.reloadData()
                }
            }
        }
    }
    
//    func getCharacter() {
//        let url = URL(string: "https://rickandmortyapi.com/api/character")
//        WebServices.shared.fetchCharacters(url: url!) { data in
//            
//            if let characters = data {
//                DispatchQueue.main.sync {
//                    self.charactersModel = characters
//                    self.charactersCV.reloadData()
//                }
//                
//            }
//            
//        }
//    }
    
    func getEpisode() {
        let url = URL(string: "https://rickandmortyapi.com/api/episode")
        WebServices.shared.fetchEpisodes(url: url!) { episodes in
            if let episodes = episodes {
                DispatchQueue.main.async {
    
                    self.episodesModel = episodes
                    self.episodesCV.reloadData()
                }
            }
        }
    }


}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == charactersCV {
            charactersModel.count
            
        } else {
            episodesModel.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == charactersCV {
            
            let item = charactersModel[indexPath.row]
            let cell = charactersCV.dequeueReusableCell(withReuseIdentifier: "charactersCell", for: indexPath) as! CharactersCell
            cell.characterImage.sd_setImage(with: URL(string: item.image ?? "nil"))
            cell.characterName.text = item.name
            cell.characterSpecies.text = item.species
            cell.characterGender.text = item.gender
            
            return cell
            
        } else {
            let item = episodesModel[indexPath.row]
            let cell = episodesCV.dequeueReusableCell(withReuseIdentifier: "episodesCell", for: indexPath) as! EpisodesCell
            cell.episodeImage.image = UIImage(named: "rickandmorty")
            cell.episodeName.text = item.name
            cell.episodeLabel.text = item.episode
            cell.episodeReleaseDate.text = item.air_date
            
            return cell
        }
        
    }
    
    
}

//
//  ViewController.swift
//  pokeTest
//
//  Created by Павел Курзо on 24.07.22.
//

import UIKit

class RootViewController: UIViewController {
    
    private lazy var pokemon = [PokemonEntry]()
    private lazy var pokemonSelected = [PokemonSelected]()
    
    private lazy var capitalizedPokemonName = String()
    
    private var rootView: RootView {
        return self.view as! RootView
    }
    
    override func loadView() {
        super.loadView()
        self.view = RootView()
        apiCallPokemonData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
    }

    private func apiCallPokemonData() {
        PokeAPI().getData { result in
            switch result {
            case .success(let pokemon):
                self.pokemon = pokemon
                self.apiCallPokemonUrl()
            case .failure:
                break
            }
        }
    }
    
    private func apiCallPokemonUrl() {
        let group = DispatchGroup()
        for entry in pokemon {
            group.enter()
            PokemonSelectedAPI().getData(url: entry.url) { result in
                switch result {
                case .success(let pokemon):
                    self.pokemonSelected.append(pokemon)
                case .failure:
                    break
                }
                group.leave()
            }
        }
        group.notify(queue: .main) {
            self.rootView.collectionView.reloadData()
            dump(self.pokemonSelected)
        }
    }
    
    private func openDetailsVC(_ indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        detailsVC.modalPresentationStyle = .fullScreen
        detailsVC.pokemonNameString = "\(pokemon[indexPath.row].name)"
        detailsVC.pokemonUrlString = "\(String(describing: pokemonSelected[indexPath.row].sprites.front_default))"
        present(detailsVC, animated: true)
    }
    
    @objc func starButtonPressed() {
        print("obama")
        PokemonCell().starButton.backgroundColor = .red
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.identifier, for: indexPath) as! PokemonCell
        cell.backgroundColor = .white
        capitalizedPokemonName = "\(pokemon[indexPath.row].name)"
        capitalizedPokemonName.capitalizeFirstLetter()
        cell.pokemonNameLabel.text = capitalizedPokemonName
        cell.pokemonImageView.load(url: URL(string: self.pokemonSelected[indexPath.row].sprites.front_default!)!)
        cell.layer.cornerRadius = 10
        
        cell.starButton.addTarget(self, action: #selector(starButtonPressed), for: .primaryActionTriggered)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: rootView.collectionView.frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}

extension RootViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openDetailsVC(indexPath)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


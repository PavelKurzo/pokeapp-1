//
//  PokemonCell.swift
//  pokeTest
//
//  Created by Павел Курзо on 24.07.22.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    static let identifier = "Pokemon Cell"
    var selectedButton: Bool = true
    
    var pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var pokemonTypeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Pokemon of type"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let starButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isSelected = true
        button.addTarget(self, action: #selector(starButtonPressed), for: .primaryActionTriggered)
        return button
    }() 
    
    var pokemonImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    @objc func starButtonPressed() {
        if starButton.isSelected {
            let config = UIImage.SymbolConfiguration(textStyle: .largeTitle)
            let image = UIImage(systemName: "star.fill", withConfiguration: config)
            starButton.tintColor = .systemYellow
            starButton.setImage(image, for: .normal)
        } else {
            starButton.tintColor = .white
        }
        starButton.isSelected.toggle()
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview(pokemonNameLabel)
        addSubview(pokemonImageView)
        addSubview(pokemonTypeLabel)
        addSubview(starButton)
        setConstraints()
    }
    
    func setConstraints() {
        let constraints = [
            
            pokemonImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            pokemonImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            pokemonImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 90),
            
            pokemonNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            pokemonNameLabel.leftAnchor.constraint(equalTo: pokemonImageView.leftAnchor, constant: 100),
//            pokemonNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
            
            pokemonTypeLabel.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: 4),
            pokemonTypeLabel.leftAnchor.constraint(equalTo: pokemonImageView.leftAnchor, constant: 100),
//            pokemonTypeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            starButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            starButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -0),
            starButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            starButton.leftAnchor.constraint(equalTo: pokemonNameLabel.leftAnchor, constant: 200)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
}



//
//  DetailsView.swift
//  pokeTest
//
//  Created by Павел Курзо on 25.07.22.
//

import UIKit
import Foundation

class DetailsView: UIView {
            
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.layer.cornerRadius = 6
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.imageEdgeInsets.left = -20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pokemonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.layer.cornerRadius = 145
        return image
    }()
    
    let pokemonImageFrame: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor(white: 0.9, alpha: 0.8)
        image.layer.cornerRadius = 150
        return image
    }()
    
    let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(backButton)
        addSubview(pokemonImageFrame)
        addSubview(pokemonImage)
        addSubview(pokemonNameLabel)
        setConstraints()
        backgroundColor = .systemBackground
    }
    
    func setConstraints() {
        let constraints = [
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 68),
            backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 28),
            backButton.widthAnchor.constraint(equalToConstant: 68),
            
            pokemonImageFrame.topAnchor.constraint(equalTo: backButton.topAnchor, constant: 80),
            pokemonImageFrame.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pokemonImageFrame.heightAnchor.constraint(equalToConstant: 300),
            pokemonImageFrame.widthAnchor.constraint(equalToConstant: 300),
            
            pokemonImage.topAnchor.constraint(equalTo: pokemonImageFrame.topAnchor, constant: 4),
            pokemonImage.leftAnchor.constraint(equalTo: pokemonImageFrame.leftAnchor, constant: 4),
            pokemonImage.rightAnchor.constraint(equalTo: pokemonImageFrame.rightAnchor, constant: -4),
            pokemonImage.bottomAnchor.constraint(equalTo: pokemonImageFrame.bottomAnchor, constant: -4),

            pokemonNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImageFrame.bottomAnchor, constant: 20)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}


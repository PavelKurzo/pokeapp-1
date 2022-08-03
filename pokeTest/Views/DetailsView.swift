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
    
    let pokemonDefenceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.layer.borderColor = UIColor.systemBlue.cgColor
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 9
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pokemonAttackLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .systemRed
        label.layer.borderColor = UIColor.systemRed.cgColor
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 9
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pokemonPVLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .systemYellow
        label.backgroundColor = .systemBlue
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor(red: 0.016, green: 0.023, blue: 0.5, alpha: 1).cgColor
        label.layer.borderWidth = 4.0
        label.layer.cornerRadius = 37
        label.font = UIFont.systemFont(ofSize: 21, weight: .heavy)
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
        addSubview(pokemonDefenceLabel)
        addSubview(pokemonAttackLabel)
        addSubview(pokemonPVLabel)
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
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImageFrame.bottomAnchor, constant: 20),
            
            pokemonDefenceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -90),
            pokemonDefenceLabel.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: 20),
            pokemonDefenceLabel.heightAnchor.constraint(equalToConstant: 40),
            pokemonDefenceLabel.widthAnchor.constraint(equalToConstant: 160),
            
            pokemonAttackLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 90),
            pokemonAttackLabel.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: 20),
            pokemonAttackLabel.heightAnchor.constraint(equalToConstant: 40),
            pokemonAttackLabel.widthAnchor.constraint(equalToConstant: 160),
            
            pokemonPVLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 110),
            pokemonPVLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: 90),
            pokemonPVLabel.heightAnchor.constraint(equalToConstant: 74),
            pokemonPVLabel.widthAnchor.constraint(equalToConstant: 74),
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


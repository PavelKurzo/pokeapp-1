//
//  RootView.swift
//  pokeTest
//
//  Created by Павел Курзо on 24.07.22.
//

import Foundation
import UIKit

class RootView: UIView {
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor(white: 1, alpha: 0.2)
        cv.register(PokemonCell.self, forCellWithReuseIdentifier: PokemonCell.identifier)
        return cv
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "My Pokemons"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 35)
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
    
    func setup() {
        backgroundColor = .systemBackground
        addSubview(backgroundImage)
        addSubview(mainLabel)
        addSubview(collectionView)
        setConstraints()
    }

    func setConstraints() {
        let constraints = [
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            mainLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            mainLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            
            collectionView.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: 80),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48),
        ]
        NSLayoutConstraint.activate(constraints)
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

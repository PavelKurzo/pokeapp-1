//
//  DetailsViewController.swift
//  pokeTest
//
//  Created by Павел Курзо on 25.07.22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var pokemonNameString: String = ""
    var pokemonUrlString: String = ""
    var pokemonAttackStat: String = ""
    var pokemonDefenceStat: String = ""
    var pokemonPVStat: String = ""
            
    private var detailView: DetailsView {
        return self.view as! DetailsView
    }
    
    override func loadView() {
        super.loadView()
        self.view = DetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        pokemonNameString.capitalizeFirstLetter()
        detailView.pokemonNameLabel.text = pokemonNameString
        detailView.backButton.addTarget(self, action: #selector(backButtonPressed), for: .primaryActionTriggered)
        detailView.pokemonImage.load(url: URL(string: "\(pokemonUrlString)")!)
        detailView.pokemonAttackLabel.text = "Attack \(pokemonAttackStat)"
        detailView.pokemonDefenceLabel.text = "Defence \(pokemonDefenceStat)"
        detailView.pokemonPVLabel.text = "pv \(pokemonPVStat.capitalized)"
    }

    @objc func backButtonPressed() {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: false, completion: nil)
        }
    }
}

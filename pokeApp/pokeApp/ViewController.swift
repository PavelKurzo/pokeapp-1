//
//  ViewController.swift
//  pokeApp
//
//  Created by Павел Курзо on 18.07.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        APIService.shared.getPokemon(with: "ditto")
    }


}


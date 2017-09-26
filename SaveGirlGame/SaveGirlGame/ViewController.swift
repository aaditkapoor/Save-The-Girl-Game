//
//  ViewController.swift
//  SaveGirlGame
//
//  Created by Aadit Kapoor on 9/26/17.
//  Copyright © 2017 Aadit Kapoor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tapToPlay: UILabel!
    @IBOutlet weak var girlImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Setting the tap-to-play interface
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(Play)))
    }
    
    
    @objc func Play() {
        performSegue(withIdentifier: "gameStartSegue", sender: self)
    }
}


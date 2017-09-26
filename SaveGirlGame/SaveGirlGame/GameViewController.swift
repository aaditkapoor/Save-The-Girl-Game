//
//  GameViewController.swift
//  SaveGirlGame
//
//  Created by Aadit Kapoor on 9/26/17.
//  Copyright © 2017 Aadit Kapoor. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var characterImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.updateConstraintsIfNeeded()

        
        

    }
    
    @objc func begin() {
        var x = CGFloat(Int(arc4random()) % Int(self.view.bounds.size.width))
        var y = CGFloat(Int(arc4random()) % Int(self.view.bounds.size.height))
        
        
        var point = CGPoint(x: x, y: y)
        characterImageView.center = point
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(begin))
        
    }
    

    func getRandomValue() -> CGFloat {
        let random = Int(arc4random_uniform(UInt32(Int(self.view.bounds.maxX))) + 0)
        return CGFloat(random)
    }
    
    func checkIfOut()  -> Bool {
        if self.view.bounds.contains(self.characterImageView.frame){
            return false
        }
        else {
            return true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        UIView.animate(withDuration: 2, delay: 0.5, options: [], animations: {
            if self.checkIfOut()  {
                print("Over!")
                self.characterImageView.center.x = self.view.center.x
                self.characterImageView.center.y = self.view.center.y
            }
            else {
                
            self.characterImageView.center.x = self.characterImageView.center.x + self.getRandomValue()
                self.characterImageView.center.x = self.characterImageView.center.x - self.getRandomValue()

                self.characterImageView.center.y = self.characterImageView.center.y + self.getRandomValue()
                self.characterImageView.center.y = self.characterImageView.center.y - self.getRandomValue()

            }

            
        }) { (completed) in
            self.runNext()
        }
    }
    
    func runNext() {
        UIView.animate(withDuration: 2, delay: 0.5, options: [.beginFromCurrentState, .autoreverse], animations: {
            if self.checkIfOut() {
                print("Over")
                
                self.characterImageView.center.x = self.view.center.x
                self.characterImageView.center.y = self.view.center.y

            }
            else {
            self.characterImageView.center.x = self.characterImageView.center.x + self.getRandomValue()
            self.characterImageView.center.y = self.characterImageView.center.y - self.getRandomValue()
            }

            
        }) { (completed) in
            self.runNext()
        }
    }
    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.type == UIEventType.motion {
        if self.characterImageView.center.x < self.view.bounds.size.width {
            print("okay")
        }
        }
    }
        


}

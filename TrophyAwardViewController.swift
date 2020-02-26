//
//  TrophyAwardViewController.swift
//  Picma
//
//  Created by Andrew Shepherd on 2018-06-19.
//  Copyright © 2018 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation

class TrophyAwardViewController: UIViewController {

    //variables, constants and outlets
    var gamesWonTotal = UserDefaults.standard.integer(forKey: "GamesWonCounter")
    var hintsUsedTotal = UserDefaults.standard.integer(forKey: "HintsUsedCounter")
    var prizeMoneyTotal = UserDefaults.standard.integer(forKey: "PrizeMoneyCounter")
    var trophy10GamesWon = UserDefaults.standard.bool(forKey: "Trophy10GamesAwarded")
    var trophy50GamesWon = UserDefaults.standard.bool(forKey: "Trophy50GamesAwarded")
    var trophy500GamesWon = UserDefaults.standard.bool(forKey: "Trophy500GamesAwarded")
    var trophy10HintsWon = UserDefaults.standard.bool(forKey: "Trophy10HintsAwarded")
    var trophy50HintsWon = UserDefaults.standard.bool(forKey: "Trophy50HintsAwarded")
    var trophy100000PrizeWon = UserDefaults.standard.bool(forKey: "Trophy100000PrizesAwarded")
    var volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
    var trophyImageArray : [UIImage] = []
   
    @IBOutlet weak var trophyViewOutlet: UIView!
    @IBOutlet weak var claimOutlet: UIButton!
    @IBOutlet weak var trophyImageOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playSound(playSoundFile: "trophyRoom")

        //determinging which trophy to display first
        if gamesWonTotal == 10 && trophy10GamesWon != true {
            trophyImageArray.append(UIImage(named: "trophy10Games")!)
            UserDefaults.standard.set(true, forKey: "Trophy10GamesAwarded")
        }
        if gamesWonTotal == 50 && trophy50GamesWon != true {
            trophyImageArray.append(UIImage(named: "trophy50Games")!)
            UserDefaults.standard.set(true, forKey: "Trophy50GamesAwarded")
        }
        if gamesWonTotal == 500 && trophy500GamesWon != true {
            trophyImageArray.append(UIImage(named: "trophy500Games")!)
            UserDefaults.standard.set(true, forKey: "Trophy500GamesAwarded")
        }
        if prizeMoneyTotal >= 100000 && trophy100000PrizeWon != true {
            trophyImageArray.append(UIImage(named: "trophy100000Coins")!)
            UserDefaults.standard.set(true, forKey: "Trophy100000PrizesAwarded")
        }
        if hintsUsedTotal == 10 && trophy10HintsWon != true {
            trophyImageArray.append(UIImage(named: "trophy10Hints")!)
            UserDefaults.standard.set(true, forKey: "Trophy10HintsAwarded")
        }
        if hintsUsedTotal == 50 && trophy50HintsWon != true {
            trophyImageArray.append(UIImage(named: "trophy50Hints")!)
            UserDefaults.standard.set(true, forKey: "Trophy50HintsAwarded")
        }
        
        //setting trophy image, styling claim and trophy buttons and views
        trophyImageOutlet.image = trophyImageArray[0]
        claimOutlet.buttonDesign()
        claimOutlet.layer.borderColor = UIColor.init(red: 0.38, green: 0.227, blue: 0.808, alpha: 1.0).cgColor
        claimOutlet.layer.borderWidth = 3
        trophyViewOutlet.layer.cornerRadius = 10
        trophyViewOutlet.layer.borderColor = UIColor.init(red: 0.38, green: 0.227, blue: 0.808, alpha: 1.0).cgColor
        trophyViewOutlet.layer.borderWidth = 5
        trophyViewOutlet.layer.shadowColor = UIColor.darkGray.cgColor
        trophyViewOutlet.layer.shadowOffset = CGSize(width: 0, height: 0)
        trophyViewOutlet.layer.shadowOpacity = 0.5
        trophyViewOutlet.layer.shadowRadius = 4
    }
    
    //when claim button pressed, displays next trophies, if any, then dismisses VC when no trophies left
    @IBAction func claimAction(_ sender: UIButton) {
        playSound(playSoundFile: "buttonClick")
        if trophyImageArray.count == 3 {
            trophyImageOutlet.image = trophyImageArray[1]
            trophyImageArray.remove(at: 0)
        } else if trophyImageArray.count == 2 {
            trophyImageOutlet.image = trophyImageArray[1]
            trophyImageArray.remove(at: 0)
        } else {            
            if presentingViewController is WinViewController {
                let when = DispatchTime.now() + 0.3
                DispatchQueue.main.asyncAfter(deadline: when) {
                    self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
                }
            } else {
                self.presentingViewController?.dismiss(animated: true, completion: nil)
            }
        }
    }
}

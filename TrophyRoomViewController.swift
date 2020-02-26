//
//  TrophyRoomViewController.swift
//  Picma
//
//  Created by Andrew Shepherd on 2018-06-07.
//  Copyright © 2018 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation

class TrophyRoomViewController: UIViewController {
  
    //variables, constants and outlets
    var trophy10GamesWon = UserDefaults.standard.bool(forKey: "Trophy10GamesAwarded")
    var trophy50GamesWon = UserDefaults.standard.bool(forKey: "Trophy50GamesAwarded")
    var trophy500GamesWon = UserDefaults.standard.bool(forKey: "Trophy500GamesAwarded")
    var trophy10HintsWon = UserDefaults.standard.bool(forKey: "Trophy10HintsAwarded")
    var trophy50HintsWon = UserDefaults.standard.bool(forKey: "Trophy50HintsAwarded")
    var trophy100000PrizeWon = UserDefaults.standard.bool(forKey: "Trophy100000PrizesAwarded")
    var coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
    var volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
    
    @IBOutlet weak var volumeOutlet: UIButton!
    @IBOutlet weak var coinBackOutlet: UIView!
    @IBOutlet weak var coinLabelOutlet: UILabel!
    @IBOutlet var trophyOutlets: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //displaying volume icon based on setting
        if volumeChoice == true {
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
        } else {
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
        }
        
        //styling coin label with coin total
        coinLabelOutlet.text = "\(coinTotal)"
        coinBackOutlet.layer.borderWidth = 3
        coinBackOutlet.layer.borderColor = UIColor.init(red: 0.38, green: 0.227, blue: 0.808, alpha: 1.0).cgColor
        coinBackOutlet.layer.cornerRadius = 5
        
        //displaying trophies faded if you haven't won them yet
        var trophyAwardedArray = [trophy10GamesWon, trophy50GamesWon, trophy500GamesWon, trophy10HintsWon, trophy50HintsWon, trophy100000PrizeWon]
        
        for number in 0...5 {
            if trophyAwardedArray[number] == true {
                trophyOutlets[number].alpha = 1
            }
        }
        
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when) {
            playSound(playSoundFile: "trophyRoom")
        }
    }

    //return to launch VC
    @IBAction func backButtonAction(_ sender: UIButton) {
        playSound(playSoundFile: "buttonClick")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //setting volume and icon based on selection
    @IBAction func volumeChoiceAction(_ sender: UIButton) {
        if volumeChoice == true {
            volumeChoice = false
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
            UserDefaults.standard.set(volumeChoice, forKey: "Volume")
        } else if volumeChoice == false {
            volumeChoice = true
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
            UserDefaults.standard.set(volumeChoice, forKey: "Volume")
            playSound(playSoundFile: "buttonClick")
        }
    }
}

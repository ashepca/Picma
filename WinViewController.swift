//
//  TenWinViewController.swift
//  Picma
//
//  Created by Andrew Shepherd on 2018-06-09.
//  Copyright © 2018 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation

protocol winViewDelegateProtocol {
    func updateCoinLabelWithPrize()
}

class WinViewController: UIViewController {

    //variables, contants and outlets
    var winViewDelegate: winViewDelegateProtocol!
    var coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
    var prizeMoneyTotal = UserDefaults.standard.integer(forKey: "PrizeMoneyCounter")
    var gamesWonTotal = UserDefaults.standard.integer(forKey: "GamesWonCounter")
    var hintsUsedTotal = UserDefaults.standard.integer(forKey: "HintsUsedCounter")
    var trophy10HintsWon = UserDefaults.standard.bool(forKey: "Trophy10HintsAwarded")
    var trophy50HintsWon = UserDefaults.standard.bool(forKey: "Trophy50HintsAwarded")
    var trophy100000PrizeWon = UserDefaults.standard.bool(forKey: "Trophy100000PrizesAwarded")
    var sizePuzzlePackChoosen = UserDefaults.standard.integer(forKey: "SizePackChoice")
    var volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
    
    @IBOutlet weak var winViewOutlet: UIView!
    @IBOutlet var prizeOutlets: [UIButton]!
    @IBOutlet var prizeAmountOutlets: [UILabel]!
    @IBOutlet weak var claimPrizeOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playSound(playSoundFile: "win")
        
        //styling win VC main view and claim button
        winViewOutlet.layer.cornerRadius = 10
        winViewOutlet.layer.borderColor = UIColor.init(red: 0.38, green: 0.227, blue: 0.808, alpha: 1.0).cgColor
        winViewOutlet.layer.borderWidth = 5
        winViewOutlet.layer.shadowColor = UIColor.darkGray.cgColor
        winViewOutlet.layer.shadowOffset = CGSize(width: 0, height: 0)
        winViewOutlet.layer.shadowOpacity = 0.5
        winViewOutlet.layer.shadowRadius = 4
        
        claimPrizeOutlet.buttonDesign()
        
    }
    
    //randoming selecting prize amount based on level difficulty
    @IBAction func prizeSelectionAction(_ sender: UIButton) {
        
        playSound(playSoundFile: "chestOpen")
        
        var prizeMultiplier : Int
        
        if sizePuzzlePackChoosen >= 200 {
            prizeMultiplier = 39
        } else if sizePuzzlePackChoosen >= 150 {
            prizeMultiplier = 21
        } else {
            prizeMultiplier = 9
        }
        
        let randomPrize1 = ((Int(arc4random_uniform(UInt32(prizeMultiplier))) * 10) + 10)
        let randomPrize2 = ((Int(arc4random_uniform(UInt32(prizeMultiplier))) * 10) + 10)
        let randomPrize3 = ((Int(arc4random_uniform(UInt32(prizeMultiplier))) * 10) + 10)
        let prizeArray = [randomPrize1, randomPrize2, randomPrize3]

        //making chest icons open and displaying prize amounts
        for button in 0...2 {
            prizeOutlets[button].isEnabled = false
            prizeOutlets[button].setImage(UIImage(named: "chestOpen"), for: .disabled)
            prizeAmountOutlets[button].text = String(prizeArray[button])
            prizeAmountOutlets[button].alpha = 1
            if button != sender.tag {
                prizeOutlets[button].alpha = 0.6
                prizeAmountOutlets[button].alpha = 0.5
            }
        }
        
        //claiming prize amount and updating coin total and prize money total counters
        claimPrizeOutlet.setTitle("CLAIM", for: .normal)
        claimPrizeOutlet.alpha = 1
        claimPrizeOutlet.isEnabled = true
        coinTotal += prizeArray[sender.tag]
        UserDefaults.standard.set(coinTotal, forKey: "CoinCounter")
        prizeMoneyTotal += prizeArray[sender.tag]
        UserDefaults.standard.set(prizeMoneyTotal, forKey: "PrizeMoneyCounter")
    }

    //action when claim button selected to open trophy VC or dismiss prize VC
    @IBAction func claimPrizeAction(_ sender: UIButton) {
        
        if gamesWonTotal == 10 || gamesWonTotal == 50 || gamesWonTotal == 500 || (hintsUsedTotal >= 10 && trophy10HintsWon != true) || (hintsUsedTotal >= 50 && trophy50HintsWon != true) || (prizeMoneyTotal >= 100000 && trophy100000PrizeWon != true) {
            winViewDelegate.updateCoinLabelWithPrize()
            let when = DispatchTime.now() + 2 // time fix
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.performSegue(withIdentifier: "trophyWonSegue", sender: self)
            }
        } else {
            winViewDelegate.updateCoinLabelWithPrize()
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
}

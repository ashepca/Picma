//
//  PuzzleSelectorViewController.swift
//  Picma
//
//  Created by Andrew Shepherd on 2018-06-08.
//  Copyright © 2018 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation
import StoreKit

class PuzzleSelectorViewController: UIViewController {
   
    //variables, constants and outlets
    var puzzleNumber = 1
    let sizePuzzlePackChoosen = UserDefaults.standard.integer(forKey: "SizePackChoice")
    var puzzlesDoneArray : [Bool] = []
    var coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
    var volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
    
    @IBOutlet weak var volumeOutlet: UIButton!
    @IBOutlet weak var coinBackOutlet: UIView!
    @IBOutlet weak var coinLabelOutlet: UILabel!
    @IBOutlet var puzzleChoiceOutlet: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //styling coin label with current coin total
        coinLabelOutlet.text = "\(coinTotal)"
        coinBackOutlet.layer.borderWidth = 3
        coinBackOutlet.layer.borderColor = UIColor.init(red: 0.38, green: 0.227, blue: 0.808, alpha: 1.0).cgColor
        coinBackOutlet.layer.cornerRadius = 5
        
        //setting volume icon based on setting
        if volumeChoice == true {
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
        } else {
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
        }
        
        //setting the star icon to indicate if a puzzle is completed already
        puzzlesDoneArray = UserDefaults.standard.array(forKey: "Pack\(sizePuzzlePackChoosen)DoneCounter") as! [Bool]
        for puzzle in 0...11 {
            if puzzlesDoneArray[puzzle] == true {
                puzzleChoiceOutlet[puzzle].setBackgroundImage(UIImage(named: "star"), for: .normal)
            }
        }
    }
    
    //setting puzzle done star, coin total and colume choices when view appears (i.e. forward or backward)
    override func viewWillAppear(_ animated: Bool) {
        puzzlesDoneArray = UserDefaults.standard.array(forKey: "Pack\(sizePuzzlePackChoosen)DoneCounter") as! [Bool]
        for puzzle in 0...11 {
            if puzzlesDoneArray[puzzle] == true {
                puzzleChoiceOutlet[puzzle].setBackgroundImage(UIImage(named: "star"), for: .normal)
            }
        }
        coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
        coinLabelOutlet.text = "\(coinTotal)"
        volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
        if volumeChoice == true {
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
        } else {
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
        }
        // asks for a rating review if player has at least 500 coins (meaning has won multiple games) (only runs 3 times a year per apple logic)
        if coinTotal >= 500 {
            SKStoreReviewController.requestReview()
        }
    }
    
    //back button moves to VC lower in stack
    @IBAction func backButtonAction(_ sender: UIButton) {
        playSound(playSoundFile: "buttonClick")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //setting volume button setting and icon
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
    
    //open the correct board size VC depening on puzzle pack choosen
    @IBAction func puzzleChoice(_ sender: UIButton) {
        playSound(playSoundFile: "buttonClick")
        puzzleNumber = sender.tag
        UserDefaults.standard.set(puzzleNumber, forKey: "PuzzleNumber")
        if sizePuzzlePackChoosen <= 109 {
            performSegue(withIdentifier: "tenBoardSegue", sender: self)
        } else if sizePuzzlePackChoosen <= 159 {
            performSegue(withIdentifier: "fifteenBoardSegue", sender: self)
        } else if sizePuzzlePackChoosen <= 209 {
            performSegue(withIdentifier: "twentyBoardSegue", sender: self)
        }
    }
}


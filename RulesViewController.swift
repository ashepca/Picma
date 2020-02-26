//
//  RulesViewController.swift
//  Picma
//
//  Created by Andrew Shepherd on 2018-06-07.
//  Copyright © 2018 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation

class RulesViewController: UIViewController {

    //variables, constants and outlets
    var coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
    var volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
    
    @IBOutlet weak var volumeOutlet: UIButton!
    @IBOutlet weak var coinBackOutlet: UIView!
    @IBOutlet weak var coinLabelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //styling coin label with current total
        coinLabelOutlet.text = "\(coinTotal)"
        coinBackOutlet.layer.borderWidth = 3
        coinBackOutlet.layer.borderColor = UIColor.init(red: 0.38, green: 0.227, blue: 0.808, alpha: 1.0).cgColor
        coinBackOutlet.layer.cornerRadius = 5
        
        //presenting volume icon based on setting
        if volumeChoice == true {
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
        } else {
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
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

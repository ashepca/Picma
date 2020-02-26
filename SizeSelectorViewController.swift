//
//  SizeSelectorViewController.swift
//  Picma
//
//  Created by Andrew Shepherd on 2018-05-24.
//  Copyright © 2018 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation
import StoreKit

class SizeSelectorViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {

    // variables and outlets
    var sizePuzzlePackChoosen = 101
    var unlockedPuzzlePacks = [101, 151, 201]
    var pack101DoneArray = Array(repeating: false, count: 12)
    var pack102DoneArray = Array(repeating: false, count: 12)
    var pack103DoneArray = Array(repeating: false, count: 12)
    var pack151DoneArray = Array(repeating: false, count: 12)
    var pack152DoneArray = Array(repeating: false, count: 12)
    var pack153DoneArray = Array(repeating: false, count: 12)
    var pack201DoneArray = Array(repeating: false, count: 12)
    var pack202DoneArray = Array(repeating: false, count: 12)
    var pack203DoneArray = Array(repeating: false, count: 12)
    var coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
    var volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
    
    @IBOutlet weak var volumeOutlet: UIButton!
    @IBOutlet weak var restoreOutlet: UIButton!
    @IBOutlet weak var coinBackOutlet: UIView!
    @IBOutlet weak var coinLabelOutlet: UILabel!
    @IBOutlet var sizePackOutlets: [UIButton]!
    @IBOutlet var lockOutlets: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        //styling restore, coin label with current coin total
        restoreOutlet.layer.cornerRadius = 5
        restoreOutlet.titleLabel?.textAlignment = .center
        coinLabelOutlet.text = "\(coinTotal)"
        coinBackOutlet.layer.borderWidth = 3
        coinBackOutlet.layer.borderColor = UIColor.init(red: 0.38, green: 0.227, blue: 0.808, alpha: 1.0).cgColor
        coinBackOutlet.layer.cornerRadius = 5
        
        //registering if volume setting is on or off
        if volumeChoice == true {
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
        } else {
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
        }

        //setting user defaults for all puzzle packs
        UserDefaults.standard.register(defaults: ["UnlockedPuzzlePacks" : unlockedPuzzlePacks])
        UserDefaults.standard.register(defaults: ["Pack101DoneCounter" : pack101DoneArray])
        UserDefaults.standard.register(defaults: ["Pack102DoneCounter" : pack102DoneArray])
        UserDefaults.standard.register(defaults: ["Pack103DoneCounter" : pack103DoneArray])
        UserDefaults.standard.register(defaults: ["Pack151DoneCounter" : pack151DoneArray])
        UserDefaults.standard.register(defaults: ["Pack152DoneCounter" : pack152DoneArray])
        UserDefaults.standard.register(defaults: ["Pack153DoneCounter" : pack153DoneArray])
        UserDefaults.standard.register(defaults: ["Pack201DoneCounter" : pack201DoneArray])
        UserDefaults.standard.register(defaults: ["Pack202DoneCounter" : pack202DoneArray])
        UserDefaults.standard.register(defaults: ["Pack203DoneCounter" : pack203DoneArray])
        
        unlockedPuzzlePacks = UserDefaults.standard.array(forKey: "UnlockedPuzzlePacks") as! [Int]
        
        //displaying lock image or not based on whether the pack has been unlocked
        for lock in 0...5 {
            if unlockedPuzzlePacks.contains(lockOutlets[lock].tag) {
                lockOutlets[lock].alpha = 0
            }
        }
        
        //loading product list from app store
        if(SKPaymentQueue.canMakePayments()) {
            let productID: NSSet = NSSet(objects: "com.blueoakapps.Picma.unlockpuzzlepack102", "com.blueoakapps.Picma.unlockpuzzlepack103", "com.blueoakapps.Picma.unlockpuzzlepack152", "com.blueoakapps.Picma.unlockpuzzlepack153", "com.blueoakapps.Picma.unlockpuzzlepack202", "com.blueoakapps.Picma.unlockpuzzlepack203")
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>)
            request.delegate = self
            request.start()
        } else {
            print("please enable IAPS")
        }
    }
    
    //Clearing SKPaymentQueue
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SKPaymentQueue.default().remove(self)
    }
    
    //updating coin total label and volume choice, if changed on VCs above in stack
    override func viewWillAppear(_ animated: Bool) {
        coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
        coinLabelOutlet.text = "\(coinTotal)"
        volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
        if volumeChoice == true {
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
        } else {
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
        }
    }
    
    //lauching puzzle selector VC if pack unlocked, or launching buy puzzles VC to unlock pack
    @IBAction func sizeSelectionAction(_ sender: UIButton) {
        sizePuzzlePackChoosen = sender.tag
        UserDefaults.standard.set(sizePuzzlePackChoosen, forKey: "SizePackChoice")
        if unlockedPuzzlePacks.contains(sizePuzzlePackChoosen) {
            playSound(playSoundFile: "buttonClick")
            performSegue(withIdentifier: "goToPuzzleSelectionSegue", sender: self)
        } else {
            playSound2(playSoundFile: "storeBell")
            let buyPuzzlesVC = storyboard?.instantiateViewController(withIdentifier: "BuyPuzzlesViewController") as! BuyPuzzlesViewController
            buyPuzzlesVC.buyPuzzlesViewDelegate = self
            present(buyPuzzlesVC, animated: true, completion: nil)
        }
    }
    
    //back to lower VC in stack
    @IBAction func backButtonAction(_ sender: UIButton) {
        playSound(playSoundFile: "buttonClick")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //styling volume icon based on volume setting selection
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
    
    //restoring purchases, i.e. previously unlocked puzzle packs
    @IBAction func restorePurchasesAction(_ sender: UIButton) {
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
 
    var list = [SKProduct]()
    var p = SKProduct()

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let myProduct = response.products
        for product in myProduct {
            list.append(product)
        }
        restoreOutlet.isEnabled = true
    }

    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        for transaction in queue.transactions {
            let t: SKPaymentTransaction = transaction
            let prodID = t.payment.productIdentifier as String
            switch prodID {
                case "com.blueoakapps.Picma.unlockpuzzlepack102":
                    unlockedPuzzlePacks.append(102)
                case "com.blueoakapps.Picma.unlockpuzzlepack103":
                    unlockedPuzzlePacks.append(103)
                case "com.blueoakapps.Picma.unlockpuzzlepack152":
                    unlockedPuzzlePacks.append(152)
                case "com.blueoakapps.Picma.unlockpuzzlepack153":
                    unlockedPuzzlePacks.append(153)
                case "com.blueoakapps.Picma.unlockpuzzlepack202":
                    unlockedPuzzlePacks.append(202)
                case "com.blueoakapps.Picma.unlockpuzzlepack203":
                    unlockedPuzzlePacks.append(203)
                default:
                    print("IAP not found")
            }
            for lock in 0...5 {
                if unlockedPuzzlePacks.contains(lockOutlets[lock].tag) {
                    lockOutlets[lock].alpha = 0
                }
            }
            UserDefaults.standard.set(unlockedPuzzlePacks, forKey: "UnlockedPuzzlePacks")
        }
    }
    
    //No purchases made directly from this VC, but this function is required to meet protocols so restore purchases button works
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
    }

}

// extension to update this VC (coin total / lock icons) based on unlocking actions taken on buy puzzle VC
extension SizeSelectorViewController: buyPuzzlesViewDelegateProtocol {
    func updateLockedPuzzlePacks() {
        coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
        coinLabelOutlet.text = "\(coinTotal)"
        unlockedPuzzlePacks = UserDefaults.standard.array(forKey: "UnlockedPuzzlePacks") as! [Int]
        for lock in 0...5 {
            if unlockedPuzzlePacks.contains(lockOutlets[lock].tag) {
                lockOutlets[lock].alpha = 0
            }
        }
    }
}

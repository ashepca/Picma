//
//  BuyPuzzlesViewController.swift
//  Picma
//
//  Created by Andrew Shepherd on 2018-07-06.
//  Copyright © 2018 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation
import StoreKit

protocol buyPuzzlesViewDelegateProtocol {
    func updateLockedPuzzlePacks()
}

class BuyPuzzlesViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    //variables and outlets
    var buyPuzzlesViewDelegate: buyPuzzlesViewDelegateProtocol!
    var sizePuzzlePackChoosen = UserDefaults.standard.integer(forKey: "SizePackChoice")
    var unlockedPuzzlePacks : [Int] = UserDefaults.standard.array(forKey: "UnlockedPuzzlePacks") as! [Int]
    var coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
    var volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
    
    @IBOutlet weak var buyPuzzlesViewOutlet: UIView!
    @IBOutlet weak var cancelOutlet: UIButton!
    @IBOutlet var buyPuzzlesOutlets: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //styling this VC's main view
        buyPuzzlesViewOutlet.layer.cornerRadius = 10
        buyPuzzlesViewOutlet.layer.borderColor = UIColor.init(red: 0.38, green: 0.227, blue: 0.808, alpha: 1.0).cgColor
        buyPuzzlesViewOutlet.layer.borderWidth = 5
        buyPuzzlesViewOutlet.layer.shadowColor = UIColor.darkGray.cgColor
        buyPuzzlesViewOutlet.layer.shadowOffset = CGSize(width: 0, height: 0)
        buyPuzzlesViewOutlet.layer.shadowOpacity = 0.5
        buyPuzzlesViewOutlet.layer.shadowRadius = 4
        
        //cancel X view design
        cancelOutlet.buttonDesign()

        //stlying VC buttons
        for button in 0...1 {
            buyPuzzlesOutlets[button].buttonDesign()
            buyPuzzlesOutlets[button].titleLabel?.textAlignment = .center
        }

        //setting coin price based on puzzle pack number choosen, i.f. for 10x10, 15x15 or 20x20
        if sizePuzzlePackChoosen <= 149 {
            buyPuzzlesOutlets[0].setTitle("2500 Coins", for: .normal)
            if coinTotal < 2500 {
                buyPuzzlesOutlets[0].isEnabled = false
                buyPuzzlesOutlets[0].alpha = 0.5
            }
        } else if sizePuzzlePackChoosen <= 199 {
            buyPuzzlesOutlets[0].setTitle("5000 Coins", for: .normal)
            if coinTotal < 5000 {
                buyPuzzlesOutlets[0].isEnabled = false
                buyPuzzlesOutlets[0].alpha = 0.5
            }
        } else {
            if coinTotal < 10000 {
                buyPuzzlesOutlets[0].isEnabled = false
                buyPuzzlesOutlets[0].alpha = 0.5
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
    
    //dismiss VC if no unlock button choosen
    @IBAction func cancelAction(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //unlocks puzzle pack if fake coins used and updates coin total and lock icons
    @IBAction func unlockButtonAction(_ sender: UIButton) {
        if sizePuzzlePackChoosen <= 149 {
            coinTotal -= 2500
        } else if sizePuzzlePackChoosen <= 199 {
            coinTotal -= 5000
        } else {
            coinTotal -= 10000
        }
        UserDefaults.standard.set(coinTotal, forKey: "CoinCounter")
        unlockedPuzzlePacks.append(sizePuzzlePackChoosen)
        UserDefaults.standard.set(unlockedPuzzlePacks, forKey: "UnlockedPuzzlePacks")
        playSound(playSoundFile: "unlock")
        buyPuzzlesViewDelegate.updateLockedPuzzlePacks()
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //unlocks puzzle pack if real money used and updates lock icons
    @IBAction func unlockRealMoneyAction(_ sender: UIButton) {
        if sizePuzzlePackChoosen == 102 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Picma.unlockpuzzlepack102") {
                    p = product
                    buyProduct()
                }
            }
        } else if sizePuzzlePackChoosen == 103 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Picma.unlockpuzzlepack103") {
                    p = product
                    buyProduct()
                }
            }
        } else if sizePuzzlePackChoosen == 152 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Picma.unlockpuzzlepack152") {
                    p = product
                    buyProduct()
                }
            }
        }
        else if sizePuzzlePackChoosen == 153 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Picma.unlockpuzzlepack153") {
                    p = product
                    buyProduct()
                }
            }
        } else if sizePuzzlePackChoosen == 202 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Picma.unlockpuzzlepack202") {
                    p = product
                    buyProduct()
                }
            }
        } else if sizePuzzlePackChoosen == 203 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Picma.unlockpuzzlepack203") {
                    p = product
                    buyProduct()
                }
            }
        }
    }
    
    func buyProduct() {
        let pay = SKPayment(product: p)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(pay as SKPayment)
    }
    
    func unlocksWithMoney() {
        unlockedPuzzlePacks.append(sizePuzzlePackChoosen)
        UserDefaults.standard.set(unlockedPuzzlePacks, forKey: "UnlockedPuzzlePacks")
        playSound(playSoundFile: "unlock")
        buyPuzzlesViewDelegate.updateLockedPuzzlePacks()
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    var list = [SKProduct]()
    var p = SKProduct()
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let myProduct = response.products
        for product in myProduct {
            list.append(product)
            
            //obtaining local currency symbol
            let currencyCode = product.priceLocale.currencyCode
            var currencySymbol = "$"
            
            if currencyCode! == "CAD" || currencyCode == "USD" {
                currencySymbol = "$"
            } else if currencyCode! == "CNY" || currencyCode == "JPY" {
                currencySymbol = "¥"
            } else if currencyCode! == "EUR" {
                currencySymbol = "€"
            } else if currencyCode! == "GBP" {
                currencySymbol = "£"
            } else if currencyCode! == "CHF" {
                currencySymbol = "CHF"
            } else if currencyCode! == "DKK" || currencyCode! == "NOK" || currencyCode! == "SEK"{
                currencySymbol = "kr"
            } else {
                currencySymbol = "$"
            }

            //updating button text to include local pricing and currency symbol
            if currencySymbol == "€" || currencySymbol == "kr" {
                if sizePuzzlePackChoosen <= 149 && (product.productIdentifier == "com.blueoakapps.Picma.unlockpuzzlepack102" || product.productIdentifier == "com.blueoakapps.Picma.unlockpuzzlepack103") {
                    buyPuzzlesOutlets[1].setTitle("\(product.price) \(currencySymbol)", for: .normal)
                } else if sizePuzzlePackChoosen >= 150 && sizePuzzlePackChoosen <= 199 && (product.productIdentifier == "com.blueoakapps.Picma.unlockpuzzlepack152" || product.productIdentifier == "com.blueoakapps.Picma.unlockpuzzlepack153") {
                    buyPuzzlesOutlets[1].setTitle("\(product.price) \(currencySymbol)", for: .normal)
                } else if sizePuzzlePackChoosen >= 200 && (product.productIdentifier == "com.blueoakapps.Picma.unlockpuzzlepack202" || product.productIdentifier == "com.blueoakapps.Picma.unlockpuzzlepack203") {
                    buyPuzzlesOutlets[1].setTitle("\(product.price) \(currencySymbol)", for: .normal)
                }
            } else {
                if sizePuzzlePackChoosen <= 149 && (product.productIdentifier == "com.blueoakapps.Picma.unlockpuzzlepack102" || product.productIdentifier == "com.blueoakapps.Picma.unlockpuzzlepack103") {
                    buyPuzzlesOutlets[1].setTitle("\(currencySymbol)\(product.price)", for: .normal)
                } else if sizePuzzlePackChoosen >= 150 && sizePuzzlePackChoosen <= 199 && (product.productIdentifier == "com.blueoakapps.Picma.unlockpuzzlepack152" || product.productIdentifier == "com.blueoakapps.Picma.unlockpuzzlepack153")  {
                    buyPuzzlesOutlets[1].setTitle("\(currencySymbol)\(product.price)", for: .normal)
                } else if sizePuzzlePackChoosen >= 200 && (product.productIdentifier == "com.blueoakapps.Picma.unlockpuzzlepack202" || product.productIdentifier == "com.blueoakapps.Picma.unlockpuzzlepack203") {
                    buyPuzzlesOutlets[1].setTitle("\(currencySymbol)\(product.price)", for: .normal)
                }
            }
        }
        buyPuzzlesOutlets[0].isEnabled = true
        buyPuzzlesOutlets[1].isEnabled = true
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction: AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
            switch trans.transactionState {
            case .purchased:
                unlocksWithMoney()
                queue.finishTransaction(trans)
            case .failed:
                print("buy error")
                queue.finishTransaction(trans)
                break
            default:
                print("Default")
                break
            }
        }
    }
}

//
//  BuyViewController.swift
//  Picma
//
//  Created by Andrew Shepherd on 2018-06-20.
//  Copyright © 2018 Blue Oak Apps. All rights reserved.
//

import UIKit
import StoreKit

protocol buyViewDelegateProtocol {
    func updateHintLabelWithPurchase()
}

class BuyViewController: UIViewController, SKProductsRequestDelegate, SKPaymentTransactionObserver {

    //variables, constants and outlets
    var buyViewDelegate: buyViewDelegateProtocol!
    var hintTotal = UserDefaults.standard.integer(forKey: "HintCounter")
    var coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
    
    @IBOutlet weak var buyViewOutlet: UIView!
    @IBOutlet weak var cancelOutlet: UIButton!
    @IBOutlet var hintCoinsOutlet: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //letting coin buttons be active if you have enough coins
        if coinTotal < 2500 {
            for label in 0...2 {
                hintCoinsOutlet[label].alpha = 0.5
                hintCoinsOutlet[label].isEnabled = false
            }
        } else if coinTotal < 5000 {
            for label in 1...2 {
                hintCoinsOutlet[label].alpha = 0.5
                hintCoinsOutlet[label].isEnabled = false
            }
        } else if coinTotal < 10000 {
            hintCoinsOutlet[2].alpha = 0.5
            hintCoinsOutlet[2].isEnabled = false
        }
        
        //styling the buy VC main view and buttons
        buyViewOutlet.layer.cornerRadius = 10
        buyViewOutlet.layer.borderColor = UIColor.init(red: 0.38, green: 0.227, blue: 0.808, alpha: 1.0).cgColor
        buyViewOutlet.layer.borderWidth = 5
        buyViewOutlet.layer.shadowColor = UIColor.darkGray.cgColor
        buyViewOutlet.layer.shadowOffset = CGSize(width: 0, height: 0)
        buyViewOutlet.layer.shadowOpacity = 0.5
        buyViewOutlet.layer.shadowRadius = 4
        cancelOutlet.buttonDesign()
        for button in 0...5 {
            hintCoinsOutlet[button].buttonDesign()
            hintCoinsOutlet[button].titleLabel?.textAlignment = .center
        }
        
        //loading product list from app store
        if(SKPaymentQueue.canMakePayments()) {
            let productID: NSSet = NSSet(objects: "com.blueoakapps.Picma.get5hints", "com.blueoakapps.Picma.get12hints", "com.blueoakapps.Picma.get25hints")
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

    //cancel button dismisses VC with no actions
    @IBAction func cancelBuyAction(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //if hints are bought with fake coins, hint and coin totals are updated
    @IBAction func buyAction(_ sender: UIButton) {
        if sender.tag == 5 {
            hintTotal += 5
            coinTotal -= 2500
        } else if sender.tag == 12 {
            hintTotal += 12
            coinTotal -= 5000
        } else if sender.tag == 25 {
            hintTotal += 25
            coinTotal -= 10000
        }
            UserDefaults.standard.set(hintTotal, forKey: "HintCounter")
            UserDefaults.standard.set(coinTotal, forKey: "CoinCounter")
            buyViewDelegate.updateHintLabelWithPurchase()
            self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    //if hints are bought with real money, hint and coin totals are updated
    @IBAction func buyWithMoneyAction(_ sender: UIButton) {
        if sender.tag == 139 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Picma.get5hints") {
                    p = product
                    buyProduct()
                }
            }
            hintTotal += 5
        } else if sender.tag == 279 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Picma.get12hints") {
                    p = product
                    buyProduct()
                }
            }
            hintTotal += 12
        } else if sender.tag == 399 {
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "com.blueoakapps.Picma.get25hints") {
                    p = product
                    buyProduct()
                }
            }
            hintTotal += 25
        }
    }
    
    func buyProduct() {
        let pay = SKPayment(product: p)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(pay as SKPayment)
    }
    
    func buyHintsWithMoney() {
        UserDefaults.standard.set(hintTotal, forKey: "HintCounter")
        buyViewDelegate.updateHintLabelWithPurchase()
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
                if product.productIdentifier == "com.blueoakapps.Picma.get5hints" {
                    hintCoinsOutlet[3].setTitle("5 Hints\n\(product.price) \(currencySymbol)", for: .normal)
                } else if product.productIdentifier == "com.blueoakapps.Picma.get12hints" {
                    hintCoinsOutlet[4].setTitle("12 Hints\n\(product.price) \(currencySymbol)", for: .normal)
                } else if product.productIdentifier == "com.blueoakapps.Picma.get25hints" {
                    hintCoinsOutlet[5].setTitle("25 Hints\n\(product.price) \(currencySymbol)", for: .normal)
                }
            } else {
                if product.productIdentifier == "com.blueoakapps.Picma.get5hints" {
                    hintCoinsOutlet[3].setTitle("5 Hints\n\(currencySymbol)\(product.price)", for: .normal)
                } else if product.productIdentifier == "com.blueoakapps.Picma.get12hints" {
                    hintCoinsOutlet[4].setTitle("12 Hints\n\(currencySymbol)\(product.price)", for: .normal)
                } else if product.productIdentifier == "com.blueoakapps.Picma.get25hints" {
                    hintCoinsOutlet[5].setTitle("25 Hints\n\(currencySymbol)\(product.price)", for: .normal)
                }
            }
        }
        for button in 3...5 {
            hintCoinsOutlet[button].isEnabled = true
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction: AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
            switch trans.transactionState {
            case .purchased:
                buyHintsWithMoney()
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

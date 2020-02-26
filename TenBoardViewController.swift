//
//  TenBoardViewController.swift
//  Picma
//
//  Created by Andrew Shepherd on 2018-05-24.
//  Copyright © 2018 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation

class TenBoardViewController: UIViewController {
   
    //variables, constants and outlets
    var paintChoice : UIColor = .white
    let paintColorArray : [UIColor] = [.white, rd, .orange, .yellow, gn, .black, .gray, .brown, .purple, .blue]
    var hintSetting = false
    var eraseSetting = false
    var hintTotal = UserDefaults.standard.integer(forKey: "HintCounter")
    var coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
    var gamesWonTotal = UserDefaults.standard.integer(forKey: "GamesWonCounter")
    var hintsUsedTotal = UserDefaults.standard.integer(forKey: "HintsUsedCounter")
    let puzzleNum = UserDefaults.standard.integer(forKey: "PuzzleNumber")
    let sizePuzzlePackChoosen = UserDefaults.standard.integer(forKey: "SizePackChoice")
    var puzzlesDoneArray : [Bool] = []
    var volumeChoice = UserDefaults.standard.bool(forKey: "Volume")
    var answerArray = Array<UIColor>(repeating: .white, count: 100)
    
    let horizontalLine1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let horizontalLine2 = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
    let horizontalLine3 = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29]
    let horizontalLine4 = [30, 31, 32, 33, 34, 35, 36, 37, 38, 39]
    let horizontalLine5 = [40, 41, 42, 43, 44, 45, 46, 47, 48, 49]
    let horizontalLine6 = [50, 51, 52, 53, 54, 55, 56, 57, 58, 59]
    let horizontalLine7 = [60, 61, 62, 63, 64, 65, 66, 67, 68, 69]
    let horizontalLine8 = [70, 71, 72, 73, 74, 75, 76, 77, 78, 79]
    let horizontalLine9 = [80, 81, 82, 83, 84, 85, 86, 87, 88, 89]
    let horizontalLine10 = [90, 91, 92, 93, 94, 95, 96, 97, 98, 99]

    let verticalLine1 = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]
    let verticalLine2 = [1, 11, 21, 31, 41, 51, 61, 71, 81, 91]
    let verticalLine3 = [2, 12, 22, 32, 42, 52, 62, 72, 82, 92]
    let verticalLine4 = [3, 13, 23, 33, 43, 53, 63, 73, 83, 93]
    let verticalLine5 = [4, 14, 24, 34, 44, 54, 64, 74, 84, 94]
    let verticalLine6 = [5, 15, 25, 35, 45, 55, 65, 75, 85, 95]
    let verticalLine7 = [6, 16, 26, 36, 46, 56, 66, 76, 86, 96]
    let verticalLine8 = [7, 17, 27, 37, 47, 57, 67, 77, 87, 97]
    let verticalLine9 = [8, 18, 28, 38, 48, 58, 68, 78, 88, 98]
    let verticalLine10 = [9, 19, 29, 39, 49, 59, 69, 79, 89, 99]

    var puzzleArray : [UIColor] = []
    var puzzleWhiteSquares : [Int] = []
    var puzzleLeftLabels : [String] = []
    var puzzleLeftLabelColors : [UIColor] = []
    var puzzleTopLabels : [String] = []
    var puzzleTopLabelColors: [UIColor] = []
    
    @IBOutlet weak var volumeOutlet: UIButton!
    @IBOutlet weak var puzzleNumberOutlet: UILabel!
    @IBOutlet weak var coinBackOutlet: UIView!
    @IBOutlet weak var coinLabelOutlet: UILabel!
    @IBOutlet var topLabels: [UILabel]!
    @IBOutlet var leftLabels: [UILabel]!
    @IBOutlet var squares: [UIButton]!
    @IBOutlet weak var gridLinesOutlet: UIView!
    @IBOutlet weak var gridLinesTopHalfOutlet: UIView!
    @IBOutlet weak var gridLinesLeftHalfOutlet: UIView!
    @IBOutlet var tenHorizontalStacks: [UIStackView]!
    @IBOutlet weak var tenVerticalStack: UIStackView!
    @IBOutlet var paintOutlets: [UIButton]!
    @IBOutlet weak var eraseOutlet: UIButton!
    @IBOutlet weak var resetOutlet: UIButton!
    @IBOutlet weak var useHintOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //styling paint, coin and hint buttons
        paintOutlets[0].layer.borderWidth = 3
        for color in 0...9 {
            let paintButton = paintOutlets[color]
            paintButton.layer.borderColor = UIColor.black.cgColor
            paintButton.layer.cornerRadius = 5
        }
        paintOutlets[5].layer.borderColor = UIColor.init(red: 0.38, green: 0.227, blue: 0.808, alpha: 1.0).cgColor
        useHintOutlet.layer.borderColor = UIColor.black.cgColor
        if hintTotal != 0 {
            useHintOutlet.setTitle("Hints (\(hintTotal))", for: .normal)
        } else if hintTotal == 0 {
            useHintOutlet.setTitle("Buy Hints", for: .normal)
        }
        coinLabelOutlet.text = "\(coinTotal)"
        
        //setting volume icon based on settings
        if volumeChoice == true {
            volumeOutlet.setImage(UIImage(named: "volumeIcon"), for: .normal)
        } else {
            volumeOutlet.setImage(UIImage(named: "muteIcon"), for: .normal)
        }
        
        //styling 5x5 grid line guides
        gridLinesOutlet.layer.borderColor = UIColor.lightGray.cgColor
        gridLinesOutlet.layer.borderWidth = 3
        gridLinesTopHalfOutlet.layer.borderColor = UIColor.lightGray.cgColor
        gridLinesTopHalfOutlet.layer.borderWidth = 3
        gridLinesLeftHalfOutlet.layer.borderColor = UIColor.lightGray.cgColor
        gridLinesLeftHalfOutlet.layer.borderWidth = 3
        
        //stlying hint, puzzle number and coin labels
        useHintOutlet.layer.cornerRadius = 5
        puzzleNumberOutlet.layer.masksToBounds = true
        puzzleNumberOutlet.layer.cornerRadius = 5
        coinBackOutlet.layer.cornerRadius = 5
        puzzleNumberOutlet.text = "Puzzle \(puzzleNum)"
        puzzleNumberOutlet.layer.borderWidth = 3
        puzzleNumberOutlet.layer.borderColor = UIColor.init(red: 0.38, green: 0.227, blue: 0.808, alpha: 1.0).cgColor
        coinBackOutlet.layer.borderWidth = 3
        coinBackOutlet.layer.borderColor = UIColor.init(red: 0.38, green: 0.227, blue: 0.808, alpha: 1.0).cgColor

        //assigning all specific puzzle data based on puzzle file and puzzle number choosen to be displayed in number labels / answer grid
        if sizePuzzlePackChoosen == 101 {
            puzzleArray = PuzzlesFile101().puzArray[puzzleNum - 1]
            puzzleWhiteSquares = PuzzlesFile101().puzWhiteSquares[puzzleNum - 1]
            puzzleLeftLabels = PuzzlesFile101().puzLeftLabels[puzzleNum - 1]
            puzzleLeftLabelColors = PuzzlesFile101().puzLeftLabelColors[puzzleNum - 1]
            puzzleTopLabels = PuzzlesFile101().puzTopLabels[puzzleNum - 1]
            puzzleTopLabelColors = PuzzlesFile101().puzTopLabelColors[puzzleNum - 1]
        } else if sizePuzzlePackChoosen == 102 {
            puzzleArray = PuzzlesFile102().puzArray[puzzleNum - 1]
            puzzleWhiteSquares = PuzzlesFile102().puzWhiteSquares[puzzleNum - 1]
            puzzleLeftLabels = PuzzlesFile102().puzLeftLabels[puzzleNum - 1]
            puzzleLeftLabelColors = PuzzlesFile102().puzLeftLabelColors[puzzleNum - 1]
            puzzleTopLabels = PuzzlesFile102().puzTopLabels[puzzleNum - 1]
            puzzleTopLabelColors = PuzzlesFile102().puzTopLabelColors[puzzleNum - 1]
        } else if sizePuzzlePackChoosen == 103 {
            puzzleArray = PuzzlesFile103().puzArray[puzzleNum - 1]
            puzzleWhiteSquares = PuzzlesFile103().puzWhiteSquares[puzzleNum - 1]
            puzzleLeftLabels = PuzzlesFile103().puzLeftLabels[puzzleNum - 1]
            puzzleLeftLabelColors = PuzzlesFile103().puzLeftLabelColors[puzzleNum - 1]
            puzzleTopLabels = PuzzlesFile103().puzTopLabels[puzzleNum - 1]
            puzzleTopLabelColors = PuzzlesFile103().puzTopLabelColors[puzzleNum - 1]
        }
        assignLabels()
       
        //making board appear done if puzzle has already been solved
        puzzlesDoneArray = UserDefaults.standard.array(forKey: "Pack\(sizePuzzlePackChoosen)DoneCounter") as! [Bool]
        if puzzlesDoneArray[puzzleNum - 1] == true {
            for square in 0...99 {
                squares[square].backgroundColor = puzzleArray[square]
            }
            answerArray = puzzleArray
            makeBoardDone()
        }
    }

    //actions taken when any grid square is pressed
    @IBAction func squarePressed(_ sender: UIButton) {
        
        var squareChosen : UIButton = squares[sender.tag]
        
        //if hint was choosen, hint total decreases by one and squares in row and column completed
        if hintSetting == true {
            
            playSound(playSoundFile: "hintPlayed")
            
            hintSetting = false
            hintTotal -= 1
            
            //changes hint label to buy hints when reaches zero
            if hintTotal == 0 {
                useHintOutlet.setTitle("Buy Hints", for: .normal)
                useHintOutlet.alpha = 1
            } else {
                useHintOutlet.setTitle("Hints (\(hintTotal))", for: .normal)
                useHintOutlet.alpha = 0.8
            }
            
            UserDefaults.standard.set(hintTotal, forKey: "HintCounter")
            useHintOutlet.layer.borderWidth = 0
            hintsUsedTotal += 1
            UserDefaults.standard.set(hintsUsedTotal, forKey: "HintsUsedCounter")
            
            let horizontalArray = [horizontalLine1, horizontalLine2, horizontalLine3, horizontalLine4, horizontalLine5, horizontalLine6, horizontalLine7, horizontalLine8, horizontalLine9, horizontalLine10]
            let verticalArray = [verticalLine1, verticalLine2, verticalLine3, verticalLine4, verticalLine5, verticalLine6, verticalLine7, verticalLine8, verticalLine9, verticalLine10]
            var horizontalHintLine = horizontalLine1
            var verticalHintLine = verticalLine1
            for array in 0...9 {
                if horizontalArray[array].contains(sender.tag) {
                    horizontalHintLine = horizontalArray[array]
                }
                if verticalArray[array].contains(sender.tag) {
                    verticalHintLine = verticalArray[array]
                }
            }
            let finalHintArray = horizontalHintLine + verticalHintLine
           
            for number in finalHintArray {
                paintChoice = puzzleArray[number]
                squareChosen = squares[number]
                squareChosen.backgroundColor = paintChoice
                answerArray[number] = paintChoice
                if paintChoice == .white {
                    squareChosen.setTitle("X", for: .normal)
                } else {
                    squareChosen.setTitle("", for: .normal)
                }
            }
            
            // opens win trophy VC if hint total equals trophy level
            if (hintsUsedTotal == 10 || hintsUsedTotal == 50) && puzzleArray != answerArray {
                let when = DispatchTime.now() + 0.6
                DispatchQueue.main.asyncAfter(deadline: when) {
                    self.performSegue(withIdentifier: "trophyTenSegue", sender: self)
                }
            }
            for number in 0...9 {
                if paintOutlets[number].alpha == 1 {
                    paintChoice = paintColorArray[number]
                }
            }
        // if erase setting is selected when any square is pressed, square is erased to white with no x
        } else if eraseSetting == true {
            playSound(playSoundFile: "erase")
            squareChosen.backgroundColor = .white
            squareChosen.setTitle("", for: .normal)
            answerArray[sender.tag] = .white
            
        //if any square is pressed - when hint or erase are not selected - square painted colour, white and/or x
        } else {
            playSound(playSoundFile: "buttonClick")
            
            if squareChosen.backgroundColor == .white && paintChoice == .white {
                if squareChosen.title(for: .normal) == "" {
                    squareChosen.setTitle("X", for: .normal)
                } else {
                    squareChosen.setTitle("", for: .normal)
                }
            } else if squareChosen.backgroundColor == paintChoice {
                squareChosen.backgroundColor = .white
                answerArray[sender.tag] = .white
            } else {
                squareChosen.backgroundColor = paintChoice
                answerArray[sender.tag] = paintChoice
                if paintChoice == .white {
                    squareChosen.setTitle("X", for: .normal)
                } else {
                    squareChosen.setTitle("", for: .normal)
                }
            }
        }
        youWin()
    }
    
    // function to assign labels and blank squares based on pack choosen
    func assignLabels() {
        for number in 0...69 {
            topLabels[number].text = puzzleTopLabels[number]
            topLabels[number].textColor = puzzleTopLabelColors[number]
        }
        for number in 0...89 {
            leftLabels[number].text = puzzleLeftLabels[number]
            leftLabels[number].textColor = puzzleLeftLabelColors[number]
        }
        for number in 0...99 {
            squares[number].backgroundColor = .white
            squares[number].setTitle("", for: .normal)
        }
    }
    
    //selects paint button, unselects erase or any other colour
    @IBAction func paintChoice(_ sender: UIButton) {
        playSound(playSoundFile: "buttonClick")
        if eraseSetting == true {
            eraseSetting = false
            eraseOutlet.alpha = 0.6
            eraseOutlet.setImage(UIImage(named: "eraseIcon"), for: .normal)
        }
        for color in 0...9 {
            paintOutlets[color].alpha = 0.6
            paintOutlets[color].layer.borderWidth = 0
        }
        paintChoice = paintColorArray[sender.tag]
        paintOutlets[sender.tag].alpha = 1
        paintOutlets[sender.tag].layer.borderWidth = 3
    }
    
    //goes back up a VC in stack
    @IBAction func backButtonAction(_ sender: UIButton) {
        playSound(playSoundFile: "buttonClick")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //sets volume setting and adjusts icon
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

    //erases square colour and x when selected and a square is pressed
    @IBAction func eraseAction(_ sender: UIButton) {
        playSound(playSoundFile: "buttonClick")
        eraseSetting = true
        eraseOutlet.alpha = 1
        eraseOutlet.setImage(UIImage(named: "eraseOnIcon"), for: .normal)
        for color in 0...9 {
            paintOutlets[color].alpha = 0.6
            paintOutlets[color].layer.borderWidth = 0
        }
    }
    
    //if pressed, returns whole board to white with no x
    @IBAction func resetAction(_ sender: UIButton) {
        playSound(playSoundFile: "reset")
        for square in 0...99 {
            squares[square].setTitle("", for: .normal)
            squares[square].backgroundColor = .white
            answerArray[square] = .white
        }
    }
    
    //engages hint button, or opens buy hints VC if zero hints
    @IBAction func useHintAction(_ sender: UIButton) {
        
        if hintSetting == false {
            if hintTotal != 0 {
                playSound(playSoundFile: "buttonClick")
                hintSetting = true
                useHintOutlet.layer.borderWidth = 3
                useHintOutlet.alpha = 1
            } else {
                playSound2(playSoundFile: "storeBell")
                let buyVC = storyboard?.instantiateViewController(withIdentifier: "BuyViewController") as! BuyViewController
                buyVC.buyViewDelegate = self
                present(buyVC, animated: true, completion: nil)
            }
        } else if hintSetting == true {
            playSound(playSoundFile: "buttonClick")
            hintSetting = false
            useHintOutlet.layer.borderWidth = 0
            useHintOutlet.alpha = 0.8
        }
    }
    
    //checks to see if the puzzle is completed, if yes - adjusts counters to keep track and opens win VC
    func youWin() {
        if puzzleArray == answerArray {
            
            gamesWonTotal += 1
            UserDefaults.standard.set(gamesWonTotal, forKey: "GamesWonCounter")
            puzzlesDoneArray[puzzleNum - 1] = true
            UserDefaults.standard.set(puzzlesDoneArray, forKey: "Pack\(sizePuzzlePackChoosen)DoneCounter")

            makeBoardDone()

            let when = DispatchTime.now() + 1.2
            DispatchQueue.main.asyncAfter(deadline: when) {
                let winVC = self.storyboard?.instantiateViewController(withIdentifier: "WinViewController") as! WinViewController
                winVC.winViewDelegate = self
                self.present(winVC, animated: true, completion: nil)
            }
        }
    }
    
    // once puzzle matches answer, the board buttons are fromzen and grid lines are removed, and background changes to cyan/white
    func makeBoardDone() {
        for square in 0...99 {
            squares[square].setTitle("", for: .normal)
            if answerArray[square] == .white {
                squares[square].backgroundColor = .cyan
            }
            for whiteSquare in puzzleWhiteSquares {
                squares[whiteSquare].backgroundColor = .white
            }
        }
        
        resetOutlet.isEnabled = false
        useHintOutlet.isEnabled = false
        for button in squares {
            button.isEnabled = false
        }
        
        gridLinesTopHalfOutlet.layer.borderWidth = 0
        gridLinesLeftHalfOutlet.layer.borderWidth = 0
        
        tenVerticalStack.spacing = 0
        for stack in tenHorizontalStacks {
            stack.spacing = 0
        }
    }
}

//updates coin total based on prize collected on win VC
extension TenBoardViewController: winViewDelegateProtocol {
    func updateCoinLabelWithPrize() {
        playSound(playSoundFile: "prize")
        coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
        coinLabelOutlet.text = "\(coinTotal)"
    }
}

//updates hint total based on hints purchased on buy hint VC
extension TenBoardViewController: buyViewDelegateProtocol {
    func updateHintLabelWithPurchase() {
        playSound(playSoundFile: "purchaseComplete")
        hintTotal = UserDefaults.standard.integer(forKey: "HintCounter")
        if hintTotal != 0 {
            useHintOutlet.setTitle("Hints (\(hintTotal))", for: .normal)
        } else if hintTotal == 0 {
            useHintOutlet.setTitle("Buy Hints", for: .normal)
        }
        coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
        coinLabelOutlet.text = "\(coinTotal)"
    }
}

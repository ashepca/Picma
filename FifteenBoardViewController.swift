//
//  FifteenBoardViewController.swift
//  Picma
//
//  Created by Andrew Shepherd on 2018-06-07.
//  Copyright © 2018 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation

class FifteenBoardViewController: UIViewController {
    
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
    var answerArray = Array<UIColor>(repeating: .white, count: 225)

    let horizontalLine1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    let horizontalLine2 = [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29]
    let horizontalLine3 = [30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44]
    let horizontalLine4 = [45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59]
    let horizontalLine5 = [60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74]
    let horizontalLine6 = [75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89]
    let horizontalLine7 = [90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104]
    let horizontalLine8 = [105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119]
    let horizontalLine9 = [120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134]
    let horizontalLine10 = [135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149]
    let horizontalLine11 = [150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164]
    let horizontalLine12 = [165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179]
    let horizontalLine13 = [180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194]
    let horizontalLine14 = [195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209]
    let horizontalLine15 = [210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224]
    
    let verticalLine1 = [0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180, 195, 210]
    let verticalLine2 = [1, 16, 31, 46, 61, 76, 91, 106, 121, 136, 151, 166, 181, 196, 211]
    let verticalLine3 = [2, 17, 32, 47, 62, 77, 92, 107, 122, 137, 152, 167, 182, 197, 212]
    let verticalLine4 = [3, 18, 33, 48, 63, 78, 93, 108, 123, 138, 153, 168, 183, 198, 213]
    let verticalLine5 = [4, 19, 34, 49, 64, 79, 94, 109, 124, 139, 154, 169, 184, 199, 214]
    let verticalLine6 = [5, 20, 35, 50, 65, 80, 95, 110, 125, 140, 155, 170, 185, 200, 215]
    let verticalLine7 = [6, 21, 36, 51, 66, 81, 96, 111, 126, 141, 156, 171, 186, 201, 216]
    let verticalLine8 = [7, 22, 37, 52, 67, 82, 97, 112, 127, 142, 157, 172, 187, 202, 217]
    let verticalLine9 = [8, 23, 38, 53, 68, 83, 98, 113, 128, 143, 158, 173, 188, 203, 218]
    let verticalLine10 = [9, 24, 39, 54, 69, 84, 99, 114, 129, 144, 159, 174, 189, 204, 219]
    let verticalLine11 = [10, 25, 40, 55, 70, 85, 100, 115, 130, 145, 160, 175, 190, 205, 220]
    let verticalLine12 = [11, 26, 41, 56, 71, 86, 101, 116, 131, 146, 161, 176, 191, 206, 221]
    let verticalLine13 = [12, 27, 42, 57, 72, 87, 102, 117, 132, 147, 162, 177, 192, 207, 222]
    let verticalLine14 = [13, 28, 43, 58, 73, 88, 103, 118, 133, 148, 163, 178, 193, 208, 223]
    let verticalLine15 = [14, 29, 44, 59, 74, 89, 104, 119, 134, 149, 164, 179, 194, 209, 224]
    
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
    @IBOutlet weak var gridLinesMiddleHorizontalOutlet: UIView!
    @IBOutlet weak var gridLinesMiddleVerticalOutlet: UIView!
    @IBOutlet var fifteenHorizontalStacks: [UIStackView]!
    @IBOutlet weak var fifteenVerticalStack: UIStackView!
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
        gridLinesMiddleHorizontalOutlet.layer.borderColor = UIColor.lightGray.cgColor
        gridLinesMiddleHorizontalOutlet.layer.borderWidth = 3
        gridLinesMiddleVerticalOutlet.layer.borderColor = UIColor.lightGray.cgColor
        gridLinesMiddleVerticalOutlet.layer.borderWidth = 3

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
        if sizePuzzlePackChoosen == 151 {
            puzzleArray = PuzzlesFile151().puzArray[puzzleNum - 1]
            puzzleWhiteSquares = PuzzlesFile151().puzWhiteSquares[puzzleNum - 1]
            puzzleLeftLabels = PuzzlesFile151().puzLeftLabels[puzzleNum - 1]
            puzzleLeftLabelColors = PuzzlesFile151().puzLeftLabelColors[puzzleNum - 1]
            puzzleTopLabels = PuzzlesFile151().puzTopLabels[puzzleNum - 1]
            puzzleTopLabelColors = PuzzlesFile151().puzTopLabelColors[puzzleNum - 1]
        } else if sizePuzzlePackChoosen == 152 {
            puzzleArray = PuzzlesFile152().puzArray[puzzleNum - 1]
            puzzleWhiteSquares = PuzzlesFile152().puzWhiteSquares[puzzleNum - 1]
            puzzleLeftLabels = PuzzlesFile152().puzLeftLabels[puzzleNum - 1]
            puzzleLeftLabelColors = PuzzlesFile152().puzLeftLabelColors[puzzleNum - 1]
            puzzleTopLabels = PuzzlesFile152().puzTopLabels[puzzleNum - 1]
            puzzleTopLabelColors = PuzzlesFile152().puzTopLabelColors[puzzleNum - 1]
        } else if sizePuzzlePackChoosen == 153 {
            puzzleArray = PuzzlesFile153().puzArray[puzzleNum - 1]
            puzzleWhiteSquares = PuzzlesFile153().puzWhiteSquares[puzzleNum - 1]
            puzzleLeftLabels = PuzzlesFile153().puzLeftLabels[puzzleNum - 1]
            puzzleLeftLabelColors = PuzzlesFile153().puzLeftLabelColors[puzzleNum - 1]
            puzzleTopLabels = PuzzlesFile153().puzTopLabels[puzzleNum - 1]
            puzzleTopLabelColors = PuzzlesFile153().puzTopLabelColors[puzzleNum - 1]
        }
        assignLabels()
        
        //making board appear done if puzzle has already been solved
        puzzlesDoneArray = UserDefaults.standard.array(forKey: "Pack\(sizePuzzlePackChoosen)DoneCounter") as! [Bool]
        if puzzlesDoneArray[puzzleNum - 1] == true {
            for square in 0...224 {
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
            
            let horizontalArray = [horizontalLine1, horizontalLine2, horizontalLine3, horizontalLine4, horizontalLine5, horizontalLine6, horizontalLine7, horizontalLine8, horizontalLine9, horizontalLine10, horizontalLine11, horizontalLine12, horizontalLine13, horizontalLine14, horizontalLine15]
            let verticalArray = [verticalLine1, verticalLine2, verticalLine3, verticalLine4, verticalLine5, verticalLine6, verticalLine7, verticalLine8, verticalLine9, verticalLine10, verticalLine11, verticalLine12, verticalLine13, verticalLine14, verticalLine15]
            var horizontalHintLine = horizontalLine1
            var verticalHintLine = verticalLine1
            for array in 0...14 {
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
                    self.performSegue(withIdentifier: "trophyFifteenSegue", sender: self)
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
        for number in 0...104 {
            topLabels[number].text = puzzleTopLabels[number]
            topLabels[number].textColor = puzzleTopLabelColors[number]
        }
        for number in 0...134 {
            leftLabels[number].text = puzzleLeftLabels[number]
            leftLabels[number].textColor = puzzleLeftLabelColors[number]
        }
        for number in 0...224 {
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
        for square in 0...224 {
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
        for square in 0...224 {
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
        
        gridLinesMiddleHorizontalOutlet.layer.borderWidth = 0
        gridLinesMiddleVerticalOutlet.layer.borderWidth = 0
        
        fifteenVerticalStack.spacing = 0
        for stack in fifteenHorizontalStacks {
            stack.spacing = 0
        }
    }
}

//updates coin total based on prize collected on win VC
extension FifteenBoardViewController: winViewDelegateProtocol {
    func updateCoinLabelWithPrize() {
        playSound(playSoundFile: "prize")
        coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
        coinLabelOutlet.text = "\(coinTotal)"
    }
}

//updates hint total based on hints purchased on buy hint VC
extension FifteenBoardViewController: buyViewDelegateProtocol {
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

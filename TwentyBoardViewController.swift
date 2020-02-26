//
//  TwentyBoardViewController.swift
//  Picma
//
//  Created by Andrew Shepherd on 2018-05-25.
//  Copyright © 2018 Blue Oak Apps. All rights reserved.
//

import UIKit
import AVFoundation

class TwentyBoardViewController: UIViewController {

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
    var answerArray = Array<UIColor>(repeating: .white, count: 400)
    
    let horizontalLine1 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
    let horizontalLine2 = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39]
    let horizontalLine3 = [40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59]
    let horizontalLine4 = [60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79]
    let horizontalLine5 = [80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]
    let horizontalLine6 = [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119]
    let horizontalLine7 = [120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139]
    let horizontalLine8 = [140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159]
    let horizontalLine9 = [160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179]
    let horizontalLine10 = [180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199]
    let horizontalLine11 = [200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219]
    let horizontalLine12 = [220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239]
    let horizontalLine13 = [240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259]
    let horizontalLine14 = [260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279]
    let horizontalLine15 = [280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299]
    let horizontalLine16 = [300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319]
    let horizontalLine17 = [320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339]
    let horizontalLine18 = [340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359]
    let horizontalLine19 = [360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379]
    let horizontalLine20 = [380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399]
    
    let verticalLine1 = [0, 20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 220, 240, 260, 280, 300, 320, 340, 360, 380]
    let verticalLine2 = [1, 21, 41, 61, 81, 101, 121, 141, 161, 181, 201, 221, 241, 261, 281, 301, 321, 341, 361, 381]
    let verticalLine3 = [2, 22, 42, 62, 82, 102, 122, 142, 162, 182, 202, 222, 242, 262, 282, 302, 322, 342, 362, 382]
    let verticalLine4 = [3, 23, 43, 63, 83, 103, 123, 143, 163, 183, 203, 223, 243, 263, 283, 303, 323, 343, 363, 383]
    let verticalLine5 = [4, 24, 44, 64, 84, 104, 124, 144, 164, 184, 204, 224, 244, 264, 284, 304, 324, 344, 364, 384]
    let verticalLine6 = [5, 25, 45, 65, 85, 105, 125, 145, 165, 185, 205, 225, 245, 265, 285, 305, 325, 345, 365, 385]
    let verticalLine7 = [6, 26, 46, 66, 86, 106, 126, 146, 166, 186, 206, 226, 246, 266, 286, 306, 326, 346, 366, 386]
    let verticalLine8 = [7, 27, 47, 67, 87, 107, 127, 147, 167, 187, 207, 227, 247, 267, 287, 307, 327, 347, 367, 387]
    let verticalLine9 = [8, 28, 48, 68, 88, 108, 128, 148, 168, 188, 208, 228, 248, 268, 288, 308, 328, 348, 368, 388]
    let verticalLine10 = [9, 29, 49, 69, 89, 109, 129, 149, 169, 189, 209, 229, 249, 269, 289, 309, 329, 349, 369, 389]
    let verticalLine11 = [10, 30, 50, 70, 90, 110, 130, 150, 170, 190, 210, 230, 250, 270, 290, 310, 330, 350, 370, 390]
    let verticalLine12 = [11, 31, 51, 71, 91, 111, 131, 151, 171, 191, 211, 231, 251, 271, 291, 311, 331, 351, 371, 391]
    let verticalLine13 = [12, 32, 52, 72, 92, 112, 132, 152, 172, 192, 212, 232, 252, 272, 292, 312, 332, 352, 372, 392]
    let verticalLine14 = [13, 33, 53, 73, 93, 113, 133, 153, 173, 193, 213, 233, 253, 273, 293, 313, 333, 353, 373, 393]
    let verticalLine15 = [14, 34, 54, 74, 94, 114, 134, 154, 174, 194, 214, 234, 254, 274, 294, 314, 334, 354, 374, 394]
    let verticalLine16 = [15, 35, 55, 75, 95, 115, 135, 155, 175, 195, 215, 235, 255, 275, 295, 315, 335, 355, 375, 395]
    let verticalLine17 = [16, 36, 56, 76, 96, 116, 136, 156, 176, 196, 216, 236, 256, 276, 296, 316, 336, 356, 376, 396]
    let verticalLine18 = [17, 37, 57, 77, 97, 117, 137, 157, 177, 197, 217, 237, 257, 277, 297, 317, 337, 357, 377, 397]
    let verticalLine19 = [18, 38, 58, 78, 98, 118, 138, 158, 178, 198, 218, 238, 258, 278, 298, 318, 338, 358, 378, 398]
    let verticalLine20 = [19, 39, 59, 79, 99, 119, 139, 159, 179, 199, 219, 239, 259, 279, 299, 319, 339, 359, 379, 399]
    
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
    @IBOutlet weak var gridLinesTopHorizontalOutlet: UIView!
    @IBOutlet weak var gridLinesBottomHorizontalOutlet: UIView!
    @IBOutlet weak var gridLinesLeftVerticalOutlet: UIView!
    @IBOutlet weak var gridLinesRightVerticalOutlet: UIView!
    @IBOutlet var twentyHorizontalStacks: [UIStackView]!
    @IBOutlet weak var twentyVerticalStack: UIStackView!
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
        gridLinesTopHorizontalOutlet.layer.borderColor = UIColor.lightGray.cgColor
        gridLinesTopHorizontalOutlet.layer.borderWidth = 3
        gridLinesBottomHorizontalOutlet.layer.borderColor = UIColor.lightGray.cgColor
        gridLinesBottomHorizontalOutlet.layer.borderWidth = 3
        gridLinesLeftVerticalOutlet.layer.borderColor = UIColor.lightGray.cgColor
        gridLinesLeftVerticalOutlet.layer.borderWidth = 3
        gridLinesRightVerticalOutlet.layer.borderColor = UIColor.lightGray.cgColor
        gridLinesRightVerticalOutlet.layer.borderWidth = 3
 
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
        if sizePuzzlePackChoosen == 201 {
            puzzleArray = PuzzlesFile201().puzArray[puzzleNum - 1]
            puzzleWhiteSquares = PuzzlesFile201().puzWhiteSquares[puzzleNum - 1]
            puzzleLeftLabels = PuzzlesFile201().puzLeftLabels[puzzleNum - 1]
            puzzleLeftLabelColors = PuzzlesFile201().puzLeftLabelColors[puzzleNum - 1]
            puzzleTopLabels = PuzzlesFile201().puzTopLabels[puzzleNum - 1]
            puzzleTopLabelColors = PuzzlesFile201().puzTopLabelColors[puzzleNum - 1]
        } else if sizePuzzlePackChoosen == 202 {
            puzzleArray = PuzzlesFile202().puzArray[puzzleNum - 1]
            puzzleWhiteSquares = PuzzlesFile202().puzWhiteSquares[puzzleNum - 1]
            puzzleLeftLabels = PuzzlesFile202().puzLeftLabels[puzzleNum - 1]
            puzzleLeftLabelColors = PuzzlesFile202().puzLeftLabelColors[puzzleNum - 1]
            puzzleTopLabels = PuzzlesFile202().puzTopLabels[puzzleNum - 1]
            puzzleTopLabelColors = PuzzlesFile202().puzTopLabelColors[puzzleNum - 1]
        } else if sizePuzzlePackChoosen == 203 {
            puzzleArray = PuzzlesFile203().puzArray[puzzleNum - 1]
            puzzleWhiteSquares = PuzzlesFile203().puzWhiteSquares[puzzleNum - 1]
            puzzleLeftLabels = PuzzlesFile203().puzLeftLabels[puzzleNum - 1]
            puzzleLeftLabelColors = PuzzlesFile203().puzLeftLabelColors[puzzleNum - 1]
            puzzleTopLabels = PuzzlesFile203().puzTopLabels[puzzleNum - 1]
            puzzleTopLabelColors = PuzzlesFile203().puzTopLabelColors[puzzleNum - 1]
        }
        assignLabels()
        
        //making board appear done if puzzle has already been solved
        puzzlesDoneArray = UserDefaults.standard.array(forKey: "Pack\(sizePuzzlePackChoosen)DoneCounter") as! [Bool]
        if puzzlesDoneArray[puzzleNum - 1] == true {
            for square in 0...399 {
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
            
            let horizontalArray = [horizontalLine1, horizontalLine2, horizontalLine3, horizontalLine4, horizontalLine5, horizontalLine6, horizontalLine7, horizontalLine8, horizontalLine9, horizontalLine10, horizontalLine11, horizontalLine12, horizontalLine13, horizontalLine14, horizontalLine15, horizontalLine16, horizontalLine17, horizontalLine18, horizontalLine19, horizontalLine20]
            let verticalArray = [verticalLine1, verticalLine2, verticalLine3, verticalLine4, verticalLine5, verticalLine6, verticalLine7, verticalLine8, verticalLine9, verticalLine10, verticalLine11, verticalLine12, verticalLine13, verticalLine14, verticalLine15, verticalLine16, verticalLine17, verticalLine18, verticalLine19, verticalLine20]
            var horizontalHintLine = horizontalLine1
            var verticalHintLine = verticalLine1
            for array in 0...19 {
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
                    self.performSegue(withIdentifier: "trophyTwentySegue", sender: self)
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
        for number in 0...139 {
            topLabels[number].text = puzzleTopLabels[number]
            topLabels[number].textColor = puzzleTopLabelColors[number]
        }
        for number in 0...179 {
            leftLabels[number].text = puzzleLeftLabels[number]
            leftLabels[number].textColor = puzzleLeftLabelColors[number]
        }
        for number in 0...399 {
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
        for square in 0...399 {
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
        for square in 0...399 {
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
        
        gridLinesTopHorizontalOutlet.layer.borderWidth = 0
        gridLinesBottomHorizontalOutlet.layer.borderWidth = 0
        gridLinesLeftVerticalOutlet.layer.borderWidth = 0
        gridLinesRightVerticalOutlet.layer.borderWidth = 0
        
        twentyVerticalStack.spacing = 0
        for stack in twentyHorizontalStacks {
            stack.spacing = 0
        }
    }
}

//updates coin total based on prize collected on win VC
extension TwentyBoardViewController: winViewDelegateProtocol {
    func updateCoinLabelWithPrize() {
        playSound(playSoundFile: "prize")
        coinTotal = UserDefaults.standard.integer(forKey: "CoinCounter")
        coinLabelOutlet.text = "\(coinTotal)"
    }
}

//updates hint total based on hints purchased on buy hint VC
extension TwentyBoardViewController: buyViewDelegateProtocol {
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

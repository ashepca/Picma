//
//  PuzzlesFile101.swift
//  Picma
//
//  Created by Andrew Shepherd on 2018-06-13.
//  Copyright © 2018 Blue Oak Apps. All rights reserved.
//

import Foundation
import UIKit

class PuzzlesFile101 {
 
    let puzArray : [[UIColor]] = [
        //Puzzle 1 - Fire Fighter
        [we, we, we, rd, rd, rd, we, we, be, be, we, we, rd, rd, rd, rd, rd, we, be, we, we, we, we, bn, bn, bn, we, we, yw, we, we, we, we, bn, bn, bn, we, we, gy, we, bn, rd, rd, rd, rd, rd, rd, rd, bn, we, we, we, rd, rd, rd, rd, rd, we, gy, we, we, we, bk, bk, yw, bk, bk, we, gy, gy, we, we, rd, rd, rd, rd, rd, we, we, gy, we, we, rd, rd, we, rd, rd, we, we, gy, we, bk, bk, bk, we, bk, bk, bk, we, gy],
        //Puzzle 2 - Castle Entrance
        [we, we, we, we, we, we, we, we, we, we, we, gy, gy, we, gy, gy, we, gy, gy, we, we, gy, gy, gy, gy, gy, gy, gy, gy, we, we, we, gy, gy, gy, gy, gy, gy, we, we, we, we, gy, gy, gy, gy, gy, gy, we, we, we, we, gy, gy, bk, bk, gy, gy, we, we, we, we, gy, gy, bk, bk, gy, gy, we, we, we, we, gy, gy, bk, bk, gy, gy, we, we, be, be, be, be, bn, bn, be, be, be, be, be, be, be, be, bn, bn, be, be, be, be],
        //Puzzle 3 - Referee Touchdown
        [we, we, we, bk, bk, bk, we, we, we, we, we, we, we, bk, bk, bk, bk, we, we, we, yw, we, we, yw, yw, yw, we, we, yw, we, bk, we, we, yw, yw, yw, we, we, bk, we, bk, bk, bk, we, bk, we, bk, bk, bk, we, we, we, bk, we, bk, we, bk, we, we, we, we, we, bk, we, bk, we, bk, we, we, we, we, we, gy, gy, gy, gy, gy, we, we, we, we, we, gy, gy, we, gy, gy, we, we, we, we, bn, bn, bn, we, bn, bn, bn, we, we],
        //Puzzle 4 - Polar Bear Up Close Face
        [we, we, we, we, we, we, we, we, we, we, we, bk, bk, we, we, we, we, we, bk, bk, we, bk, bk, we, we, we, we, we, bk, bk, we, we, we, we, we, we, we, we, we, we, we, we, we, we, bk, bk, bk, we, we, we, we, we, we, we, bk, bk, bk, we, we, we, we, we, we, we, we, bk, we, we, we, we, we, we, bk, we, we, bk, we, we, bk, we, gy, we, we, bk, bk, bk, bk, bk, we, we, gy, gy, we, we, we, we, we, we, we, gy],
        //Puzzle 5 - Mailbox
        [we, we, we, we, we, we, we, we, we, we, we, we, we, we, rd, rd, we, we, we, we, we, we, we, we, rd, we, we, we, we, we, we, we, we, gy, rd, gy, gy, gy, gy, we, we, we, we, gy, rd, gy, gy, gy, gy, we, we, we, we, gy, gy, gy, gy, gy, gy, we, gy, gy, gy, gy, gy, gy, gy, gy, gy, we, we, we, we, we, we, bn, bn, we, we, we, we, we, we, we, we, bn, bn, we, we, we, we, we, we, we, we, bn, bn, we, we, we],
        //Puzzle 6 - Beer
        [we, we, we, we, we, we, we, we, we, we, we, gy, we, we, we, we, gy, we, we, we, we, gy, we, we, we, we, gy, gy, gy, we, we, gy, yw, yw, yw, yw, gy, we, gy, we, we, gy, yw, yw, yw, yw, gy, we, gy, we, we, gy, yw, yw, yw, yw, gy, we, gy, we, we, gy, yw, yw, yw, yw, gy, we, gy, we, we, gy, yw, yw, yw, yw, gy, gy, gy, we, we, gy, gy, gy, gy, gy, gy, we, we, we, we, we, we, we, we, we, we, we, we, we],
        //Puzzle 7 - Maze
        [bk, bk, bk, bk, bk, bk, bk, bk, bk, bk, gn, we, we, we, we, we, we, we, we, bk, bk, bk, bk, we, bk, bk, bk, bk, we, bk, bk, we, we, we, bk, we, we, we, we, bk, bk, we, bk, bk, bk, bk, bk, we, bk, bk, bk, we, bk, we, we, we, bk, bk, we, bk, bk, we, we, we, bk, we, we, we, we, bk, bk, we, bk, bk, bk, bk, we, bk, bk, bk, bk, we, we, we, we, bk, we, we, we, bk, bk, bk, bk, bk, bk, bk, bk, bk, rd, bk],
        //Puzzle 8 - Fireplace
        [we, we, we, rd, rd, rd, rd, we, we, we, we, we, we, rd, rd, rd, rd, we, we, we, we, gy, gy, rd, rd, rd, rd, gy, gy, we, we, rd, rd, rd, rd, rd, rd, rd, rd, we, we, rd, rd, bk, bk, bk, bk, rd, rd, we, we, rd, bk, bk, oe, bk, oe, bk, rd, we, we, rd, bk, oe, oe, oe, oe, bk, rd, we, we, rd, bk, bk, oe, oe, bk, bk, rd, we, we, rd, bk, bn, bn, bn, bn, bk, rd, we, gy, gy, gy, gy, gy, gy, gy, gy, gy, gy],
        //Puzzle 9 - Medal
        [we, we, rd, be, rd, rd, be, rd, we, we, we, we, rd, be, rd, rd, be, rd, we, we, we, we, rd, be, rd, rd, be, rd, we, we, we, we, rd, be, rd, rd, be, rd, we, we, we, we, we, be, rd, rd, be, we, we, we, we, we, we, we, rd, rd, we, we, we, we, we, we, we, we, yw, yw, we, we, we, we, we, we, we, yw, yw, yw, yw, we, we, we, we, we, we, yw, yw, yw, yw, we, we, we, we, we, we, we, yw, yw, we, we, we, we],
        //Puzzle 10 - Birthday Cake Slice
        [we, we, we, we, we, we, we, we, we, we, we, we, oe, we, oe, we, oe, we, we, we, we, we, rd, we, rd, we, rd, we, we, we, we, we, rd, we, rd, we, rd, we, we, we, we, bn, bn, bn, bn, bn, bn, bn, bn, we, we, yw, yw, yw, yw, yw, yw, yw, bn, we, we, yw, yw, yw, yw, yw, yw, yw, bn, we, we, bn, bn, bn, bn, bn, bn, bn, bn, we, we, yw, yw, yw, yw, yw, yw, yw, bn, we, we, yw, yw, yw, yw, yw, yw, yw, bn, we],
        //Puzzle 11 - Christmas Tree
        [we, we, we, we, gn, gn, we, we, we, we, we, we, we, we, gn, rd, we, we, we, we, we, we, we, gn, gn, gn, gn, we, we, we, we, we, we, gn, rd, gn, gn, we, we, we, we, we, gn, gn, gn, gn, rd, gn, we, we, we, we, rd, gn, gn, gn, gn, gn, we, we, we, gn, gn, gn, gn, rd, gn, gn, gn, we, we, gn, gn, rd, gn, gn, gn, rd, gn, we, we, we, we, we, bn, bn, we, we, we, we, we, we, we, we, bn, bn, we, we, we, we],
        //Puzzle 12 - Sign "HI"
        [we, we, we, we, we, we, we, we, we, we, we, gy, we, we, we, we, we, we, we, we, bn, bn, bn, bn, bn, bn, bn, bn, bn, bn, we, gy, we, yw, yw, yw, yw, yw, yw, yw, we, gy, we, yw, pe, yw, pe, yw, pe, yw, we, gy, we, yw, pe, pe, pe, yw, pe, yw, we, gy, we, yw, pe, yw, pe, yw, pe, yw, we, gy, we, yw, yw, yw, yw, yw, yw, yw, we, gy, we, we, we, we, we, we, we, we, we, gy, we, we, we, we, we, we, we, we]]
    
    let puzWhiteSquares : [[Int]] = [
        //Puzzle 1
        [],
        //Puzzle 2
        [],
        //Puzzle 3
        [43, 45, 53, 55, 63, 65],
        //Puzzle 4
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 13, 14, 15, 16, 17, 20, 23, 24, 25, 26, 27, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 47, 48, 49, 50, 51, 52, 53, 57, 58, 59, 60, 61, 62, 63, 64, 66, 67, 68, 69, 70, 71, 73, 74, 76, 77, 79, 81, 82, 88, 89, 92, 93, 94, 95, 96, 97, 98],
        //Puzzle 5
        [],
        //Puzzle 6
        [12, 13, 14, 15, 22, 23, 24, 25],
        //Puzzle 7
        [14, 15, 16, 17, 18, 28, 35, 36, 37, 38, 47, 58, 67, 68, 71, 81, 82, 83, 84],
        //Puzzle 8
        [],
        //Puzzle 9
        [],
        //Puzzle 10
        [],
        //Puzzle 11
        [],
        //Puzzle 12
        []]
    
    let puzLeftLabels : [[String]] = [
        //Puzzle 1
        ["0", "0", "0", "0", "0", "0", "0", "3", "2", "0", "0", "0", "0", "0", "0", "0", "5", "1", "0", "0", "0", "0", "0", "0", "0", "3", "1", "0", "0", "0", "0", "0", "0", "0", "3", "1", "0", "0", "0", "0", "0", "0", "1", "7", "1", "0", "0", "0", "0", "0", "0", "0", "5", "1", "0", "0", "0", "0", "0", "2", "1", "2", "2", "0", "0", "0", "0", "0", "0", "0", "5", "1", "0", "0", "0", "0", "0", "0", "2", "2", "1", "0", "0", "0", "0", "0", "0", "3", "3", "1"],
        //Puzzle 2
        ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "2", "2", "2", "0", "0", "0", "0", "0", "0", "0", "0", "8", "0", "0", "0", "0", "0", "0", "0", "0", "6", "0", "0", "0", "0", "0", "0", "0", "0", "6", "0", "0", "0", "0", "0", "0", "2", "2", "2", "0", "0", "0", "0", "0", "0", "2", "2", "2", "0", "0", "0", "0", "0", "0", "2", "2", "2", "0", "0", "0", "0", "0", "0", "4", "2", "4", "0", "0", "0", "0", "0", "0", "4", "2", "4"],
        //Puzzle 3
        ["0", "0", "0", "0", "0", "0", "0", "0", "3", "0", "0", "0", "0", "0", "0", "0", "0", "4", "0", "0", "0", "0", "0", "0", "1", "3", "1", "0", "0", "0", "0", "0", "0", "1", "3", "1", "0", "0", "0", "0", "0", "0", "3", "1", "3", "0", "0", "0", "0", "0", "0", "1", "1", "1", "0", "0", "0", "0", "0", "0", "1", "1", "1", "0", "0", "0", "0", "0", "0", "0", "0", "5", "0", "0", "0", "0", "0", "0", "0", "2", "2", "0", "0", "0", "0", "0", "0", "0", "3", "3"],
        //Puzzle 4
        ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "2", "2", "0", "0", "0", "0", "0", "0", "0", "2", "2", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "3", "0", "0", "0", "0", "0", "0", "0", "0", "3", "0", "0", "0", "0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "0", "0", "1", "1", "1", "0", "0", "0", "0", "0", "0", "0", "1", "5", "0", "0", "0", "0", "0", "0", "0", "2", "1"],
        //Puzzle 5
        ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "2", "0", "0", "0", "0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "0", "0", "1", "1", "4", "0", "0", "0", "0", "0", "0", "1", "1", "4", "0", "0", "0", "0", "0", "0", "0", "0", "6", "0", "0", "0", "0", "0", "0", "0", "0", "9", "0", "0", "0", "0", "0", "0", "0", "0", "2", "0", "0", "0", "0", "0", "0", "0", "0", "2", "0", "0", "0", "0", "0", "0", "0", "0", "2"],
        //Puzzle 6
        ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1", "1", "0", "0", "0", "0", "0", "0", "0", "1", "3", "0", "0", "0", "0", "0", "1", "4", "1", "1", "0", "0", "0", "0", "0", "1", "4", "1", "1", "0", "0", "0", "0", "0", "1", "4", "1", "1", "0", "0", "0", "0", "0", "1", "4", "1", "1", "0", "0", "0", "0", "0", "0", "1", "4", "3", "0", "0", "0", "0", "0", "0", "0", "0", "6", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
        //Puzzle 7
        ["0", "0", "0", "0", "0", "0", "0", "0", "10", "0", "0", "0", "0", "0", "0", "0", "1", "1", "0", "0", "0", "0", "0", "0", "3", "4", "1", "0", "0", "0", "0", "0", "0", "1", "1", "1", "0", "0", "0", "0", "0", "0", "1", "5", "2", "0", "0", "0", "0", "0", "1", "1", "2", "1", "0", "0", "0", "0", "0", "0", "1", "1", "1", "0", "0", "0", "0", "0", "0", "1", "4", "3", "0", "0", "0", "0", "0", "0", "1", "1", "1", "0", "0", "0", "0", "0", "0", "8", "1", "1"],
        //Puzzle 8
        ["0", "0", "0", "0", "0", "0", "0", "0", "4", "0", "0", "0", "0", "0", "0", "0", "0", "4", "0", "0", "0", "0", "0", "0", "2", "4", "2", "0", "0", "0", "0", "0", "0", "0", "0", "8", "0", "0", "0", "0", "0", "0", "2", "4", "2", "0", "0", "1", "2", "1", "1", "1", "1", "1", "0", "0", "0", "0", "1", "1", "4", "1", "1", "0", "0", "0", "0", "1", "2", "2", "2", "1", "0", "0", "0", "0", "1", "1", "4", "1", "1", "0", "0", "0", "0", "0", "0", "0", "0", "10"],
        //Puzzle 9
        ["0", "0", "0", "0", "1", "1", "2", "1", "1", "0", "0", "0", "0", "1", "1", "2", "1", "1", "0", "0", "0", "0", "1", "1", "2", "1", "1", "0", "0", "0", "0", "1", "1", "2", "1", "1", "0", "0", "0", "0", "0", "0", "1", "2", "1", "0", "0", "0", "0", "0", "0", "0", "0", "2", "0", "0", "0", "0", "0", "0", "0", "0", "2", "0", "0", "0", "0", "0", "0", "0", "0", "4", "0", "0", "0", "0", "0", "0", "0", "0", "4", "0", "0", "0", "0", "0", "0", "0", "0", "2"],
        //Puzzle 10
        ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1", "1", "1", "0", "0", "0", "0", "0", "0", "1", "1", "1", "0", "0", "0", "0", "0", "0", "1", "1", "1", "0", "0", "0", "0", "0", "0", "0", "0", "8", "0", "0", "0", "0", "0", "0", "0", "7", "1", "0", "0", "0", "0", "0", "0", "0", "7", "1", "0", "0", "0", "0", "0", "0", "0", "0", "8", "0", "0", "0", "0", "0", "0", "0", "7", "1", "0", "0", "0", "0", "0", "0", "0", "7", "1"],
        //Puzzle 11
        ["0", "0", "0", "0", "0", "0", "0", "0", "2", "0", "0", "0", "0", "0", "0", "0", "1", "1", "0", "0", "0", "0", "0", "0", "0", "0", "4", "0", "0", "0", "0", "0", "0", "1", "1", "2", "0", "0", "0", "0", "0", "0", "4", "1", "1", "0", "0", "0", "0", "0", "0", "0", "1", "5", "0", "0", "0", "0", "0", "0", "4", "1", "3", "0", "0", "0", "0", "2", "1", "3", "1", "1", "0", "0", "0", "0", "0", "0", "0", "0", "2", "0", "0", "0", "0", "0", "0", "0", "0", "2"],
        //Puzzle 12
        ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "0", "0", "0", "0", "10", "0", "0", "0", "0", "0", "0", "0", "1", "7", "0", "1", "1", "1", "1", "1", "1", "1", "1", "0", "0", "0", "1", "1", "3", "1", "1", "1", "0", "1", "1", "1", "1", "1", "1", "1", "1", "0", "0", "0", "0", "0", "0", "0", "1", "7", "0", "0", "0", "0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "0", "0", "0", "0", "1"]]
    
    let puzLeftLabelColors : [[UIColor]] = [
        //Puzzle 1
        [cr, cr, cr, cr, cr, cr, cr, rd, be, cr, cr, cr, cr, cr, cr, cr, rd, be, cr, cr, cr, cr, cr, cr, cr, bn, yw, cr, cr, cr, cr, cr, cr, cr, bn, gy, cr, cr, cr, cr, cr, cr, bn, rd, bn, cr, cr, cr, cr, cr, cr, cr, rd, gy, cr, cr, cr, cr, cr, bk, yw, bk, gy, cr, cr, cr, cr, cr, cr, cr, rd, gy, cr, cr, cr, cr, cr, cr, rd, rd, gy, cr, cr, cr, cr, cr, cr, bk, bk, gy],
        //Puzzle 2
        [cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, gy, gy, gy, cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, gy, bk, gy, cr, cr, cr, cr, cr, cr, gy, bk, gy, cr, cr, cr, cr, cr, cr, gy, bk, gy, cr, cr, cr, cr, cr, cr, be, bn, be, cr, cr, cr, cr, cr, cr, be, bn, be],
        //Puzzle 3
        [cr, cr, cr, cr, cr, cr, cr, cr, bk, cr, cr, cr, cr, cr, cr, cr, cr, bk, cr, cr, cr, cr, cr, cr, yw, yw, yw, cr, cr, cr, cr, cr, cr, bk, yw, bk, cr, cr, cr, cr, cr, cr, bk, bk, bk, cr, cr, cr, cr, cr, cr, bk, bk, bk, cr, cr, cr, cr, cr, cr, bk, bk, bk, cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, cr, gy, gy, cr, cr, cr, cr, cr, cr, cr, bn, bn],
        //Puzzle 4
        [cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, cr, bk, bk, cr, cr, cr, cr, cr, cr, cr, bk, bk, cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, cr, cr, bk, cr, cr, cr, cr, cr, cr, cr, cr, bk, cr, cr, cr, cr, cr, cr, cr, cr, bk, cr, cr, cr, cr, cr, cr, bk, bk, bk, cr, cr, cr, cr, cr, cr, cr, gy, bk, cr, cr, cr, cr, cr, cr, cr, gy, gy],
        //Puzzle 5
        [cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, cr, cr, rd, cr, cr, cr, cr, cr, cr, cr, cr, rd, cr, cr, cr, cr, cr, cr, gy, rd, gy, cr, cr, cr, cr, cr, cr, gy, rd, gy, cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, cr, cr, bn, cr, cr, cr, cr, cr, cr, cr, cr, bn, cr, cr, cr, cr, cr, cr, cr, cr, bn],
        //Puzzle 6
        [cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, cr, gy, gy, cr, cr, cr, cr, cr, cr, cr, gy, gy, cr, cr, cr, cr, cr, gy, yw, gy, gy, cr, cr, cr, cr, cr, gy, yw, gy, gy, cr, cr, cr, cr, cr, gy, yw, gy, gy, cr, cr, cr, cr, cr, gy, yw, gy, gy, cr, cr, cr, cr, cr, cr, gy, yw, gy, cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, cr, cr, gy],
        //Puzzle 7
        [cr, cr, cr, cr, cr, cr, cr, cr, bk, cr, cr, cr, cr, cr, cr, cr, gn, bk, cr, cr, cr, cr, cr, cr, bk, bk, bk, cr, cr, cr, cr, cr, cr, bk, bk, bk, cr, cr, cr, cr, cr, cr, bk, bk, bk, cr, cr, cr, cr, cr, bk, bk, bk, bk, cr, cr, cr, cr, cr, cr, bk, bk, bk, cr, cr, cr, cr, cr, cr, bk, bk, bk, cr, cr, cr, cr, cr, cr, bk, bk, bk, cr, cr, cr, cr, cr, cr, bk, rd, bk],
        //Puzzle 8
        [cr, cr, cr, cr, cr, cr, cr, cr, rd, cr, cr, cr, cr, cr, cr, cr, cr, rd, cr, cr, cr, cr, cr, cr, gy, rd, gy, cr, cr, cr, cr, cr, cr, cr, cr, rd, cr, cr, cr, cr, cr, cr, rd, bk, rd, cr, cr, rd, bk, oe, bk, oe, bk, rd, cr, cr, cr, cr, rd, bk, oe, bk, rd, cr, cr, cr, cr, rd, bk, oe, bk, rd, cr, cr, cr, cr, rd, bk, bn, bk, rd, cr, cr, cr, cr, cr, cr, cr, cr, gy],
        //Puzzle 9
        [cr, cr, cr, cr, rd, be, rd, be, rd, cr, cr, cr, cr, rd, be, rd, be, rd, cr, cr, cr, cr, rd, be, rd, be, rd, cr, cr, cr, cr, rd, be, rd, be, rd, cr, cr, cr, cr, cr, cr, be, rd, be, cr, cr, cr, cr, cr, cr, cr, cr, rd, cr, cr, cr, cr, cr, cr, cr, cr, yw, cr, cr, cr, cr, cr, cr, cr, cr, yw, cr, cr, cr, cr, cr, cr, cr, cr, yw, cr, cr, cr, cr, cr, cr, cr, cr, yw],
        //Puzzle 10
        [cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, oe, oe, oe, cr, cr, cr, cr, cr, cr, rd, rd, rd, cr, cr, cr, cr, cr, cr, rd, rd, rd, cr, cr, cr, cr, cr, cr, cr, cr, bn, cr, cr, cr, cr, cr, cr, cr, yw, bn, cr, cr, cr, cr, cr, cr, cr, yw, bn, cr, cr, cr, cr, cr, cr, cr, cr, bn, cr, cr, cr, cr, cr, cr, cr, yw, bn, cr, cr, cr, cr, cr, cr, cr, yw, bn],
        //Puzzle 11
        [cr, cr, cr, cr, cr, cr, cr, cr, gn, cr, cr, cr, cr, cr, cr, cr, gn, rd, cr, cr, cr, cr, cr, cr, cr, cr, gn, cr, cr, cr, cr, cr, cr, gn, rd, gn, cr, cr, cr, cr, cr, cr, gn, rd, gn, cr, cr, cr, cr, cr, cr, cr, rd, gn, cr, cr, cr, cr, cr, cr, gn, rd, gn, cr, cr, cr, cr, gn, rd, gn, rd, gn, cr, cr, cr, cr, cr, cr, cr, cr, bn, cr, cr, cr, cr, cr, cr, cr, cr, bn],
        //Puzzle 12
        [cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, cr, cr, bn, cr, cr, cr, cr, cr, cr, cr, gy, yw, cr, gy, yw, pe, yw, pe, yw, pe, yw, cr, cr, cr, gy, yw, pe, yw, pe, yw, cr, gy, yw, pe, yw, pe, yw, pe, yw, cr, cr, cr, cr, cr, cr, cr, gy, yw, cr, cr, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, cr, cr, gy]]
    
    let puzTopLabels : [[String]] = [
        //Puzzle 1
        ["0", "0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "0", "1", "1", "0", "0", "1", "2", "1", "2", "1", "0", "2", "2", "2", "1", "2", "1", "0", "0", "2", "2", "2", "1", "1", "0", "2", "2", "2", "1", "2", "1", "0", "0", "1", "2", "1", "2", "1", "0", "0", "0", "0", "0", "1", "1", "0", "0", "2", "1", "1", "1", "2", "0", "0", "0", "0", "0", "1", "4"],
        //Puzzle 2
        ["0", "0", "0", "0", "0", "0", "2", "0", "0", "0", "0", "0", "2", "2", "0", "0", "0", "0", "0", "7", "2", "0", "0", "0", "0", "0", "6", "2", "0", "0", "0", "0", "4", "3", "2", "0", "0", "0", "0", "4", "3", "2", "0", "0", "0", "0", "0", "6", "2", "0", "0", "0", "0", "0", "7", "2", "0", "0", "0", "0", "0", "2", "2", "0", "0", "0", "0", "0", "0", "2"],
        //Puzzle 3
        ["0", "0", "0", "0", "0", "1", "2", "0", "0", "0", "0", "0", "1", "1", "0", "0", "0", "0", "3", "2", "1", "0", "0", "0", "2", "2", "2", "1", "0", "0", "0", "2", "2", "3", "1", "0", "0", "0", "2", "2", "2", "1", "0", "0", "0", "1", "3", "2", "1", "0", "0", "0", "0", "0", "1", "1", "0", "0", "0", "0", "0", "1", "2", "0", "0", "0", "0", "0", "0", "0"],
        //Puzzle 4
        ["0", "0", "0", "0", "0", "0", "2", "0", "0", "0", "0", "0", "2", "1", "0", "0", "0", "0", "0", "2", "1", "0", "0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "0", "2", "1", "0", "0", "0", "0", "0", "0", "5", "0", "0", "0", "0", "0", "2", "1", "0", "0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "0", "2", "1", "0", "0", "0", "0", "0", "2", "1"],
        //Puzzle 5
        ["0", "0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "0", "0", "4", "0", "0", "0", "0", "0", "4", "2", "0", "0", "0", "0", "1", "4", "3", "0", "0", "0", "0", "0", "4", "3", "0", "0", "0", "0", "0", "0", "4", "0", "0", "0", "0", "0", "0", "4", "0", "0", "0", "0", "0", "0", "0"],
        //Puzzle 6
        ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "8", "0", "0", "0", "0", "0", "5", "1", "0", "0", "0", "0", "0", "5", "1", "0", "0", "0", "0", "0", "5", "1", "0", "0", "0", "0", "0", "5", "1", "0", "0", "0", "0", "0", "0", "8", "0", "0", "0", "0", "0", "1", "1", "0", "0", "0", "0", "0", "0", "6", "0", "0", "0", "0", "0", "0", "0"],
        //Puzzle 7
        ["0", "0", "0", "0", "1", "1", "8", "0", "0", "0", "0", "1", "1", "1", "0", "0", "1", "1", "2", "1", "1", "0", "0", "0", "1", "1", "1", "1", "0", "0", "0", "1", "3", "2", "1", "0", "0", "0", "1", "1", "1", "3", "0", "0", "0", "1", "1", "2", "1", "0", "0", "1", "1", "1", "1", "1", "0", "0", "0", "1", "1", "1", "1", "0", "0", "0", "0", "0", "0", "10"],
        //Puzzle 8
        ["0", "0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "1", "6", "1", "0", "0", "0", "1", "2", "4", "1", "0", "4", "2", "1", "1", "1", "1", "0", "0", "4", "1", "3", "1", "1", "0", "0", "4", "2", "2", "1", "1", "0", "4", "1", "2", "1", "1", "1", "0", "0", "0", "1", "2", "4", "1", "0", "0", "0", "0", "1", "6", "1", "0", "0", "0", "0", "0", "0", "1"],
        //Puzzle 9
        ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "4", "0", "0", "0", "0", "0", "5", "2", "0", "0", "0", "0", "0", "6", "4", "0", "0", "0", "0", "0", "6", "4", "0", "0", "0", "0", "0", "5", "2", "0", "0", "0", "0", "0", "0", "4", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"],
        //Puzzle 10
        ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1", "2", "1", "2", "0", "1", "2", "1", "2", "1", "2", "0", "0", "0", "1", "2", "1", "2", "0", "1", "2", "1", "2", "1", "2", "0", "0", "0", "1", "2", "1", "2", "0", "1", "2", "1", "2", "1", "2", "0", "0", "0", "1", "2", "1", "2", "0", "0", "0", "0", "0", "0", "6", "0", "0", "0", "0", "0", "0", "0"],
        //Puzzle 11
        ["0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "2", "0", "0", "0", "0", "1", "1", "2", "0", "0", "0", "0", "0", "5", "1", "0", "0", "0", "3", "1", "4", "2", "0", "1", "1", "4", "1", "1", "2", "0", "0", "0", "0", "2", "1", "3", "0", "0", "0", "0", "0", "3", "1", "0", "0", "0", "0", "0", "0", "2", "0", "0", "0", "0", "0", "0", "0"],
        //Puzzle 12
        ["0", "0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "1", "1", "7", "0", "0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "0", "1", "5", "0", "0", "0", "1", "1", "3", "1", "0", "0", "0", "1", "2", "1", "2", "0", "0", "0", "1", "1", "3", "1", "0", "0", "0", "0", "0", "1", "5", "0", "0", "0", "1", "1", "3", "1", "0", "0", "0", "0", "0", "1", "5"]]
    
    let puzTopLabelColors : [[UIColor]] = [
        //Puzzle 1
        [cr, cr, cr, cr, cr, cr, bn, cr, cr, cr, cr, cr, rd, bk, cr, cr, rd, rd, bk, rd, bk, cr, rd, bn, rd, bk, rd, bk, cr, cr, rd, bn, rd, yw, rd, cr, rd, bn, rd, bk, rd, bk, cr, cr, rd, rd, bk, rd, bk, cr, cr, cr, cr, cr, rd, bk, cr, cr, be, yw, gy, bn, gy, cr, cr, cr, cr, cr, be, gy],
        //Puzzle 2
        [cr, cr, cr, cr, cr, cr, be, cr, cr, cr, cr, cr, gy, be, cr, cr, cr, cr, cr, gy, be, cr, cr, cr, cr, cr, gy, be, cr, cr, cr, cr, gy, bk, bn, cr, cr, cr, cr, gy, bk, bn, cr, cr, cr, cr, cr, gy, be, cr, cr, cr, cr, cr, gy, be, cr, cr, cr, cr, cr, gy, be, cr, cr, cr, cr, cr, cr, be],
        //Puzzle 3
        [cr, cr, cr, cr, cr, yw, bk, cr, cr, cr, cr, cr, bk, bn, cr, cr, cr, cr, bk, gy, bn, cr, cr, cr, bk, yw, gy, bn, cr, cr, cr, bk, yw, bk, gy, cr, cr, cr, bk, yw, gy, bn, cr, cr, cr, bk, bk, gy, bn, cr, cr, cr, cr, cr, bk, bn, cr, cr, cr, cr, cr, yw, bk, cr, cr, cr, cr, cr, cr, gy],
        //Puzzle 4
        [cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, bk, gy, cr, cr, cr, cr, cr, bk, bk, cr, cr, cr, cr, cr, cr, bk, cr, cr, cr, cr, cr, bk, bk, cr, cr, cr, cr, cr, cr, bk, cr, cr, cr, cr, cr, bk, bk, cr, cr, cr, cr, cr, cr, bk, cr, cr, cr, cr, cr, bk, bk, cr, cr, cr, cr, cr, bk, gy],
        //Puzzle 5
        [cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, rd, gy, cr, cr, cr, cr, rd, gy, bn, cr, cr, cr, cr, cr, gy, bn, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, gy],
        //Puzzle 6
        [cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, yw, gy, cr, cr, cr, cr, cr, yw, gy, cr, cr, cr, cr, cr, yw, gy, cr, cr, cr, cr, cr, yw, gy, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, gy, gy, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, gy],
        //Puzzle 7
        [cr, cr, cr, cr, bk, gn, bk, cr, cr, cr, cr, bk, bk, bk, cr, cr, bk, bk, bk, bk, bk, cr, cr, cr, bk, bk, bk, bk, cr, cr, cr, bk, bk, bk, bk, cr, cr, cr, bk, bk, bk, bk, cr, cr, cr, bk, bk, bk, bk, cr, cr, bk, bk, bk, bk, bk, cr, cr, cr, bk, bk, bk, rd, cr, cr, cr, cr, cr, cr, bk],
        //Puzzle 8
        [cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, gy, rd, gy, cr, cr, cr, gy, rd, bk, gy, cr, rd, bk, oe, bk, bn, gy, cr, cr, rd, bk, oe, bn, gy, cr, cr, rd, bk, oe, bn, gy, cr, rd, bk, oe, bk, bn, gy, cr, cr, cr, gy, rd, bk, gy, cr, cr, cr, cr, gy, rd, gy, cr, cr, cr, cr, cr, cr, gy],
        //Puzzle 9
        [cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, rd, cr, cr, cr, cr, cr, be, yw, cr, cr, cr, cr, cr, rd, yw, cr, cr, cr, cr, cr, rd, yw, cr, cr, cr, cr, cr, be, yw, cr, cr, cr, cr, cr, cr, rd, cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, gy],
        //Puzzle 10
        [cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, bn, yw, bn, yw, cr, oe, rd, bn, yw, bn, yw, cr, cr, cr, bn, yw, bn, yw, cr, oe, rd, bn, yw, bn, yw, cr, cr, cr, bn, yw, bn, yw, cr, oe, rd, bn, yw, bn, yw, cr, cr, cr, bn, yw, bn, yw, cr, cr, cr, cr, cr, cr, bn, cr, cr, cr, cr, cr, cr, gy],
        //Puzzle 11
        [cr, cr, cr, cr, cr, cr, gy, cr, cr, cr, cr, cr, cr, gn, cr, cr, cr, cr, gn, rd, gn, cr, cr, cr, cr, cr, gn, rd, cr, cr, cr, gn, rd, gn, bn, cr, gn, rd, gn, rd, gn, bn, cr, cr, cr, cr, gn, rd, gn, cr, cr, cr, cr, cr, gn, rd, cr, cr, cr, cr, cr, cr, gn, cr, cr, cr, cr, cr, cr, gy],
        //Puzzle 12
        [cr, cr, cr, cr, cr, cr, bn, cr, cr, cr, cr, gy, bn, gy, cr, cr, cr, cr, cr, cr, bn, cr, cr, cr, cr, cr, bn, yw, cr, cr, cr, bn, yw, pe, yw, cr, cr, cr, bn, yw, pe, yw, cr, cr, cr, bn, yw, pe, yw, cr, cr, cr, cr, cr, bn, yw, cr, cr, cr, bn, yw, pe, yw, cr, cr, cr, cr, cr, bn, yw]]
}

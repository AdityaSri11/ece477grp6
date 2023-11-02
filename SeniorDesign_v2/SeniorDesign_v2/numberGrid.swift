//
//  numberGrid.swift
//  SeniorDesign_v2
//
//  Created by Aditya Srikanth on 10/31/23.
//

import Foundation

let zero: [[Int]] = [
    [1, 1, 1],
    [1, 0, 1],
    [1, 0, 1],
    [1, 0, 1],
    [1, 1, 1]
]

let one: [[Int]] = [
    [0, 0, 1],
    [0, 0, 1],
    [0, 0, 1],
    [0, 0, 1],
    [0, 0, 1]
]

let two: [[Int]] = [
    [1, 1, 1],
    [0, 0, 1],
    [1, 1, 1],
    [1, 0, 0],
    [1, 1, 1]
]

let three: [[Int]] = [
    [1, 1, 1],
    [0, 0, 1],
    [1, 1, 1],
    [0, 0, 1],
    [1, 1, 1]
]

let four: [[Int]] = [
    [1, 0, 1],
    [1, 0, 1],
    [1, 1, 1],
    [0, 0, 1],
    [0, 0, 1]
]

let five: [[Int]] = [
    [1, 1, 1],
    [1, 0, 0],
    [1, 1, 1],
    [0, 0, 1],
    [1, 1, 1]
]

let six: [[Int]] = [
    [1, 1, 1],
    [1, 0, 0],
    [1, 1, 1],
    [1, 0, 1],
    [1, 1, 1]
]

let seven: [[Int]] = [
    [1, 1, 1],
    [0, 0, 1],
    [0, 0, 1],
    [0, 0, 1],
    [0, 0, 1]
]

let eight: [[Int]] = [
    [1, 1, 1],
    [1, 0, 1],
    [1, 1, 1],
    [1, 0, 1],
    [1, 1, 1]
]

let nine: [[Int]] = [
    [1, 1, 1],
    [1, 0, 1],
    [1, 1, 1],
    [0, 0, 1],
    [0, 0, 1]
]

let blank: [[Int]] = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
]

let space: [[Int]] = [
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0],
    [0, 0]
]

let time_demo: [[Int]] = [
  [0,0,1,1,1,1],
  [0,0,1,0,0,1],
  [0,0,1,1,1,1],
  [0,0,1,1,0,0],
  [0,0,1,1,1,1],
  [1,1,1,1,1,1],
  [0,0,1,1,0,0],
  [1,1,1,1,1,1],
  [1,0,0,0,0,1],
  [1,1,1,1,1,1]
]

let temp_demo: [[Int]] = [
  [0,0,1,0,1,1,1,0,1,0,0,1,1,1],
  [0,0,1,0,0,0,1,1,0,1,0,1,0,0],
  [0,0,1,0,1,1,1,0,1,0,0,1,1,1],
  [0,0,1,0,1,0,0,0,0,0,0,1,0,0],
  [0,0,1,0,1,1,1,0,0,0,0,1,0,0]
  
]

let degree_symbol: [[Int]] = [
  [0, 1, 0],
  [1, 0, 1],
  [0, 1, 0],
  [0, 0, 0],
  [0, 0, 0]
]

let letter_F: [[Int]] = [
  [1, 1, 1],
  [1, 0, 0],
  [1, 1, 1],
  [1, 0, 0],
  [1, 0, 0]
]

let sunnyGrid: [[Int]] = [
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 1, 1, 0, 0],
  [0, 1, 1, 1, 1, 0],
  [1, 1, 1, 1, 1, 1],
  [0, 1, 1, 1, 1, 0],
  [0, 0, 1, 1, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0]
]

let cloudySymbol: [[Int]] = [
    [0, 0, 1, 1, 0, 0],
    [0, 1, 1, 1, 1, 0],
    [1, 1, 1, 1, 1, 1],
    [0, 0, 0, 1, 1, 1],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 1, 1, 0, 0],
    [0, 1, 1, 1, 1, 0],
    [1, 1, 1, 1, 1, 1],
    [0, 0, 0, 1, 1, 1],
    [0, 0, 0, 0, 0, 0],
]

let rainySymbol: [[Int]] = [
    [0, 0, 1, 1, 0, 0],
    [0, 1, 1, 1, 1, 0],
    [1, 1, 1, 1, 1, 1],
    [0, 0, 0, 1, 1, 1],
    [0, 0, 0, 0, 0, 0],
    [0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0],
    [0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0],
    [0, 1, 0, 1, 0, 1]
]

let questionMarkSymbol: [[Int]] = [
    [0, 1, 1, 1, 0, 0],
    [1, 0, 0, 0, 1, 0],
    [0, 0, 0, 0, 1, 0],
    [0, 0, 0, 0, 1, 0],
    [0, 0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0, 0],
    [0, 0, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0, 0],
    [0, 1, 0, 1, 0, 0],
    [0, 0, 1, 0, 0, 0]
]

var numbersGrid: [Int: [[Int]]] = [
      
    -1: time_demo,
    -2: temp_demo,
    -3: degree_symbol,
    -4: letter_F,
    -5: space,
    -6: sunnyGrid,
    -7: cloudySymbol,
    -8: rainySymbol,
    -9: questionMarkSymbol,
    -10: blank,
  
    0: zero,
    1: one,
    2: two,
    3: three,
    4: four,
    5: five,
    6: six,
    7: seven,
    8: eight,
    9: nine
  
]

func printNumber(_ number: Int) {
    if let grid = numbersGrid[number] {
        for row in grid {
            let rowString = row.map { $0 == 1 ? "#" : " " }.joined()
            print(rowString)
        }
    } else {
        print("Invalid number")
    }
}


//func main(){
//  printNumber(-9)
//
//}
//
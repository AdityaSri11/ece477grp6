//
//  CustomGridViewController.swift
//  SeniorDesign_v2
//
//  Created by Aditya Srikanth on 11/1/23.
//

import UIKit

class CustomGridViewController: UIViewController {
  
  var updateGrid = [[Int]](repeating: [Int](repeating: 0, count: 6), count: 10)
  var resetGrid = [[Int]](repeating: [Int](repeating: 0, count: 6), count: 10)
  var gold = #colorLiteral(red: 0.8078431373, green: 0.7215686275, blue: 0.5333333333, alpha: 1)
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func handleButtonInteraction(_ button: UIButton, row: Int, column: Int) {
    if button.tintColor == UIColor.black {
      button.tintColor = gold
      updateGrid[row][column] = 1
    } else if button.tintColor == gold {
      button.tintColor = UIColor.black
      updateGrid[row][column] = 0
    }
    
  }
  
  @IBOutlet var b0_0: UIButton!
  @IBOutlet var b0_1: UIButton!
  @IBOutlet var b0_2: UIButton!
  @IBOutlet var b0_3: UIButton!
  @IBOutlet var b0_4: UIButton!
  @IBOutlet var b0_5: UIButton!
  
  
  @IBAction func handler_b0_0(_ sender: UIButton) {
    handleButtonInteraction(sender, row: 0, column: 0)
  }
  
  @IBAction func handler_b0_1(_ sender: UIButton) {
    handleButtonInteraction(sender, row: 0, column: 1)
  }
  
  @IBAction func handler_b0_2(_ sender: UIButton) {
    handleButtonInteraction(sender, row: 0, column: 2)
  }
  
  @IBAction func handler_b0_3(_ sender: UIButton) {
    handleButtonInteraction(sender, row: 0, column: 3)
  }
  
  @IBAction func handler_b0_4(_ sender: UIButton) {
    handleButtonInteraction(sender, row: 0, column: 4)
  }
  
  @IBAction func handler_b0_5(_ sender: UIButton) {
    handleButtonInteraction(sender, row: 0, column: 5)
  }
  
  @IBOutlet var b1_0: UIButton!
  @IBOutlet var b1_1: UIButton!
  @IBOutlet var b1_2: UIButton!
  @IBOutlet var b1_3: UIButton!
  @IBOutlet var b1_4: UIButton!
  @IBOutlet var b1_5: UIButton!
  
  @IBAction func handler_b1_0(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 1, column: 0)
  }
  
  @IBAction func handler_b1_1(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 1, column: 1)
  }

  @IBAction func handler_b1_2(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 1, column: 2)
  }

  @IBAction func handler_b1_3(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 1, column: 3)
  }

  @IBAction func handler_b1_4(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 1, column: 4)
  }

  @IBAction func handler_b1_5(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 1, column: 5)
  }

  @IBOutlet var b2_0: UIButton!
  @IBOutlet var b2_1: UIButton!
  @IBOutlet var b2_2: UIButton!
  @IBOutlet var b2_3: UIButton!
  @IBOutlet var b2_4: UIButton!
  @IBOutlet var b2_5: UIButton!
  
  @IBAction func handler_b2_0(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 2, column: 0)
  }

  @IBAction func handler_b2_1(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 2, column: 1)
  }

  @IBAction func handler_b2_2(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 2, column: 2)
  }

  @IBAction func handler_b2_3(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 2, column: 3)
  }

  @IBAction func handler_b2_4(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 2, column: 4)
  }

  @IBAction func handler_b2_5(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 2, column: 5)
  }
  
  @IBOutlet var b3_0: UIButton!
  @IBOutlet var b3_1: UIButton!
  @IBOutlet var b3_2: UIButton!
  @IBOutlet var b3_3: UIButton!
  @IBOutlet var b3_4: UIButton!
  @IBOutlet var b3_5: UIButton!

  @IBAction func handler_b3_0(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 3, column: 0)
  }

  @IBAction func handler_b3_1(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 3, column: 1)
  }

  @IBAction func handler_b3_2(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 3, column: 2)
  }

  @IBAction func handler_b3_3(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 3, column: 3)
  }

  @IBAction func handler_b3_4(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 3, column: 4)
  }

  @IBAction func handler_b3_5(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 3, column: 5)
  }

  @IBOutlet var b4_0: UIButton!
  @IBOutlet var b4_1: UIButton!
  @IBOutlet var b4_2: UIButton!
  @IBOutlet var b4_3: UIButton!
  @IBOutlet var b4_4: UIButton!
  @IBOutlet var b4_5: UIButton!

  
  @IBAction func handler_b4_0(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 4, column: 0)
  }

  @IBAction func handler_b4_1(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 4, column: 1)
  }

  @IBAction func handler_b4_2(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 4, column: 2)
  }

  @IBAction func handler_b4_3(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 4, column: 3)
  }

  @IBAction func handler_b4_4(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 4, column: 4)
  }

  @IBAction func handler_b4_5(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 4, column: 5)
  }
  
  @IBOutlet var b5_0: UIButton!
  @IBOutlet var b5_1: UIButton!
  @IBOutlet var b5_2: UIButton!
  @IBOutlet var b5_3: UIButton!
  @IBOutlet var b5_4: UIButton!
  @IBOutlet var b5_5: UIButton!

  @IBAction func handler_b5_0(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 5, column: 0)
  }

  @IBAction func handler_b5_1(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 5, column: 1)
  }

  @IBAction func handler_b5_2(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 5, column: 2)
  }

  @IBAction func handler_b5_3(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 5, column: 3)
  }

  @IBAction func handler_b5_4(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 5, column: 4)
  }

  @IBAction func handler_b5_5(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 5, column: 5)
  }
  
  @IBOutlet var b6_0: UIButton!
  @IBOutlet var b6_1: UIButton!
  @IBOutlet var b6_2: UIButton!
  @IBOutlet var b6_3: UIButton!
  @IBOutlet var b6_4: UIButton!
  @IBOutlet var b6_5: UIButton!
  
  @IBAction func handler_b6_0(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 6, column: 0)
  }

  @IBAction func handler_b6_1(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 6, column: 1)
  }

  @IBAction func handler_b6_2(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 6, column: 2)
  }

  @IBAction func handler_b6_3(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 6, column: 3)
  }

  @IBAction func handler_b6_4(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 6, column: 4)
  }

  @IBAction func handler_b6_5(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 6, column: 5)
  }
  
  @IBOutlet var b7_0: UIButton!
  @IBOutlet var b7_1: UIButton!
  @IBOutlet var b7_2: UIButton!
  @IBOutlet var b7_3: UIButton!
  @IBOutlet var b7_4: UIButton!
  @IBOutlet var b7_5: UIButton!
  
  @IBAction func handler_b7_0(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 7, column: 0)
  }

  @IBAction func handler_b7_1(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 7, column: 1)
  }

  @IBAction func handler_b7_2(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 7, column: 2)
  }

  @IBAction func handler_b7_3(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 7, column: 3)
  }

  @IBAction func handler_b7_4(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 7, column: 4)
  }

  @IBAction func handler_b7_5(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 7, column: 5)
  }
  
  @IBOutlet var b8_0: UIButton!
  @IBOutlet var b8_1: UIButton!
  @IBOutlet var b8_2: UIButton!
  @IBOutlet var b8_3: UIButton!
  @IBOutlet var b8_4: UIButton!
  @IBOutlet var b8_5: UIButton!
  
  @IBAction func handler_b8_0(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 8, column: 0)
  }

  @IBAction func handler_b8_1(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 8, column: 1)
  }

  @IBAction func handler_b8_2(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 8, column: 2)
  }

  @IBAction func handler_b8_3(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 8, column: 3)
  }

  @IBAction func handler_b8_4(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 8, column: 4)
  }

  @IBAction func handler_b8_5(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 8, column: 5)
  }
  
  @IBOutlet var b9_0: UIButton!
  @IBOutlet var b9_1: UIButton!
  @IBOutlet var b9_2: UIButton!
  @IBOutlet var b9_3: UIButton!
  @IBOutlet var b9_4: UIButton!
  @IBOutlet var b9_5: UIButton!
  
  @IBAction func handler_b9_0(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 9, column: 0)
  }

  @IBAction func handler_b9_1(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 9, column: 1)
  }

  @IBAction func handler_b9_2(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 9, column: 2)
  }

  @IBAction func handler_b9_3(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 9, column: 3)
  }

  @IBAction func handler_b9_4(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 9, column: 4)
  }

  @IBAction func handler_b9_5(_ sender: UIButton) {
      handleButtonInteraction(sender, row: 9, column: 5)
  }
    
  @IBOutlet var clear_button: UIButton!
  @IBOutlet var submit_button: UIButton!
  
  @IBAction func clear_button_handler() {
    updateGrid = resetGrid;
    
    b0_0.tintColor = UIColor.black
    b0_1.tintColor = UIColor.black
    b0_2.tintColor = UIColor.black
    b0_3.tintColor = UIColor.black
    b0_4.tintColor = UIColor.black
    b0_5.tintColor = UIColor.black

    b1_0.tintColor = UIColor.black
    b1_1.tintColor = UIColor.black
    b1_2.tintColor = UIColor.black
    b1_3.tintColor = UIColor.black
    b1_4.tintColor = UIColor.black
    b1_5.tintColor = UIColor.black

    b2_0.tintColor = UIColor.black
    b2_1.tintColor = UIColor.black
    b2_2.tintColor = UIColor.black
    b2_3.tintColor = UIColor.black
    b2_4.tintColor = UIColor.black
    b2_5.tintColor = UIColor.black

    b3_0.tintColor = UIColor.black
    b3_1.tintColor = UIColor.black
    b3_2.tintColor = UIColor.black
    b3_3.tintColor = UIColor.black
    b3_4.tintColor = UIColor.black
    b3_5.tintColor = UIColor.black

    b4_0.tintColor = UIColor.black
    b4_1.tintColor = UIColor.black
    b4_2.tintColor = UIColor.black
    b4_3.tintColor = UIColor.black
    b4_4.tintColor = UIColor.black
    b4_5.tintColor = UIColor.black

    b5_0.tintColor = UIColor.black
    b5_1.tintColor = UIColor.black
    b5_2.tintColor = UIColor.black
    b5_3.tintColor = UIColor.black
    b5_4.tintColor = UIColor.black
    b5_5.tintColor = UIColor.black

    b6_0.tintColor = UIColor.black
    b6_1.tintColor = UIColor.black
    b6_2.tintColor = UIColor.black
    b6_3.tintColor = UIColor.black
    b6_4.tintColor = UIColor.black
    b6_5.tintColor = UIColor.black

    b7_0.tintColor = UIColor.black
    b7_1.tintColor = UIColor.black
    b7_2.tintColor = UIColor.black
    b7_3.tintColor = UIColor.black
    b7_4.tintColor = UIColor.black
    b7_5.tintColor = UIColor.black

    b8_0.tintColor = UIColor.black
    b8_1.tintColor = UIColor.black
    b8_2.tintColor = UIColor.black
    b8_3.tintColor = UIColor.black
    b8_4.tintColor = UIColor.black
    b8_5.tintColor = UIColor.black

    b9_0.tintColor = UIColor.black
    b9_1.tintColor = UIColor.black
    b9_2.tintColor = UIColor.black
    b9_3.tintColor = UIColor.black
    b9_4.tintColor = UIColor.black
    b9_5.tintColor = UIColor.black
  }
  
}

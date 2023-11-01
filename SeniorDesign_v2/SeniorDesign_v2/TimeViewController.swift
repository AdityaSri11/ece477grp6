//
//  TimeViewController.swift
//  SeniorDesign_v2
//
//  Created by Aditya Srikanth on 11/1/23.
//

import UIKit

class TimeViewController: UIViewController {
  
  @IBOutlet var clock_24: UISwitch!
  @IBOutlet var clock_12: UISwitch!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    clock_24.isOn = false
    clock_12.isOn = false
  }
  
  func process_formatted_time(_ integersFound: [Int]) {
    
    var hour_grid: [[Int]] = []
    var min_grid: [[Int]] = []
    
    if integersFound.count == 4{
      
      if let h1_grid = numbersGrid[integersFound[0]], let h2_grid = numbersGrid[integersFound[1]]{
        for i in 0..<5 {
          let row = h1_grid[i] + h2_grid[i];
          hour_grid.append(row);
        }
      }
      
      if let m1_grid = numbersGrid[integersFound[2]], let m2_grid = numbersGrid[integersFound[3]]{
        for i in 0..<5 {
          let row = m1_grid[i] + m2_grid[i];
          min_grid.append(row);
        }
      }
      
      //        for row in complete_grid{
      //          print(row)
      //        }
    } else if integersFound.count == 3 {
      if let h1_grid = numbersGrid[-10], let h2_grid = numbersGrid[integersFound[0]]{
        for i in 0..<5 {
          let row = h1_grid[i] + h2_grid[i];
          hour_grid.append(row);
        }
      }
      if let m1_grid = numbersGrid[integersFound[1]], let m2_grid = numbersGrid[integersFound[2]]{
        for i in 0..<5 {
          let row = m1_grid[i] + m2_grid[i];
          min_grid.append(row);
        }
      }
    }
    
    var complete_grid: [[Int]] = []
    complete_grid = hour_grid + min_grid

    send_dataMap(complete_grid)
  }
  
  @IBAction func clock_24_control(_ switch2: UISwitch) {
    if switch2.isOn{
      clock_12.isOn = false
      weatherAPI()
      
      var integersFound = [Int]()
      
      let time_24 = return_time_24()
      print(time_24)
      
      for char in time_24 {
        if let intValue = Int(String(char)) {
          integersFound.append(intValue)
        }
      }
      
      process_formatted_time(integersFound)
    }
  }
  
  @IBAction func clock_12_control(_ switch1: UISwitch) {
    if switch1.isOn{
      clock_24.isOn = false
      weatherAPI()
      
      var integersFound = [Int]()
      
      let time_12 = return_time_12()
      print(time_12)
      
      for char in time_12 {
        if let intValue = Int(String(char)) {
          integersFound.append(intValue)
        }
      }
      
      process_formatted_time(integersFound)
    }
  }
}

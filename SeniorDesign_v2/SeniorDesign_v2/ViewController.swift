//
//  ViewController.swift
//  SeniorDesign_v2
//
//  Created by Aditya Srikanth on 10/31/23.
//

import UIKit

var gold = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)

class ViewController: UIViewController {
  
  @IBOutlet var text_weather: UISwitch!
  @IBOutlet var symbol_weather: UISwitch!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func text_weather_switch_control(_ switch1: UISwitch) {
    if switch1.isOn {
      weatherAPI();
      symbol_weather.isOn = false;
      let weather_string = return_weatherText()
      
      if let number = Int(weather_string) {
        
        let hundredsDigit = number / 100
        let tensDigit = (number / 10) % 10
        let onesDigit = number % 10
        
        var concatenatedGrid: [[Int]] = []
        
        // For single digit tempretures
        if hundredsDigit == 0 && tensDigit == 0 {
          
          if let ones_grid = numbersGrid[onesDigit] {
            
            for i in 0..<5 {
              let row = ones_grid[i];
              concatenatedGrid.append(row);
            }
          }
          
        } else if hundredsDigit == 0 { // Double digit tempretures
          
          if let tens_grid = numbersGrid[tensDigit], let ones_grid = numbersGrid[onesDigit], let space_grid = numbersGrid[10] {
            
            for i in 0..<5 {
              let row = tens_grid[i] + space_grid[i] + ones_grid[i];
              concatenatedGrid.append(row);
            }
          }
            
        } else { // Triple digit tempretures
          
          if let hundred_grid = numbersGrid[hundredsDigit], let tens_grid = numbersGrid[tensDigit], let ones_grid = numbersGrid[onesDigit], let space_grid = numbersGrid[10] {
            
            for i in 0..<5 {
              let row = hundred_grid[i] + space_grid[i] + tens_grid[i] + space_grid[i] + ones_grid[i];
              concatenatedGrid.append(row);
            }
            
          }
          
        }
        
//        print(weather_string);
//        for row in concatenatedGrid {
//                print(row)
//        }
        
      } 
    }
  }
  
  @IBAction func symbol_weather_control(_ switch2: UISwitch) {
    if switch2.isOn {
      text_weather.isOn = false;
      print("Weather Symbol: " , return_symbol_test());
      
    }
  }
  
}



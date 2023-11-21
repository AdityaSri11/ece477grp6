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
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    text_weather.isOn = false
    symbol_weather.isOn = false
  }
  
  @IBAction func text_weather_switch_control(_ switch1: UISwitch) {
    if switch1.isOn {
      weatherAPI();
      symbol_weather.isOn = false;
      let weather_string = return_weatherText()
      
      if let number = Int(weather_string) {
        
        var hundredsDigit = number / 100
        var tensDigit = (number / 10) % 10
        var onesDigit = number % 10
        
        if hundredsDigit != 0{
          hundredsDigit = 0
          tensDigit = 9
          onesDigit = 9
        }
        
        if number < 0 {
          hundredsDigit = 0
          tensDigit = 0
          onesDigit = 0
        }
        
        var temprature_grid: [[Int]] = []
        
        if let tens_grid = numbersGrid[tensDigit], let ones_grid = numbersGrid[onesDigit] {
          for i in 0..<5 {
            let row = tens_grid[i] + ones_grid[i];
            temprature_grid.append(row);
          }
        }
        
        var symbol_grid: [[Int]] = []
        
        if let degree_grid = numbersGrid[-3], let F_grid = numbersGrid[-4] {
          for i in 0..<5 {
            let row = degree_grid[i] + F_grid[i];
            symbol_grid.append(row);
          }
        }
        
        var complete_grid: [[Int]] = []
        complete_grid = temprature_grid + symbol_grid
        print(complete_grid)
//        send_dataMap(complete_grid)
        test_esp();
      } 
    }
  }
  
  @IBAction func symbol_weather_control(_ switch2: UISwitch) {
    if switch2.isOn {
      text_weather.isOn = false;
      weatherAPI();
      
      var completed_grid: [[Int]] = [];
      
      let weather_symbol = return_symbol_test()
      
      switch weather_symbol {
      case "☀️":
        if let sunny_grid = numbersGrid[-6]{
          completed_grid = sunny_grid
        }
      case "☁️":
        if let cloudy_grid = numbersGrid[-7]{
          completed_grid = cloudy_grid
        }
      case "🌧️":
        if let precip_grid = numbersGrid[-8]{
          completed_grid = precip_grid
        }
      default:
        if let qmark_grid = numbersGrid[-9]{
          completed_grid = qmark_grid
        }
      }
      print(completed_grid)
      send_dataMap(completed_grid)
      
    }
  }
  
}



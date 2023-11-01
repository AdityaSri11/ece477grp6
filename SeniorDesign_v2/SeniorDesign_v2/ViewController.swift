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
      print("Weather Text: " , return_weatherText());
//      print("Weather text is switched ON");
    }
  }
  
  @IBAction func symbol_weather_control(_ switch2: UISwitch) {
    if switch2.isOn {
      text_weather.isOn = false;
      print("Weather Symbol: " , return_symbol_test());
//      print("Weather symbol is switched ON");
    }
  }
  
}



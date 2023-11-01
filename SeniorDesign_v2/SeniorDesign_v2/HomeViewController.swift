//
//  HomeViewController.swift
//  SeniorDesign_v2
//
//  Created by Aditya Srikanth on 10/31/23.
//

import UIKit


class HomeViewController: UIViewController {
  
  @IBOutlet var get_started_switch: UIButton!
  
  override func viewDidLoad() {
    
    let gold_color = UIColor(hex: 0x373A36);
    
    get_started_switch.layer.cornerRadius = 12;
    get_started_switch.layer.borderWidth = 1.5;
    get_started_switch.layer.borderColor = gold_color.cgColor;
    get_started_switch.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    super.viewDidLoad()
    
  }
  
}

// Helper function for converting between HEX and RGB
extension UIColor {
  convenience init(hex: UInt) {
    let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
    let blue = CGFloat(hex & 0x0000FF) / 255.0
    
    self.init(red: red, green: green, blue: blue, alpha: 1.0)
  }
}


//    @IBAction func didClickButton() {
//      let vc = storyboard?.instantiateViewController(identifier: "weather") as! ViewController
//      present(vc, animated: true)
//    }
//

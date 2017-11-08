//
//  ViewController.swift
//  Example
//
//  Created by Leandro Linardos on 08/11/2017.
//  Copyright © 2017 Codika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var imageViewIsTappableSwitch: UISwitch!
  
  @IBOutlet weak var redView: UIView!
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  
  var imageViewTap: Tap!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    Tap.on(view: redView) {
      self.showAlertForTapOnView(named: "redView")
    }
    
    Tap.on(view: label) {
      self.showAlertForTapOnView(named: "label")
    }
    
    imageViewTap = Tap.on(view: imageView) {
      self.showAlertForTapOnView(named: "imageView")
    }
    imageViewIsTappableSwitch.isOn = imageViewTap.isEnabled
  }
  
  @IBAction func onSwitchValueChanged(_ sender: UISwitch) {
     imageViewTap.isEnabled = imageViewIsTappableSwitch.isOn
  }
  
  func showAlertForTapOnView(named viewName: String) {
    let alertController = UIAlertController(title: "Tap", message: "Tap on \(viewName)", preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
    self.present(alertController, animated: true, completion: nil);
  }
  
}


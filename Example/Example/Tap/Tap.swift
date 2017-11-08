//
//  Tap.swift
//  Example
//
//  Created by Leandro Linardos on 08/11/2017.
//  Copyright © 2017 Codika. All rights reserved.
//

import UIKit

class Tap {
  private static var instances: [Tap] = []
  
  private weak var view: UIView?
  private var action: () -> Void
  private var tapGesture: UITapGestureRecognizer
  
  @discardableResult static func on(view: UIView, fires action: @escaping ()->()) -> Tap {
    let tap = Tap(view: view, action: action)
    instances.append(tap)
    instances = instances.filter { $0.view != nil }
    return tap
  }
  
  var isEnabled: Bool {
    set { tapGesture.isEnabled = newValue }
    get { return tapGesture.isEnabled }
  }
  
  private init(view: UIView, action: @escaping () -> Void) {
    self.view = view
    self.action = action
    self.tapGesture = UITapGestureRecognizer()
    
    tapGesture.addTarget(self, action: #selector(Tap.onTap(_:)))
    view.addGestureRecognizer(tapGesture)
    
    view.isUserInteractionEnabled = true
  }
  
  @objc private func onTap(_ gesture: UIGestureRecognizer) {
    if (gesture.state == .ended) {
      fireAction()
    }
  }
  
  private func fireAction() {
    action()
  }
  
}

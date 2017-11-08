//: A UIKit based Playground for presenting user interface

import UIKit
import ObjectiveC
import PlaygroundSupport

private class TappableAction {
  private var action: () -> Void
  
  init(action: @escaping () -> Void) {
    self.action = action
  }
  
  @objc func fireAction() {
    action()
  }
}

protocol Tappable { }

extension UIView: Tappable {}

extension Tappable where Self: UIView {
  func onTap(fire action: @escaping () -> Void) {
    let action = TappableAction(action: action)
    
    let tapGesture = UITapGestureRecognizer(target: action, action: #selector(TappableAction.fireAction))
    self.addGestureRecognizer(tapGesture)
    
    objc_setAssociatedObject(self, "Tappable_action", action, .OBJC_ASSOCIATION_RETAIN)
  }
}

class MyViewController : UIViewController {
  var redView: UIView!
  
  override func loadView() {
    view = UIView()
    view.backgroundColor = .white
    
    redView = UIView()
    redView.backgroundColor = .red
    redView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    redView.center = view.center
    redView.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin]
    view.addSubview(redView)
    
    redView.onTap {
      print("Tap on red view")
    }
  }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class Tap {
  private var view: UIView
  private var action: () -> Void
  
  init(view: UIView, action: @escaping () -> Void) {
    self.view = view
    self.action = action
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
    view.addGestureRecognizer(tapGesture)
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

class MyViewController : UIViewController {
  var tapOnRedView: Tap!
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
    
    tapOnRedView = Tap(view: redView, action: {
      print("Tap on red view")
    })
  }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


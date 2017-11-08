//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class TappableView: UIView {
  
  var onTapAction: (() -> Void)?
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  func commonInit() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
    self.addGestureRecognizer(tapGesture)
  }
  
  @objc func onTap(_ gesture: UIGestureRecognizer) {
    onTapAction?()
  }
}

class MyViewController : UIViewController {
  var redView: TappableView!
  
  override func loadView() {
    let view = TappableView()
    view.backgroundColor = .white
    
    redView = TappableView()
    redView.backgroundColor = .red
    redView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    redView.center = view.center
    redView.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin]
    
    view.addSubview(redView)
    self.view = view
    
    redView.onTapAction = {
      print("Tap on red view")
    }
  }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


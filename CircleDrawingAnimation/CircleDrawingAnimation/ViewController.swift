//
//  ViewController.swift
//  CircleDrawingAnimation
//
//  Created by Michael Mellinger on 5/26/16.
//

import UIKit

class ViewController: UIViewController {

    func toRadians(_ degrees:CGFloat) -> CGFloat {
        return degrees * CGFloat(M_PI)/180
    }
    
    func addAnimatedCircleWithArc(){
        
        let layer = CAShapeLayer()
        
        let radius:CGFloat = 50
        let center = CGPoint(x: 100, y: 350)
        
        let startAngle:CGFloat = toRadians(0)
        let endAngle:CGFloat = toRadians(360)
        
        let clockwise = true
        
        layer.path = UIBezierPath(arcCenter: center,
                                  radius: radius,
                                  startAngle: startAngle,
                                  endAngle: endAngle,
                                  clockwise: clockwise).cgPath
        
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.red.cgColor
        layer.lineWidth = 1
        
        view.layer.addSublayer(layer)
        
        let drawAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawAnimation.repeatCount = 1.0
        
        drawAnimation.fromValue = 0
        drawAnimation.toValue = 1
        
        drawAnimation.duration = 5.0
        
        drawAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        layer.add(drawAnimation, forKey: "drawCircleAnimation")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        addAnimatedCircleWithArc()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


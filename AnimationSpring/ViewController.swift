//
//  ViewController.swift
//  AnimationSpring
//
//  Created by Javid Poornasir on 3/12/18.
//  Copyright © 2018 Javid Poornasir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var gestureView: UIView!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var springDampingSlider: UISlider!
    @IBOutlet weak var springVelocitySlider: UISlider!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var dampingLabel: UILabel!
    @IBOutlet weak var velocityLabel: UILabel!
    @IBOutlet weak var logo_centerYConstraint: NSLayoutConstraint!
    @IBOutlet weak var logo_centerXConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap(_:)))
        self.gestureView.addGestureRecognizer(tapGesture)
        
        self.updateSliderLabel(for: self.durationSlider)
        self.updateSliderLabel(for: self.springDampingSlider)
        self.updateSliderLabel(for: self.springVelocitySlider)
    }

    private func performSpringAnimation(animation: @escaping (() -> Void), reset: @escaping (() -> Void)) {
       
        UIView.animate(withDuration: TimeInterval(self.durationSlider.value/1000.0), delay: 0, usingSpringWithDamping: CGFloat(self.springDampingSlider.value), initialSpringVelocity: CGFloat(self.springVelocitySlider.value), options: [.curveEaseOut], animations: {
            animation()
        }) { (finished: Bool) in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1), execute: {
                reset()
            })
        }
    }
    
    private func updateSliderLabel(for slider: UISlider) {
        switch slider {
        case self.durationSlider:
            self.durationLabel.text = String(format: "%.02f", slider.value/1000)
        case self.springDampingSlider:
            self.dampingLabel.text = String(format: "%.02f", slider.value)
        case self.springVelocitySlider:
            self.velocityLabel.text = String(format: "%.02f", slider.value)
        default:
            break
        }
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
        let whereYouTouched: CGPoint = sender.location(in: self.gestureView)
        self.performSpringAnimation(animation: {
            self.logo_centerXConstraint.constant = whereYouTouched.x - self.gestureView.bounds.width/2.0
            self.logo_centerYConstraint.constant = whereYouTouched.y - self.gestureView.bounds.height/2.0
            self.gestureView.layoutIfNeeded()
        }, reset: {
            self.logo_centerXConstraint.constant = 0
            self.logo_centerYConstraint.constant = 0
            self.gestureView.layoutIfNeeded()
        })
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.updateSliderLabel(for: sender)
    }

}


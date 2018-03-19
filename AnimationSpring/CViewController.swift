//
//  CViewController.swift
//  AnimationSpring
//
//  Created by Javid Poornasir on 3/12/18.
//  Copyright © 2018 Javid Poornasir. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

    var boxView = UIView()
    var lineView = UIView()
    var whiteCircle = UIView()
    
    let imageHeight: CGFloat = 100.0
    let imageWidth: CGFloat = 100.0
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = "C"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boxView.backgroundColor = CustomColors.buildSchoolBlue()
        lineView.backgroundColor = CustomColors.buildSchoolBlue()
        
        whiteCircle.backgroundColor = .white
        
        self.view.addSubview(boxView)
        self.view.addSubview(lineView)
        self.view.addSubview(whiteCircle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.whiteCircle.alpha = 0
    }
    
    override func viewDidLayoutSubviews() {
        // Box appears in center of screen
        self.boxView.frame =  CGRect(x: (self.view.frame.size.width / 2) - (imageWidth / 2) , y: (self.view.frame.size.height / 2) - (imageHeight / 2) - 100 , width: imageWidth, height: imageHeight)
        
        // White circle appears in center of screen
        self.whiteCircle.frame.size = CGSize(width: 50, height: 50)
        self.whiteCircle.layer.cornerRadius = self.whiteCircle.frame.size.width / 2
        self.whiteCircle.center = self.view.center
    }
    
    @IBAction func scaleButtonPressed(_ sender: Any) {
        
        UIView.animate(withDuration: 2.7, animations: {
            
            // Scale object to half its size
            self.whiteCircle.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        }) { (_) in
            
            // Transform object back to original position after animation completes
            self.whiteCircle.transform = .identity
        }
    }
    
    @IBAction func translateButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.7, animations: {
            
            // Moves the position of the object
            self.whiteCircle.transform = CGAffineTransform(translationX: 0, y: -400)
            self.whiteCircle.backgroundColor = CustomColors.buildSchoolBlue()
        }) { (_) in
            
            // Transform the object back to original position
            self.whiteCircle.transform = .identity
            self.whiteCircle.backgroundColor = .white
        }
    }
    
    @IBAction func rotateButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.7, animations: {
            // Rotates object
            self.lineView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2 * 2.0))
        }) { (Void) in
            self.lineView.transform = .identity
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        UIView.animate(withDuration: 0.5, animations: {
            
            self.lineView.alpha = 1
            
            // box turns into a circle
            self.boxView.frame.size = CGSize(width: 130, height: 130)
            self.boxView.layer.cornerRadius = self.boxView.frame.size.width / 2
            self.boxView.center = self.view.center
            
        }) { (Void) in
            
            self.whiteCircle.alpha = 1
            
             self.lineView.frame =  CGRect(x: self.view.frame.origin.x , y: (self.view.frame.size.height / 2) , width: self.view.frame.size.width, height: 8)
        }
    }
}
 

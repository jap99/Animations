//
//  BViewController.swift
//  AnimationSpring
//
//  Created by Javid Poornasir on 3/12/18.
//  Copyright © 2018 Javid Poornasir. All rights reserved.
//

import UIKit

// Animating an array of images

class BViewController: UIViewController {
    
    let myImageView = UIImageView()
    let image1 = UIImage(named: "logo1")!
    let image2 = UIImage(named: "logo2")!
    
    var myView1 = UIView() // the box
    var myView2 = UIView() // the line
    
    let imageWidth: CGFloat = 100.0
    let imageHeight: CGFloat = 100.0
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = "B"
        self.view.backgroundColor = .gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView1.backgroundColor = CustomColors.buildSchoolBlue()
        myView2.backgroundColor = CustomColors.buildSchoolBlue()
        self.view.addSubview(myView1)
        self.view.addSubview(myView2)
        
        myImageView.image = image1
        myImageView.highlightedImage = image2
        
        myImageView.isUserInteractionEnabled = true
        myImageView.isHighlighted = false
        myImageView.animationImages = [image1, image2]
        myImageView.highlightedAnimationImages = [UIImage()]
        myImageView.animationDuration = 1.0
        myImageView.animationRepeatCount = 0
        
        myImageView.contentMode = .scaleToFill
        self.view.addSubview(myImageView)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Box appears in center of screen
        self.myView1.frame =  CGRect(x: (self.view.frame.size.width / 2) - (imageWidth / 2) , y: (self.view.frame.size.height / 2) - (imageHeight / 2) , width: imageWidth, height: imageHeight)
        self.myView2.alpha = 0.0
    }
    
    override func viewDidLayoutSubviews() {
        // Resize the UIImageView and keep it in the center
        self.myImageView.frame = CGRect(x: (self.view.frame.size.width / 2) - (imageWidth / 2), y: (self.view.frame.size.height / 2) - (imageHeight / 2) + 2, width: imageWidth, height: imageHeight)
        
    }
    
    // Touch anywhere on the screen to initiate the animation
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.myView1.frame.size = CGSize(width: 130, height: 130)
            self.myView1.layer.cornerRadius = self.myView1.frame.size.width / 2
            self.myView1.center = self.view.center
            self.myView2.alpha = 1
            self.myImageView.startAnimating()
            
        }) { (_) in
            
            self.myView2.frame =  CGRect(x: self.view.frame.origin.x , y: (self.view.frame.size.height / 2) , width: self.view.frame.size.width, height: 8)
            
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.myImageView.stopAnimating()
    }
    
    
}

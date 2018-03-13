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

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = "B"
        self.view.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        let myImageView = UIImageView()
        
        let image1 = UIImage(named: "logo1")!
        let image2 = UIImage(named: "logo2")!
        
        myImageView.frame = CGRect(x: 100, y: 100, width: 80, height: 80)
        myImageView.image = image1
        myImageView.highlightedImage = image2
        
        myImageView.isUserInteractionEnabled = true
        myImageView.isHighlighted = false
        myImageView.animationImages = [image1, image2]
        myImageView.highlightedAnimationImages = [UIImage()]
        myImageView.animationDuration = 0.5
        myImageView.animationRepeatCount = 0
        
        myImageView.startAnimating()
        
        self.view.addSubview(myImageView)
        
    }

  

}

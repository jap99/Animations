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
        
        myImageView.image = image1
        myImageView.highlightedImage = image2
        
        myImageView.isUserInteractionEnabled = true
        myImageView.isHighlighted = false
        myImageView.animationImages = [image1, image2]
        myImageView.highlightedAnimationImages = [UIImage()]
        myImageView.animationDuration = 0.5
        myImageView.animationRepeatCount = 0
        
        myImageView.startAnimating()
        myImageView.contentMode = .scaleToFill
        self.view.addSubview(myImageView)
    }
    
    override func viewDidLayoutSubviews() {
        // Resize the UIImageView and keep it in the center
        let imageWidth: CGFloat = 100.0
        let imageHeight: CGFloat = 100.0
        self.myImageView.frame = CGRect(x: (self.view.frame.size.width / 2) - (imageWidth / 2), y: (self.view.frame.size.height / 2) - (imageHeight / 2), width: imageWidth, height: imageHeight)

    }

  
   

}

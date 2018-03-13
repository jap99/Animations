//
//  RoundButton.swift
//  AnimationSpring
//
//  Created by Javid Poornasir on 3/12/18.
//  Copyright © 2018 Javid Poornasir. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
     
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
 
}
